---
id: zoxide-cheatsheet
title: zoxide Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,cd,navigation]
---

# zoxide Cheatsheet

**Category:** Smart `cd` Replacement (Rust)  
**Official Docs:** https://github.com/ajeetdsouza/zoxide

## Install
```bash
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
# macOS
brew install zoxide
# Ubuntu
sudo apt install zoxide
```

## Shell Integration (must enable)
```bash
# ~/.bashrc or ~/.zshrc
eval "$(zoxide init bash)"   # or zsh, fish
eval "$(zoxide init --cmd cd zsh)"  # replace cd entirely
```

## Core Commands

| Command | Description |
|---------|-------------|
| `z foo` | Jump to highest frequency dir matching `foo` |
| `z foo bar` | Match `foo` then `bar` — fuzzy on path segments |
| `zi` | Interactive selection (fzf-style) |
| `zoxide query foo` | Show path, don't cd |
| `zoxide add /path` | Add dir to database |
| `zoxide remove /path` | Remove dir from database |
| `zoxide edit` | Edit database |

## Flags
| Flag | Description |
|------|-------------|
| `-i` | Interactive mode |
| `-l` | List all matches, ranked by frequency |
| `-s` | Score (frecency) shown |
| `-x` | Remove current dir from database |
| `--` | Stop parsing flags (for dirs named `-foo`) |

## Key Behaviors
- Tracks **frecency** (frequency + recency), not just frequency
- No exact match required — partial segments work
- `z` alone = `cd ~` (home)
- `z -` = `cd -` (previous)

## Examples
```bash
z prj          # Jump to ~/projects (most visited)
z gi w         # Jump to ~/work/github-repo
zi             # Fzf interactive pick from database
zoxide query -l doc  # List all doc-matched dirs with scores
```

## Database
```bash
zoxide remove ~/old-project    # Forget a project
zoxide edit                    # Manual database edits
```

## Comparison: zoxide vs autojump vs fasd
| Feature | zoxide | autojump | fasd |
|---------|--------|----------|------|
| Frecency | ✅ | ✅ | ✅ |
| Interactive | ✅ (zi) | ❌ | ❌ |
| Shell | All | bash/zsh | All |
| Speed | Fast (Rust) | Slower (Python) | Medium |
| cd override | ✅ | ✅ | ✅ |

Drop-in replacement for `cd` with muscle memory intelligence.