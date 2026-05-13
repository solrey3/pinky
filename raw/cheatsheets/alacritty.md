---
title: Alacritty
category: cli
docs_url: https://alacritty.org/config-alacritty.html
created: "2026-05-10"
tags: [terminal, gpu, rust, cli, emulator]
---

# Alacritty Cheatsheet

> A fast, GPU-accelerated terminal emulator written in Rust. Minimal, configurable via YAML/TOML.

**Official Docs:** https://alacritty.org/config-alacritty.html  
**GitHub:** https://github.com/alacritty/alacritty  
**Platform(s):** macOS, Linux, Windows, BSD

---

## Installation

### macOS
```bash
brew install --cask alacritty
```

### Linux
```bash
# Debian/Ubuntu (.deb download)
# See releases page for .deb packages
curl -LO https://github.com/alacritty/alacritty/releases/latest/download/Alacritty-v0.13.0-ubuntu_22.04_amd64.deb
sudo dpkg -i Alacritty-v0.13.0-ubuntu_22.04_amd64.deb

# Arch
sudo pacman -S alacritty

# Fedora
sudo dnf install alacritty
```

### Windows
```powershell
scoop install alacritty
# or
choco install alacritty
```

### Verify
```bash
alacritty --version
```

---

## Setup

### Config location
```bash
# Linux/macOS
~/.config/alacritty/alacritty.toml

# Windows
%APPDATA%\alacritty\alacritty.toml
```

### Basic config (TOML)
```toml
[window]
padding = { x = 10, y = 10 }
decorations = "Buttonless"  # macOS: Full|Transparent|Buttonless|None
dynamic_padding = true
opacity = 0.95
blur = true          # macOS only
startup_mode = "Windowed"

[font]
normal = { family = "JetBrainsMono Nerd Font", style = "Regular" }
bold = { family = "JetBrainsMono Nerd Font", style = "Bold" }
italic = { family = "JetBrainsMono Nerd Font", style = "Italic" }
size = 13.0
offset = { x = 0, y = 1 }

[colors]
[colors.primary]
background = "#1a1b26"
foreground = "#c0caf5"

[colors.normal]
black = "#15161e"
red = "#f7768e"
green = "#9ece6a"
yellow = "#e0af68"
blue = "#7aa2f7"
magenta = "#bb9af7"
cyan = "#7dcfff"
white = "#a9b1d6"

[cursor]
style = { shape = "Beam", blinking = "On" }
blink_interval = 750
unfocused_hollow = true

[terminal]
osc52 = "CopyPaste"

[keyboard]
bindings = [
    { key = "N", mods = "Command", action = "SpawnNewInstance" },
    { key = "F", mods = "Command", action = "ToggleFullscreen" },
    { key = "Equals", mods = "Command", action = "IncreaseFontSize" },
    { key = "Minus", mods = "Command", action = "DecreaseFontSize" },
    { key = "Key0", mods = "Command", action = "ResetFontSize" },
]
```

---

## Command Reference

### Launch options
| Command | Description |
|---------|-------------|
| `alacritty` | Launch terminal |
| `alacritty --config-file ~/.config/alacritty/alt.toml` | Custom config |
| `alacritty --working-directory ~/projects` | Start in directory |
| `alacritty --title "My Terminal"` | Custom title |
| `alacritty --class AlacrittyAlt` | Custom WM class |
| `alacritty --hold` | Keep window open after command |
| `alacritty -e vim file.txt` | Launch with command |
| `alacritty --print-events` | Debug: print window events |
| `alacritty --ref-test` | Run reference tests |

---

## Key Bindings (default)

### Window
| Key | Action |
|-----|--------|
| `Cmd/Ctrl+Shift+N` | New window |
| `Cmd/Ctrl+Shift+Return` | Spawn new instance |
| `Cmd/Ctrl+Shift+Q` | Quit |
| `Cmd/Ctrl+Enter` | Toggle fullscreen |

### Text
| Key | Action |
|-----|--------|
| `Cmd/Ctrl+C` | Copy |
| `Cmd/Ctrl+V` | Paste |
| `Cmd/Ctrl+Shift+C` | Copy selection |
| `Cmd/Ctrl+Shift+V` | Paste selection |
| `Cmd/Ctrl+A` | Select all |

### Font
| Key | Action |
|-----|--------|
| `Cmd/Ctrl+=` | Increase font size |
| `Cmd/Ctrl+-` | Decrease font size |
| `Cmd/Ctrl+0` | Reset font size |

### Search
| Key | Action |
|-----|--------|
| `Cmd/Ctrl+Shift+F` | Search forward |
| `Cmd/Ctrl+Shift+B` | Search backward |
| `Cmd/Ctrl+Shift+N` | Next match |
| `Cmd/Ctrl+Shift+P` | Previous match |

---

## Tips

- **Nerd Fonts:** Use a Nerd Font for proper icon rendering in tools like LazyVim, yazi, btop.
- **True color:** Alacritty supports 24-bit color — enable in your shell/config for best results.
- **Startup fail:** If Alacritty fails to start, run with `--print-events` for debugging.
- **Linux desktop entry:** `sudo cp extra/linux/Alacritty.desktop /usr/share/applications/`
- **Shell integration:** No shell integration by design — configure shell rc files separately.
- **URL hints:** `Ctrl+Shift+U` then type hint characters to open URLs.

---
*Generated via cheatsheet skill on 2026-05-10*
