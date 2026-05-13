---
title: yazi
category: cli
docs_url: https://github.com/sxyazi/yazi
created: 2026-05-10
tags: [file-manager, tui, cli, rust, productivity]
---

# yazi Cheatsheet

> Blazing fast terminal file manager written in Rust, based on async I/O. Vim-inspired key bindings, image preview, sync with neovim.

**Official Docs:** [yazi-rs.github.io](https://yazi-rs.github.io)  
**GitHub:** [github.com/sxyazi/yazi](https://github.com/sxyazi/yazi)  
**Platform(s):** macOS, Linux, Windows

---

## Installation

### macOS
```bash
brew install yazi
```

### Linux
```bash
# Prebuilt binary (recommended)
curl --proto '=https' --tlsv1.2 -sSf https://sh.yazi-rs.github.io | sh

# Arch
sudo pacman -S yazi

# Nix
nix-env -iA nixpkgs.yazi
```

### Verify
```bash
yazi --version
```

---

## Quick Start

```bash
yazi                    # Open in current directory
yazi /path/to/dir       # Open in specific directory
```

---

## Configuration

**Config dir:** `~/.config/yazi/`

```bash
~/.config/yazi/
├── yazi.toml           # Main config
├── keymap.toml         # Key bindings
├── theme.toml          # Colors/theme
└── plugins/            # Lua plugins
```

### Example `yazi.toml`
```toml
[manager]
show_hidden = false
sort_by = "alphabetical"
sort_sensitive = false
sort_reverse = false
sort_dir_first = true
linemode = "none"
show_symlink = true

[preview]
tab_size = 2
max_width = 600
max_height = 900
cache_dir = ""
image_filter = "nearest"
image_quality = 75
syntect_theme = ""

[opener]
edit = [
    { run = 'nvim "$@"', block = true },
]
open = [
    { run = 'xdg-open "$@"', desc = "Open" },
]
reveal = [
    { run = 'xdg-open "$(dirname "$1")"', desc = "Reveal" },
]
extract = [
    { run = 'unar "$1"', desc = "Extract here" },
]
play = [
    { run = 'mpv "$@"', orphan = true, desc = "Play" },
]
```

---

## Key Bindings

### Navigation
| Key | Action |
|-----|--------|
| `j` / `↓` | Down |
| `k` / `↑` | Up |
| `h` / `←` | Parent directory |
| `l` / `→` | Enter directory / open file |
| `g` + `g` | Go to top |
| `G` | Go to bottom |
| `~` | Home directory |
| `.` | Toggle hidden files |

### Selection
| Key | Action |
|-----|--------|
| `Space` | Toggle selection |
| `v` | Visual mode (range select) |
| `V` | Toggle visual mode all |
| `Ctrl+a` | Select all |
| `Ctrl+r` | Inverse selection |
| `Esc` | Cancel selection |

### Operations
| Key | Action |
|-----|--------|
| `yy` | Yank (copy) |
| `dd` | Cut |
| `p` | Paste |
| `P` | Paste overwrite |
| `d` + `d` | Trash |
| `D` + `D` | Permanent delete |
| `a` | Create file |
| `A` | Create directory |
| `r` | Rename |
| `R` | Bulk rename |
| `z` | Jump (zoxide/fzf) |
| `/` | Search |
| `?` | Search backwards |
| `n` / `N` | Next/prev search result |
| `s` | Sort menu |
| `:` | Shell command |
| `!` | Shell command (block) |
| `>` | Forward shell output |

### Tabs
| Key | Action |
|-----|--------|
| `t` | New tab |
| `1-9` | Switch tab |
| `[` / `]` | Prev/next tab |
| `{` / `}` | Move tab |

### Preview
| Key | Action |
|-----|--------|
| `i` | Toggle preview |
| `I` | Show image preview |
| `Enter` | Open preview in pager |

---

## Tips

- **Neovim integration:** Use `yazi.nvim` plugin — open yazi inside neovim and sync cwd.
- **Image preview:** Works in Kitty, WezTerm, iTerm2, Ghostty with sixel/iTerm inline images.
- **Plugins:** Lua-based plugin system. Popular: `full-border`, `max-preview`, `smart-enter`.
- **zoxide integration:** `z` key jumps via zoxide history.
- **Bulk rename:** Select files, press `R`, edit names in `$EDITOR`, save to apply.
- **Previewers:** Built-in syntax highlighting, image, video (FFmpeg), PDF, archive.

---
*Generated via cheatsheet skill on 2026-05-10*
