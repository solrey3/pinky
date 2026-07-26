#!/usr/bin/env bash
# publish-latest-newsletter.sh — publish the latest Pinky newsletter to GitHub Pages
#
# Writes ~/solrey3.github.io/news/index.md so the latest dispatch is available at:
#   https://solrey3.github.io/news
#
# Usage:
#   scripts/publish-latest-newsletter.sh [path/to/newsletter.md]

set -euo pipefail

PINKY_DIR="${PINKY_DIR:-$HOME/pinky}"
PAGES_DIR="${PAGES_DIR:-$HOME/solrey3.github.io}"
NEWSLETTERS_DIR="$PINKY_DIR/raw/newsletters"
TARGET_DIR="$PAGES_DIR/news"
TARGET="$TARGET_DIR/index.md"
TARGET_REL="news/index.md"

newsletter="${1:-}"
if [[ -z "$newsletter" ]]; then
  newsletter=$(find "$NEWSLETTERS_DIR" -maxdepth 1 -type f -name '*.md' -printf '%T@ %p\n' \
    | sort -n \
    | tail -1 \
    | cut -d' ' -f2-)
fi

if [[ -z "$newsletter" || ! -f "$newsletter" ]]; then
  echo "[publish-news] No newsletter found to publish."
  exit 1
fi

if [[ ! -d "$PAGES_DIR/.git" ]]; then
  echo "[publish-news] GitHub Pages repo not found: $PAGES_DIR"
  exit 1
fi

mkdir -p "$TARGET_DIR"

python3 - "$newsletter" "$TARGET" <<'PY'
from pathlib import Path
import re
import sys

src = Path(sys.argv[1]).resolve()
dst = Path(sys.argv[2]).resolve()
text = src.read_text(encoding="utf-8")

frontmatter = ""
body = text
match = re.match(r"^---\s*\n(.*?)\n---\s*\n?(.*)$", text, re.DOTALL)
if match:
    frontmatter, body = match.groups()

def meta_value(key: str) -> str:
    pattern = rf"^{re.escape(key)}:\s*(.+?)\s*$"
    m = re.search(pattern, frontmatter, re.MULTILINE)
    if not m:
        return ""
    return m.group(1).strip().strip("'\"")

def linkify_bare_urls(markdown: str) -> str:
    """Convert bare URLs to markdown links without touching existing markdown links."""
    url_re = re.compile(r"(?<!\]\()(?<!\()(?<!<)(https?://[^\s)\]>|]+)")
    return url_re.sub(lambda m: f"[{m.group(1)}]({m.group(1)})", markdown)


def sanitize_link_text(markdown: str) -> str:
    """Avoid kramdown treating pipes inside link text as table cells."""
    return re.sub(
        r"\[([^\]\n]*\|[^\]\n]*)\]\(([^)]+)\)",
        lambda m: "[" + m.group(1).replace("|", "—") + "](" + m.group(2) + ")",
        markdown,
    )


def link_market_labels(markdown: str) -> str:
    """Link market table labels to MarketWatch and mortgage rate to Bankrate."""
    links = {
        "S&P 500": "https://www.marketwatch.com/investing/index/spx",
        "Dow 30": "https://www.marketwatch.com/investing/index/djia",
        "Nasdaq": "https://www.marketwatch.com/investing/index/comp",
        "Russell 2000": "https://www.marketwatch.com/investing/index/rut",
        "30-YR Treasury": "https://www.marketwatch.com/investing/bond/tmubmusd30y",
        "90-Day T-Bill": "https://www.marketwatch.com/investing/bond/tmubmusd03m",
        "PHP/USD": "https://www.marketwatch.com/investing/currency/usdphp",
        "EUR/USD": "https://www.marketwatch.com/investing/currency/eurusd",
        "CNY/USD": "https://www.marketwatch.com/investing/currency/usdcny",
        "ONEQ — Fidelity Nasdaq Composite ETF": "https://www.marketwatch.com/investing/fund/oneq",
        "SCHD — Schwab U.S. Dividend Equity ETF": "https://www.marketwatch.com/investing/fund/schd",
        "VXUS — Vanguard Total International Stock ETF": "https://www.marketwatch.com/investing/fund/vxus",
        "VBR — Vanguard Small-Cap Value ETF": "https://www.marketwatch.com/investing/fund/vbr",
        "VNQ — Vanguard Real Estate ETF": "https://www.marketwatch.com/investing/fund/vnq",
        "NVDA": "https://www.marketwatch.com/investing/stock/nvda",
        "TSM": "https://www.marketwatch.com/investing/stock/tsm",
        "AMD": "https://www.marketwatch.com/investing/stock/amd",
        "AMZN": "https://www.marketwatch.com/investing/stock/amzn",
        "NFLX": "https://www.marketwatch.com/investing/stock/nflx",
        "TSLA": "https://www.marketwatch.com/investing/stock/tsla",
        "PYPL": "https://www.marketwatch.com/investing/stock/pypl",
        "BRK.B": "https://www.marketwatch.com/investing/stock/brk.b",
        "AXP": "https://www.marketwatch.com/investing/stock/axp",
        "SCHW": "https://www.marketwatch.com/investing/stock/schw",
        "RL": "https://www.marketwatch.com/investing/stock/rl",
        "COST": "https://www.marketwatch.com/investing/stock/cost",
        "UPS": "https://www.marketwatch.com/investing/stock/ups",
        "Bitcoin": "https://www.marketwatch.com/investing/cryptocurrency/btcusd",
        "Oil (WTI)": "https://www.marketwatch.com/investing/future/cl.1",
    }
    for label, url in links.items():
        markdown = markdown.replace(f"| {label} |", f"| [{label}]({url}) |")
    markdown = re.sub(
        r"(?m)^- 30-Year Fixed Mortgage Rate:",
        "- [30-Year Fixed Mortgage Rate](https://www.bankrate.com/mortgages/30-year-mortgage-rates/):",
        markdown,
    )
    return markdown


