---
title: tmux
category: cli
docs_url: https://github.com/tmux/tmux/wiki
created: 2026-05-10
tags: [terminal, multiplexer, tmux, cli, productivity]
---

# tmux Cheatsheet

> Terminal multiplexer — manage multiple sessions, windows, and panes from a single terminal.

**Official Docs:** [github.com/tmux/tmux/wiki](https://github.com/tmux/tmux/wiki)  
**tmux Cheat Sheet:** [tmuxcheatsheet.com](https://tmuxcheatsheet.com)  
**Platform(s):** macOS, Linux, BSD, Windows (WSL)

---

## Installation

### macOS
```bash
brew install tmux
```

### Linux
```bash
# Debian/Ubuntu
sudo apt install tmux

# RHEL/CentOS/Fedora
sudo dnf install tmux

# Arch
sudo pacman -S tmux

# Alpine
apk add tmux
```

### From source
```bash
git clone https://github.com/tmux/tmux.git
cd tmux && sh autogen.sh && ./configure && make && sudo make install
```

### Verify
```bash
tmux -V
```

---

## Quick Start

```bash
# Start a new session
tmux

# Start named session
tmux new -s mysession

# Attach to last session
tmux attach

# Attach to named session
tmux attach -t mysession

# List sessions
tmux ls
```

---

## Configuration

**Config file:** `~/.tmux.conf`

### Common settings
```bash
# Change prefix from Ctrl-b to Ctrl-a
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# Mouse support
set -g mouse on

# Vim-style pane navigation
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Reload config
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# Start window/pane numbering at 1
set -g base-index 1
setw -g pane-base-index 1

# True color support
set -g default-terminal "screen-256color"
set -ag terminal-overrides ",xterm-256color:RGB"

# Increase scrollback
set -g history-limit 50000
```

---

## Key Bindings (Prefix = `Ctrl+b` by default)

### Sessions
| Key | Action |
|-----|--------|
| `prefix d` | Detach from session |
| `prefix s` | Session list (interactive) |
| `prefix $` | Rename current session |
| `prefix (` | Previous session |
| `prefix )` | Next session |

### Windows (tabs)
| Key | Action |
|-----|--------|
| `prefix c` | Create new window |
| `prefix ,` | Rename window |
| `prefix n` | Next window |
| `prefix p` | Previous window |
| `prefix 0-9` | Switch to window N |
| `prefix &` | Kill window |
| `prefix w` | Window list (interactive) |
| `prefix f` | Find window |
| `prefix .` | Move window to another index |

### Panes (splits)
| Key | Action |
|-----|--------|
| `prefix %` | Split vertically (left/right) |
| `prefix "` | Split horizontally (top/bottom) |
| `prefix arrow` | Navigate panes |
| `prefix z` | Zoom pane (toggle) |
| `prefix x` | Kill pane |
| `prefix space` | Cycle layouts |
| `prefix {` | Move pane left |
| `prefix }` | Move pane right |
| `prefix !` | Break pane to new window |
| `prefix q` | Show pane numbers |
| `prefix o` | Next pane |
| `prefix ;` | Last active pane |

### Copy mode (vi)
| Key | Action |
|-----|--------|
| `prefix [` | Enter copy mode |
| `prefix ]` | Paste buffer |
| `Space` | Start selection (vi mode) |
| `Enter` | Copy selection |
| `v` | Begin selection |
| `y` | Yank selection |
| `Ctrl+c` | Exit copy mode |

---

## CLI Reference

| Command | Description |
|---------|-------------|
| `tmux new -s name` | New named session |
| `tmux attach -t name` | Attach to session |
| `tmux detach` | Detach current client |
| `tmux ls` | List sessions |
| `tmux kill-session -t name` | Kill session |
| `tmux kill-server` | Kill tmux server (all sessions) |
| `tmux rename-session -t old new` | Rename session |
| `tmux split-window -v` | Vertical split |
| `tmux split-window -h` | Horizontal split |
| `tmux send-keys -t session:window 'cmd' Enter` | Send keys to pane |
| `tmux source-file ~/.tmux.conf` | Reload config |

---

## Tips

- **Resurrection:** Use `tmux-resurrect` + `tmux-continuum` plugins to save/restore sessions across reboots.
- **TPM:** Tmux Plugin Manager — `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
- **Mouse:** Enable `mouse on` if you like clicking — fully works in iTerm2, Alacritty, Ghostty.
- **Clipboard integration:** `set -s copy-command 'xclip -selection clipboard'` (Linux) or `pbcopy` (macOS).
- **Socket path:** `tmux -S /tmp/shared attach` for shared sessions.

---
*Generated via cheatsheet skill on 2026-05-10*
