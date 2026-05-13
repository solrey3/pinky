---
title: btop
category: cli
docs_url: https://github.com/aristocratos/btop
created: 2026-05-10
tags: [system-monitor, tui, cli, performance, resources]
---

# btop Cheatsheet

> A resource monitor that shows CPU, memory, disk, and network usage. Beautiful and highly customizable replacement for htop/top.

**Official Docs:** [github.com/aristocratos/btop](https://github.com/aristocratos/btop)  
**Platform(s):** macOS, Linux, BSD

---

## Installation

### macOS
```bash
brew install btop
```

### Linux
```bash
# Ubuntu (snap)
sudo snap install btop

# Or build from source
git clone https://github.com/aristocratos/btop.git
cd btop && make && sudo make install

# Arch
sudo pacman -S btop

# Fedora
sudo dnf install btop

# Alpine
apk add btop
```

### Verify
```bash
btop --version
```

---

## Quick Start

```bash
btop                    # Launch with defaults
btop --presets cpu      # Launch showing CPU only
btop --config ~/.config/btop/btop.conf  # Use custom config
```

---

## Configuration

**Config file:** `~/.config/btop/btop.conf`
**Themes:** `~/.config/btop/themes/`

### Key settings
```bash
# Start btop and press '?' to see all controls
# Press 'esc' or 'q' to quit
```

---

## Key Bindings

### General
| Key | Action |
|-----|--------|
| `q` / `Esc` | Quit |
| `?` | Help/controls |
| `+` | Add box |
| `-` | Remove box |
| `b` | Battery box |
| `c` | CPU box |
| `m` | Memory box |
| `n` | Network box |
| `d` | Disk box |
| `p` | Proc box |
| `1-5` | Presets 1-5 |
| `e` | Toggle process tree |
| `E` | Reverse process tree |
| `f` | Follow selected process |
| `r` | Reverse sort order |
| `z` | Toggle totals reset |
| `space` | Signal menu (on selected process) |
| `k` / `K` | Kill process |
| `t` / `T` | Terminate process |
| `i` / `I` | Interrupt process |

### Navigation
| Key | Action |
|-----|--------|
| `Up/Down` | Select process |
| `Left/Right` | Navigate boxes |
| `PgUp/PgDn` | Scroll |
| `Home/End` | Jump to top/bottom |

---

## Tips

- **Themes:** In the TUI, press `?` then navigate to theme selector. Themes are in `~/.config/btop/themes/`.
- **Less resource-heavy than htop:** Uses ~1/5th the CPU of htop while showing more data.
- **GPU monitoring:** Supports NVIDIA and AMD GPU stats when available.
- **Process filtering:** Type to filter in the process list.
- **Config auto-generated:** First run creates `~/.config/btop/btop.conf`.

---
*Generated via cheatsheet skill on 2026-05-10*
