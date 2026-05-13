---
id: tree-cheatsheet
title: tree Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,dirs,filesystem]
---

# tree Cheatsheet

**Category:** Directory Tree Viewer  
**Official Docs:** man tree

## Install
```bash
# macOS
brew install tree
# Debian/Ubuntu
sudo apt install tree
# Fedora
sudo dnf install tree
```

## Basic Usage

| Command | Output |
|---------|--------|
| `tree` | Full tree from cwd |
| `tree /path` | Tree of specific dir |
| `tree -L 2` | Limit depth to 2 |
| `tree -d` | Directories only |
| `tree -a` | Include hidden files |

## Flags

| Flag | Description |
|------|-------------|
| `-L N` | Max display depth |
| `-d` | Directories only |
| `-a` | All files (hidden too) |
| `-f` | Full path prefix |
| `-i` | No indentation lines |
| `-p` | Print file type + permissions |
| `-h` | Human-readable sizes |
| `-s` | Print file size in bytes |
| `-u` | Show owner |
| `-g` | Show group |
| `-D` | Show last modification date |
| `--du` | Show directory sizes (like du) |
| `--dirsfirst` | Directories before files |
| `-I PATTERN` | Ignore glob pattern |
| `-P PATTERN` | Match glob pattern |
| `-o file` | Output to file |

## Filtering Examples

```bash
tree -I 'node_modules|__pycache__|target'     # Skip common build dirs
tree -P '*.md'                                  # Only markdown files
tree -L 3 --dirsfirst                           # Shallow, dirs first
tree -d -L 2                                    # Two levels of dirs only
tree -h --du -L 2                               # Human sizes + dir sizes
```

## JSON / XML Output

```bash
tree -J                   # JSON
tree -X                   # XML
tree --charset ascii      # ASCII art (no Unicode)
```

## One-Liners

```bash
# Quick project overview
tree -L 2 -I 'node_modules|target|dist'

# Show with sizes, sorted
tree -h --du --sort=size -L 2

# Backup structure to file
tree -af > structure.txt

# Markdown-compatible output (indented list)
tree -i -f | sed 's/^/    /'

# Show files changed recently
tree -D -L 2
```

## Comparison: tree vs eza vs ls

| Feature | tree | eza -T | ls |
|---------|------|--------|-----|
| True tree | ✅ | ✅ | ❌ |
| Depth limit | ✅ | ✅ | ❌ |
| Colorized | Basic | Rich | Basic |
| JSON/XML | ✅ | ❌ | ❌ |
| .gitignore aware | ❌ | ✅ | ❌ |
| Icons | ❌ | ✅ | ❌ |

> `tree` is universal and scriptable. `eza -T` is prettier for interactive use.
