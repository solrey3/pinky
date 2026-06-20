#!/usr/bin/env bash
# wiki-sync.sh — nightly raw→wiki ingestion
# Runs at midnight UTC via cron.
# Detects raw files with no corresponding wiki source and invokes pi to ingest them.

set -euo pipefail

PI="/home/sancho/.local/share/mise/installs/node/lts/bin/pi"
RAW="$HOME/pinky/raw"
WIKI_SOURCES="$HOME/pinky/wiki/sources"
LOG="$HOME/pinky/logs/wiki-sync.log"
MAX_LOG_BYTES=5242880  # 5 MB

mkdir -p "$(dirname "$LOG")"

log() {
  echo "[$(date -u '+%Y-%m-%dT%H:%M:%SZ')] $*" | tee -a "$LOG"
}

# Rotate log if > 5 MB
if [[ -f "$LOG" ]] && (( $(stat -c%s "$LOG") > MAX_LOG_BYTES )); then
  mv "$LOG" "${LOG}.1"
  log "Log rotated."
fi

log "=== wiki-sync start ==="

# --- Find raw files not yet referenced in any wiki source ---
new_files=()
while IFS= read -r f; do
  # Skip: assets dir (config, not content), .html files (duplicate of .md versions)
  [[ "$f" == *"/assets/"* ]] && continue
  [[ "$f" == *.html ]]       && continue

  bname=$(basename "$f")

  # Check 1: filename appears in any source's source_path frontmatter
  if grep -qrl "$bname" "$WIKI_SOURCES/" 2>/dev/null; then
    continue
  fi

  # Check 2: slug-based wiki source exists
  slug=$(echo "${bname%.*}" | tr '[:upper:]' '[:lower:]' | tr '_' '-')
  if [[ -f "$WIKI_SOURCES/${slug}.md" ]]; then
    continue
  fi

  new_files+=("$f")
done < <(find "$RAW" -type f \( -name "*.md" -o -name "*.txt" \) | sort)

if [[ ${#new_files[@]} -eq 0 ]]; then
  log "Nothing new to ingest. Exiting."
  exit 0
fi

log "Found ${#new_files[@]} uningested file(s):"
for f in "${new_files[@]}"; do
  log "  $f"
done

# --- Build the prompt ---
file_list=$(printf -- '- %s\n' "${new_files[@]}")

read -r -d '' PROMPT << 'PROMPT_EOF' || true
Read the wiki-ingest skill at ~/.pi/agent/skills/wiki-ingest/SKILL.md and follow it exactly to ingest each file listed below into ~/pinky/wiki/.

Rules for this run:
- Newsletter files: batch same-week daytime+evening pairs into one source page (treat legacy morning dispatches as daytime; match the existing pattern in wiki/sources/).
- All other file types: create individual source pages.
- Skip any file already covered (double-check before writing).
- Update wiki/index.md and wiki/log.md after all ingestions.

Files to ingest:
PROMPT_EOF

PROMPT="${PROMPT}${file_list}"

# --- Invoke pi in non-interactive print mode ---
log "Invoking pi --print to ingest files..."
"$PI" --print --no-session \
  --provider openrouter \
  --model anthropic/claude-sonnet-4.6 \
  "$PROMPT" 2>&1 | tee -a "$LOG"

# --- Commit and push wiki changes ---
log "Committing wiki changes to git..."
cd "$HOME/pinky"
git add wiki/ logs/wiki-sync.log
if git diff --staged --quiet; then
  log "No wiki changes to commit."
else
  git commit -m "wiki-sync: ingest $(date -u '+%Y-%m-%d')"
  git push
  log "Pushed to origin."
fi

log "=== wiki-sync done ==="
