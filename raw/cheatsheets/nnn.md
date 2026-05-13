---
title: nnn
category: cli
docs_url: https://github.com/jarun/nnn
created: 2026-05-10
tags: [file-manager, tui, cli, c, productivity]
---

# nnn Cheatsheet

> The fastest terminal file manager. Written in C, with minimal dependencies. Keyboard-driven with plugin extensibility.

**Official Docs:** [github.com/jarun/nnn](https://github.com/jarun/nnn)  
**Wiki:** [github.com/jarun/nnn/wiki](https://github.com/jarun/nnn/wiki)  
**Platform(s):** macOS, Linux, BSD, Windows (WSL)

---

## Installation

### macOS
```bash
brew install nnn
```

### Linux
```bash
# Debian/Ubuntu
sudo apt install nnn

# Fedora
sudo dnf install nnn

# Arch
sudo pacman -S nnn

# Alpine
apk add nnn
```

### From source
```bash
git clone https://github.com/jarun/nnn.git
cd nnn && make && sudo make install
```

---

## Quick Start

```bash
nnn                     # Open current directory
nnn /path/to/dir        # Open specific directory
nnn -e                  # Use $EDITOR to open text files
nnn -a                  # Show hidden files
nnn -c                  # Show current file info
nnn -H                  # Show hidden files + dotfiles
```

---

## Configuration

**Env vars** (set in `~/.bashrc` / `~/.zshrc`):
```bash
# Disable file open on Enter (select only)
export NNN_OPTS="eH"

# Default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Plugins directory
export NNN_PLUG="f:finder;o:fzopen;d:diffs;t:nmount;v:imgview"

# Open with custom opener
# export NNN_OPENER=~/.config/nnn/plugins/nuke

# Trash command (instead of rm)
export NNN_TRASH=1  # uses trash-cli

# Bookmarks
export NNN_BMS="d:~/Documents;D:~/Downloads;w:~/pinky/wiki"
```

---

## Key Bindings

### Navigation
| Key | Action |
|-----|--------|
| `↑` / `↓` / `←` / `→` | Navigate |
| `PgUp` / `PgDn` | Scroll page |
| `Home` / `End` | Top / bottom |
| `Enter` / `→` / `l` | Open file / enter dir |
| `←` / `h` | Parent directory |
| `~` | Go to home |
| `-` | Last visited directory |
| `1-4` | Contexts (workspaces) |
| ``` ` ``` | Prompt for path |
| `q` | Quit |
| `Q` | Quit with current directory as cd target |

### Operations
| Key | Action |
|-----|--------|
| `Space` / `^T` | Toggle selection |
| `a` | Select all |
| `A` | Invert selection |
| `p` | Copy selection here |
| `v` | Move selection here |
| `w` | Rename file |
| `W` | Create new file |
| `n` | Create new directory |
| `x` | Delete (trash/rm) |
| `X` | Delete permanently |
| `y` / `Y` | Show path of file/selection |
| `=` | Launch a shell |
| `!` | Spawn a shell in spawned window |
| `r` | Run custom script (plugin) |
| `;` | Plugin key prompt |
| `:` | Run command with selection |

### View / Filter
| Key | Action |
|-----|--------|
| `/` | Filter (type to search) |
| `Esc` | Clear filter |
| `.` | Toggle hidden files |
| `d` | Detail mode (file info) |
| `t` | Sort by time |
| `s` | Sort by size |
| `z` | Toggle du calculation |
| `b` | Launch bookmarks |

### Tabs (Contexts)
| Key | Action |
|-----|--------|
| `1` / `2` / `3` / `4` | Switch context |
| `^W` | Close current context |

---

## Examples

### Launch with plugins
```bash
NNN_PLUG='p:preview-tui;f:finder;o:fzopen;d:diffs' nnn
```

### Cd on quit (bash)
```bash
# Add to ~/.bashrc
n() {
    nnn "$@"
    if [ -f "$NNN_TMPFILE" ]; then
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
```

### Preview plugin
```bash
# Install preview-tui plugin to ~/.config/nnn/plugins/
# Then: NNN_PLUG='p:preview-tui' nnn
# Press ;p to toggle preview
```

---

## Tips

- **Contexts:** Use `1-4` like browser tabs for different directories.
- **Plugins:** 50+ built-in plugins in `~/.config/nnn/plugins/`. Popular: `preview-tui`, `finder`, `fzopen`, `imgview`.
- **Bookmarks:** `export NNN_BMS="d:~/Documents;h:~"` then press `b`.
- **Fastest FM:** Benchmarks show nnn is faster than ranger, lf, vifm on large dirs.
- **No mouse:** Pure keyboard. Designed for speed.

---
*Generated via cheatsheet skill on 2026-05-10*
