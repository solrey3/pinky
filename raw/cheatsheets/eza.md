---
id: eza-cheatsheet
title: eza Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,ls,file-management]
---

# eza Cheatsheet

**Category:** Modern `ls` Replacement  
**Official Docs:** https://github.com/eza-community/eza

## Install

```bash
# macOS
brew install eza
# Ubuntu
sudo apt install eza  # apt 22.10+ or use cargo/git
# Cargo
sudo cargo install eza
```

## Basic Usage

```bash
eza           # Default listing
eza -l        # Long format
eza -a        # Include hidden files
eza -la       # Long + hidden
eza -T        # Tree view
eza -1        # Single column
eza -lh       # Long, human-readable sizes
```

## High-Utility Flags

| Flag | Effect |
|------|--------|
| `-a` / `-A` | Show all files / all except `.` and `..` |
| `-l` | Long format (permissions, owner, size, date, name) |
| `--icons` | File type icons (requires Nerd Font) |
| `--color` / `--color=auto` | Colorized output (default: auto) |
| `--no-color` | Disable colors |
| `-F` / `--classify` | Append file-type indicator (`*`, `/`, `@`, etc.) |
| `--git` | Show git status in long format |
| `--sort=WORD` | Sort by `name`, `size`, `modified`, `ext`, `acc`, `cr`, `inode` |
| `--reverse` / `-r` | Reverse sort |
| `--tree` / `-T` | Tree mode |
| `--level=N` | Max tree depth |
| `--group-directories-first` | Dirs listed before files |
| `--octal-permissions` | Show octal permissions (e.g. 0755) |
| `-h` / `--header` | Show column headers (long format) |
| `-I PATTERN` | Ignore glob |
| `--no-quotes` | Don't quote filenames |
| `-d` | List directories only (not contents) |

## Built-in Aliases

```bash
alias ls="eza"
alias ll="eza -laF --icons --git"
alias lt="eza -lT --icons --git"
alias lr="eza -l --sort=modified --reverse"
alias lg="eza -la --git --icons"
```

## Tree with Filters

```bash
eza --tree --level=3 src/
eza --tree -I 'node_modules|target' .
eza --tree -I '*.pyc|__pycache__' .
```

## Filters & Queries

```bash
eza -I '*.log' /var/log        # Ignore patterns
eza -ld */                     # Show only directories
eza -lh --sort=size -r         # Sort by size descending
```

## One-Liners

```bash
# Full overview with git integration
eza -lahF --git --icons --group-directories-first

# Quick project structure overview (dots excluded)
eza -lT --level=2 --icons --no-quotes --group-directories-first

# View most recently modified files
eza -lh --sort=modified -r | head -20
```

## Cross-Reference: `ls` vs `eza`

| `ls` | `eza` |
|------|-------|
| `ls -laF` | `eza -laF` (better defaults) |
| `ls --color` | Built-in, smarter |
| N/A (requires `tree`) | `eza -T` |
| N/A (requires `ls -l + column` hack) | `eza --icons` |
| N/A (requires `git status` +grep) | `eza --git` |

Drops as a near-plug-and-play replacement with richer output and a more modern UI straight from the terminal.
