---
id: stow-cheatsheet
title: stow Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,dotfiles,symlinks]
---

# stow Cheatsheet

**Category:** Symlink Farm Manager (Dotfiles)  
**Official Docs:** https://www.gnu.org/software/stow/manual/stow.html

## Install
```bash
# macOS
brew install stow
# Debian/Ubuntu
sudo apt install stow
# Fedora
sudo dnf install stow
```

## Core Concept

`stow` creates symlinks from a `stow/` directory into `target/` directories, letting you version-control dotfiles in one repo and "install" them into `~/`.

Typical layout:
```
dotfiles/
├── nvim/
│   └── .config/nvim/init.lua
├── zsh/
│   └── .zshrc
├── tmux/
│   └── .tmux.conf
└── stow/
    └── (stow meta files)
```

## Basic Commands

| Command | Description |
|---------|-------------|
| `stow -t ~ nvim` | Symlink `nvim/` contents into `~/` |
| `stow -t ~ -D nvim` | Delete (unlink) `nvim` from `~/` |
| `stow -t ~ -R nvim` | Restow: delete then re-link |
| `stow -t ~ --adopt nvim` | Adopt existing files (copy then link) |
| `stow -t ~ -n nvim` | Dry run (show what it would do) |
| `stow -t ~ -v nvim` | Verbose output |

## Flags

| Flag | Description |
|------|-------------|
| `-t TARGET` | Target directory (default: parent of stow dir) |
| `-d DIR` | Stow directory (default: cwd) |
| `-D` | Delete links |
| `-R` | Restow (delete + link) |
| `-n` | No, simulate (dry run) |
| `-v` | Verbose |
| `--adopt` | Copy existing files into stow dir before linking |
| `--ignore REGEX` | Ignore files matching regex |
| `--no-folding` | Don't fold directories (link files individually) |
| `--dotfiles` | Enable dotfile mode (prefix = `.`) |

## Dotfiles Workflow

```bash
# 1. Create stow directory with dotfiles
cd ~/dotfiles
mkdir nvim zsh tmux

# 2. Place files (note: no leading dot in stow dir)
cp ~/.config/nvim/init.lua nvim/.config/nvim/init.lua
cp ~/.zshrc zsh/.zshrc
cp ~/.tmux.conf tmux/.tmux.conf

# 3. Stow into home
stow -t ~ nvim zsh tmux

# 4. Verify
ls -la ~/.zshrc      # symlink → dotfiles/zsh/.zshrc

# 5. Unstow if needed
stow -t ~ -D zsh
```

## Dotfile Mode (GNU stow 2.3+)

With `--dotfiles`, `dot-foo` becomes `.foo`:
```
dotfiles/zsh/dot-zshrc    → ~/.zshrc
dotfiles/nvim/dot-config/  → ~/.config/
```

```bash
stow -t ~ --dotfiles zsh
```

## Adopting Existing Configs

```bash
# Convert existing files to stow-managed
stow -t ~ --adopt zsh
# Moves ~/.zshrc into dotfiles/zsh/ and links it back
```

## Multi-Host Setup

```bash
# Common + host-specific
stow -t ~ common
stow -t ~ $(hostname)
```

## One-Liners

```bash
# Stow all packages in dir
for dir in */; do stow -t ~ "${dir%/}"; done

# Show what would change
stow -t ~ -n -v zsh

# Clean broken links
find ~ -maxdepth 1 -type l ! -exec test -e {} \; -delete
```

## Comparison: stow vs chezmoi vs yadm

| Feature | stow | chezmoi | yadm |
|---------|------|---------|------|
| Symlinks | ✅ | ❌ (copies) | ✅ |
| Templates | ❌ | ✅ | ❌ |
| Encryption | ❌ | ✅ | ❌ |
| OS-specific | Manual | ✅ | ✅ |
| Git submodules | ✅ | ❌ | ✅ |
| Simplicity | Maximum | Medium | Medium |

> stow is the KISS choice — one symlink farm, zero lock-in, works with any vcs.
