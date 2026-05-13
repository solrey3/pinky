---
title: ripgrep (rg)
category: cli
docs_url: https://github.com/BurntSushi/ripgrep
created: 2026-05-10
tags: [search, grep, cli, regex, performance]
---

# ripgrep (rg) Cheatsheet

> Line-oriented search tool that recursively searches directories for a regex pattern, respecting `.gitignore` by default. Faster than grep/ag/ack.

**Official Docs:** [github.com/BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)  
**User Guide:** [github.com/BurntSushi/ripgrep/blob/master/GUIDE.md](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md)  
**Platform(s):** macOS, Linux, Windows

---

## Installation

### macOS
```bash
brew install ripgrep
```

### Linux
```bash
# Debian/Ubuntu (unstable/sid) — or download .deb from releases
sudo apt install ripgrep

# Fedora
sudo dnf install ripgrep

# Arch
sudo pacman -S ripgrep

# Alpine
apk add ripgrep
```

### Windows
```powershell
scoop install ripgrep
# or
choco install ripgrep
```

### Binary
```bash
curl -LO https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep_x86_64-unknown-linux-musl.tar.gz
tar xzf ripgrep_x86_64-unknown-linux-musl.tar.gz
sudo mv rg /usr/local/bin/
```

### Verify
```bash
rg --version
```

---

## Quick Start

```bash
# Search for "foo" in current directory
rg foo

# Search in specific file type
rg foo --type py

# Search with regex
rg '\bfoo\d+\b'

# Show line numbers and context
rg foo -C 3
```

---

## Command Reference

### Core flags
| Flag | Short | Description |
|------|-------|-------------|
| `--fixed-strings` | `-F` | Treat pattern as literal string |
| `--case-sensitive` | `-s` | Case-sensitive search |
| `--ignore-case` | `-i` | Case-insensitive search |
| `--smart-case` | `-S` | Smart case (default: insensitive if lowercase) |
| `--word-regexp` | `-w` | Match whole words only |
| `--line-regexp` | `-x` | Match whole lines only |
| `--glob` | `-g` | Include/exclude files (e.g., `-g '*.rs'`, `-g '!test/'`) |
| `--type` | `-t` | Search specific file type (e.g., `-t js`, `-t md`) |
| `--type-not` | `-T` | Exclude file type |
| `--files-with-matches` | `-l` | Only list filenames |
| `--files-without-match` | `-L` | Files without match |
| `--count` | `-c` | Count matches per file |
| `--count-matches` | `-n` | Count each match (with line numbers) |
| `--only-matching` | `-o` | Output only matching part |
| `--replace` | `-r` | Replace matches with string |
| `--max-count` | `-m` | Max matches per file |
| `--context` | `-C` | Show N lines of context |
| `--before-context` | `-B` | Lines before match |
| `--after-context` | `-A` | Lines after match |
| `--heading` | | Group matches by file (default on) |
| `--no-heading` | | Don't group by file |
| `--line-number` | `-n` | Show line numbers (default on) |
| `--no-line-number` | `-N` | No line numbers |
| `--with-filename` | `-H` | Always show filename |
| `--no-filename` | `-h` | Never show filename |
| `--hidden` | | Search hidden files (respects .gitignore) |
| `--no-ignore` | | Don't respect .gitignore |
| `--no-ignore-vcs` | | Don't respect VCS ignore files |
| `--follow` | `-L` | Follow symlinks |
| `--max-depth` | `-d` | Max directory depth |
| `--threads` | `-j` | Number of threads |
| `--pretty` | `-p` | Force pretty output (colors, headings) |
| `--vimgrep` | | Output in vim-friendly format |
| `--json` | | JSON output |
| `--color` | | When to use color: auto/always/never |
| `--sort` | | Sort results: path/modified/accessed/created/none |
| `--files` | | List files that would be searched |

---

## Examples

### Basic search
```bash
rg "function " src/
rg -i todo
rg -w main --type rust
```

### Search specific file types
```bash
rg foo -t js -t ts          # JS/TS only
rg foo -T test               # Exclude test directories
rg foo -g '!*.min.js'        # Exclude minified JS
rg foo -g '*.md' -g '!vendor/' # Markdown only, no vendor
```

### Show context
```bash
rg error -C 3                # 3 lines context
rg error -B 2 -A 5           # 2 before, 5 after
```

### List/search filenames
```bash
rg --files                   # List all searchable files
rg -l pattern                # Files containing pattern
rg -L pattern                # Files NOT containing pattern
```

### Replace (dry run + actual)
```bash
rg foo -r bar --dry-run      # Preview replacements
rg foo -r bar --passthrough  # Replace and print all lines
```

### Configuration file
```bash
# ~/.ripgreprc
--smart-case
--glob=!node_modules
--glob=!.git
--glob=!vendor
--colors=line:fg:green
--colors=path:fg:cyan
--colors=match:fg:red
```
Enable: `export RIPGREP_CONFIG_PATH=~/.ripgreprc`

---

## Tips

- ripgrep respects `.gitignore` by default — use `--no-ignore` to override.
- Built-in type definitions cover 100+ file types: `rg --type-list`
- Much faster than `grep -r` because it skips binary files, hidden dirs, and gitignored paths by default.
- Pair with `fzf` for interactive search: `rg --line-number --color=always "" | fzf`
- `--vimgrep` is perfect for vim quickfix lists.
- `--json` enables programmatic parsing: `rg --json foo | jq -s '.[] | select(.type == "match")'`

---
*Generated via cheatsheet skill on 2026-05-10*
