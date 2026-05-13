---
id: fd-cheatsheet
title: fd Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,find,search]
---

# fd Cheatsheet

**Category:** User-friendly `find` Replacement  
**Official Docs:** https://github.com/sharkdp/fd

## Install
```bash
# macOS
brew install fd
# Debian/Ubuntu
sudo apt install fd-find    # binary = fdfind on Debian
# Fedora
sudo dnf install fd-find
```

## Basic Usage

| Command | Description |
|---------|-------------|
| `fd file` | Find `file` in current dir |
| `fd '*.py'` | Find all .py files |
| `fd -t f` | Files only |
| `fd -t d node_modules` | Directories only, named node_modules |
| `fd -e py` | All Python files (extension) |
| `fd -H` | Include hidden files |
| `fd -I` | No .gitignore respect (search ignored dirs too) |

## Flags

| Flag | Description |
|------|-------------|
| `-t f` | File type: file |
| `-t d` | File type: directory |
| `-e ext` | Filter by extension |
| `-H` | Hidden files included |
| `-I` | No .gitignore / ignore file respect |
| `-a` | Absolute paths output |
| `-p` | Full-path search (not just filename) |
| `-s` | Case-sensitive |
| `--exclude PATTERN` | Exclude pattern |
| `--changed-within 5min` | Recently modified |
| `--changed-before '2026-01-01'` | Modified before date |
| `-x cmd` | Execute command on results |
| `-0 | xargs -0` | Null-delimited for xargs safety |

## Examples

```bash
# Find and delete .pyc files
fd -e pyc -x rm

# Find and preview
fd -e md | fzf --preview 'cat {}'

# Full path search
fd -p 'src/'| . component

# Absolute paths with size sorting
fd -a -t f | sort -k5 -rh
```

## Comparison: fd vs find

| Feature | fd | find |
|---------|----|------|
| Regex by default | ✅ | ❌ |
| .gitignore aware | ✅ | ❌ |
| Colorized output | ✅ | ❌ |
| Speed | Very fast | Medium |
| GNU portability | ✅ | All |

> On Debian/Ubuntu, the binary is named `fdfind` to avoid a conflict with an existing `fd` tool. Symlink or alias it: `alias fd='fdfind'`.
