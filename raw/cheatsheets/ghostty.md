---
title: Ghostty
category: cli
docs_url: https://ghostty.org/docs
created: "2026-05-10"
tags: [terminal, gpu, zig, cli, emulator, macos]
---

# Ghostty Cheatsheet

> Fast, feature-rich terminal emulator built with Zig. GPU-accelerated, first-class macOS and Linux support. Modern terminal features with extensive configurability.

**Official Docs:** https://ghostty.org/docs  
**GitHub:** https://github.com/ghostty-org/ghostty  
**Platform(s):** macOS, Linux

---

## Installation

### macOS
```bash
brew install --cask ghostty
# or download from https://ghostty.org/download
```

### Linux
```bash
# Arch (AUR)
yay -S ghostty
# or
paru -S ghostty

# Fedora (COPR)
sudo dnf copr enable pgdev/ghostty
sudo dnf install ghostty

# Nix
nix-env -iA nixpkgs.ghostty

# Or from source (requires Zig)
git clone https://github.com/ghostty-org/ghostty.git
cd ghostty && zig build -Doptimize=ReleaseFast
```

### Verify
```bash
ghostty --version
```

---

## Setup

### Config location
```bash
# macOS
~/Library/Application Support/com.mitchellh.ghostty/config
# or
~/.config/ghostty/config

# Linux
~/.config/ghostty/config
```

### Basic config
```ini
# Font
font-family = "JetBrainsMono Nerd Font"
font-size = 13
font-feature = +liga

# Appearance
theme = catppuccin-mocha
background = #1e1e2e
background-opacity = 0.95
background-blur-radius = 20
window-decoration = true
titlebar-style = tabs
window-step-resize = true

# Window
window-padding-x = 10
window-padding-y = 10
window-padding-balance = true
initial-window = true

# Cursor
cursor-style = block
cursor-style-blink = true
shell-integration-features = cursor,sudo

# Scrollback
scrollback-limit = 10000000

# Key bindings
keybind = ctrl+a>n=new_window
keybind = ctrl+a>t=new_tab
keybind = ctrl+a>w=close_surface
keybind = ctrl+a>q=quit
keybind = cmd+shift+equal=increase_font_size:1
keybind = cmd+shift+minus=decrease_font_size:1
keybind = cmd+shift+zero=reset_font_size

# Mouse
mouse-hide-while-typing = true
```

---

## Command Reference

### Launch options
| Command | Description |
|---------|-------------|
| `ghostty` | Launch terminal |
| `ghostty +list-themes` | List available color themes |
| `ghostty +show-config` | Show effective config |
| `ghostty --config-file=/path/to/config` | Custom config |
| `ghostty --working-directory=/path` | Start in directory |
| `ghostty --title="Title"` | Custom title |
| `ghostty -e vim file.txt` | Launch with command |

### CLI utilities
| Command | Description |
|---------|-------------|
| `ghostty +list-themes` | Show all built-in themes |
| `ghostty +show-config` | Show current effective configuration |
| `ghostty +inspect` | Open inspector/debug tool |
| `ghostty --version` | Show version |
| `ghostty --help` | Help |

---

## Key Bindings (default + examples)

### Window / Tab Management
| Key | Action |
|-----|--------|
| `Cmd+T` | New tab |
| `Cmd+N` | New window |
| `Cmd+W` | Close tab/surface |
| `Cmd+Shift+W` | Close window |
| `Cmd+[1-9]` | Go to tab N |
| `Cmd+Shift+[` | Previous tab |
| `Cmd+Shift+]` | Next tab |

### Text
| Key | Action |
|-----|--------|
| `Cmd+C` | Copy |
| `Cmd+V` | Paste |
| `Cmd+A` | Select all |
| `Cmd+Shift+C` | Copy to clipboard |
| `Cmd+Shift+V` | Paste from clipboard |

### Font
| Key | Action |
|-----|--------|
| `Cmd+=` | Increase font size |
| `Cmd+-` | Decrease font size |
| `Cmd+0` | Reset font size |

### Search
| Key | Action |
|-----|--------|
| `Cmd+F` | Find in terminal |
| `Cmd+G` | Find next |
| `Cmd+Shift+G` | Find previous |
| `Esc` | Close search |

---

## Advanced Features

### Split panes
```ini
keybind = cmd+d=new_split:right
keybind = cmd+shift+d=new_split:down
keybind = cmd+option+left=goto_split:left
keybind = cmd+option+right=goto_split:right
keybind = cmd+option+up=goto_split:up
keybind = cmd+option+down=goto_split:down
```

### Quick terminal
```ini
# macOS: Toggle quick terminal (dropdown)
keybind = global:cmd+grave_accent=toggle_quick_terminal
```

### Shell integration
Ghostty automatically integrates with bash, zsh, and fish when supported:
- Cursor style changes based on vim mode
- Sudo password prompt detection
- Working directory tracking
- Semantic prompt zones

---

## Tips

- **Nerd Fonts:** JetBrainsMono Nerd Font, Hack Nerd Font, or FiraCode Nerd Font recommended.
- **Themes:** 100+ built-in themes. Use `ghostty +list-themes` to browse, set with `theme = <name>`.
- **macOS native:** Proper native titlebar, tabs, and quick terminal. Best-in-class macOS terminal.
- **Linux:** Supports X11, Wayland, and GTK. Native CSD or SSD.
- **Config hot-reload:** Changes to config file apply without restart.
- **Kitty graphics protocol:** Supports images in terminal (used by yazi, etc.).
- **No Windows support:** macOS and Linux only by design.

---
*Generated via cheatsheet skill on 2026-05-10*