def apply_news_preferences(markdown: str) -> str:
    """Apply stable display preferences for the public latest-dispatch page."""
    markdown = re.sub(
        r"(?m)^### Toms River, NJ\n(?!\[Weather\])",
        "### Toms River, NJ\n[Weather](https://wttr.in/Toms+River+NJ) · [Forecast](https://forecast.weather.gov/MapClick.php?lat=39.9537&lon=-74.1979)\n",
        markdown,
    )
    markdown = re.sub(
        r"(?m)^### Makati, Philippines\n(?!\[Weather\])",
        "### Makati, Philippines\n[Weather](https://wttr.in/Makati+Philippines?m) · [Forecast](https://www.pagasa.dost.gov.ph/weather)\n",
        markdown,
    )
    markdown = re.sub(
        r"(?<!\[)Wawa #0937 Toms River, NJ",
        "[Wawa #0937 Toms River, NJ](https://www.wawa.com/locations/937)",
        markdown,
    )
    markdown = re.sub(
        r"(?<!\[)Wawa #0937, 1725 Hooper Ave, Toms River NJ",
        "[Wawa #0937, 1725 Hooper Ave, Toms River NJ](https://www.wawa.com/locations/937)",
        markdown,
    )
    markdown = re.sub(
        r"(?m)^(### 🗞️ Sports Newswire\n)(?!_Sources:)",
        "\\1_Sources: [ESPN Sports](https://www.espn.com/), [NJ Devils](https://www.nhl.com/devils/news), [Tour de France](https://www.letour.fr/en/news), [Cyclingnews](https://www.cyclingnews.com/)_\n\n",
        markdown,
    )
    markdown = re.sub(
        r"(?m)^(### Team Reports\n)(?!_Sources:)",
        "\\1_Sources: [ESPN team schedules](https://www.espn.com/), [NJ Devils schedule](https://www.nhl.com/devils/schedule), [Inter Miami schedule](https://www.intermiamicf.com/schedule/)_\n\n",
        markdown,
    )
    markdown = re.sub(
        r"(?m)^(### Meltzer 5-Star\+ Ratings\n)(?!_Source:)",
        "\\1_Source: [List of professional wrestling matches rated 5 or more stars by Dave Meltzer](https://en.wikipedia.org/wiki/List_of_professional_wrestling_matches_rated_5_or_more_stars_by_Dave_Meltzer)_\n\n",
        markdown,
    )
    lines = [line for line in markdown.splitlines() if not re.match(r"^\|\s*TGT\s*\|", line)]
    return sanitize_link_text(linkify_bare_urls(link_market_labels("\n".join(lines))))


def normalize_tables(markdown: str) -> str:
    """Make pipe tables kramdown-friendly for GitHub Pages."""
    lines = markdown.splitlines()
    normalized = []
    for line in lines:
        stripped = line.lstrip()
        starts_table = stripped.startswith("|")
        previous = normalized[-1] if normalized else ""
        previous_is_table = previous.lstrip().startswith("|")
        if starts_table and previous and not previous_is_table and previous.strip():
            normalized.append("")
        normalized.append(line)
    return "\n".join(normalized)

created = meta_value("created") or "unknown"
source_title = meta_value("title") or src.stem
body = apply_news_preferences(body)
body = normalize_tables(body)
out = f"""---
layout: page
title: Latest Dispatch
permalink: /news/
---

<!-- Auto-generated by ~/pinky/scripts/publish-latest-newsletter.sh. Do not edit by hand. -->

<style>
  .post-content table,
  .post-content table tr,
  .post-content table th,
  .post-content table td {{
    color: #fff7ad !important;
  }}
  .post-content table th,
  .post-content table td {{
    font-weight: 650 !important;
    text-shadow: 0 0 1px #000 !important;
  }}
  .post-content table th {{
    color: #ffffff !important;
    background: #334155 !important;
  }}
  .post-content table tr {{
    background: #1e293b !important;
  }}
  .post-content table tr:nth-child(even) {{
    background: #3b4a60 !important;
  }}
  .post-content table a,
  .post-content table a:visited {{
    color: #7dd3fc !important;
  }}
</style>

_Originally generated: {created}_  
_Source: `{src.name}`_

"""
out += body.rstrip() + "\n"

dst.write_text(out, encoding="utf-8")
print(f"[publish-news] Published {source_title} from {src} to {dst}")
PY

cd "$PAGES_DIR"

if git diff --quiet -- "$TARGET_REL" \
  && git diff --cached --quiet -- "$TARGET_REL" \
  && [[ -z "$(git ls-files --others --exclude-standard -- "$TARGET_REL")" ]]; then
  echo "[publish-news] No Pages changes to commit."
  exit 0
fi

git add "$TARGET_REL"
git commit -m "news: publish latest dispatch"
git pull --rebase origin master
git push origin master

echo "[publish-news] Pushed latest dispatch to GitHub Pages."
