---
id: tokei-cheatsheet
title: tokei Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,stats,analysis]
---

# tokei Cheatsheet

**Category:** Code Statistics (Lines, Comments, Blanks)  
**Official Docs:** https://github.com/XAMPPRocky/tokei

## Install
```bash
# macOS
brew install tokei
# Cargo
cargo install tokei
# Arch
sudo pacman -S tokei
```

## Basic Usage

| Command | Description |
|---------|-------------|
| `tokei` | Stats for current directory |
| `tokei /path` | Stats for specific path |
| `tokei -o json` | JSON output |
| `tokei -o yaml` | YAML output |
| `tokei -o cbor` | CBOR output |

## Flags

| Flag | Description |
|------|-------------|
| `-f` | Show full file paths |
| `-h` | Hidden file inclusion |
| `-i PATTERN` | Include files matching |
| `-e PATTERN` | Exclude files matching |
| `-c` | Compact output (no file list) |
| `-s SORT` | Sort by `lines`, `files`, `code`, `comments`, `blanks` |
| `-o FORMAT` | Output format |
| `--files` | Show per-file stats |

## Examples

```bash
# Current project
tokei

# Specific directory with exclusions
tokei src/ -e vendor/ -e '*.min.js'

# Sort by lines of code
tokei -s code

# JSON for CI pipeline
tokei -o json > stats.json

# Only count certain extensions
tokei --files -i '*.rs' -i '*.toml'

# Compact view for large repos
tokei -c
```

## Output Format

```
===============================================================================
 Language            Files        Lines         Code     Comments       Blanks
===============================================================================
 Rust                   12         2456         1987          234          235
 Markdown                5          890            0          712          178
 TOML                    3          145          121           13           11
-------------------------------------------------------------------------------
 Total                  20         3491         2108          959          424
===============================================================================
```

## Comparison: tokei vs cloc vs scc

| Tool | Language | Speed | Output |
|------|----------|-------|--------|
| tokei | Rust | Very fast | Rich (JSON/YAML/CBOR) |
| cloc | Perl | Medium | Text/CSV/JSON/SQL |
| scc | Go | Very fast | Text/JSON/HTML |

> tokei is the speed king with clean output. Use cloc for broader language support. Use scc for complexity estimates.
