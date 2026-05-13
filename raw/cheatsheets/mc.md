---
id: mc-cheatsheet
title: mc (Midnight Commander) Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,file-manager,tui]
---

# mc (Midnight Commander) Cheatsheet

**Category:** Terminal File Manager  
**Official Docs:** https://midnight-commander.org/

## Install
```bash
# Debian/Ubuntu
sudo apt install mc
# macOS
brew install mc
# Fedora
sudo dnf install mc
```

## Launch
```bash
mc              # Start in current dir
mc /path        # Start in specific dir
mc -a           # Active mode (mouse support)
mc -b           // Black & white
mc -u           // Disable subshell
```

## Navigation

| Key | Action |
|-----|--------|
| `↑` / `↓` | Move up/down |
| `Home` / `End` | First/last file |
| `PgUp` / `PgDn` | Page up/down |
| `Tab` | Switch panels |
| `Alt + ↑/↓/←/→` | Navigate tree |
| `Ctrl + \` | Directory hotlist |
| `Alt + .` | Toggle hidden files |
| `Alt + o` | Other panel = current dir |
| `Alt + i` | Other panel = current file's dir |
| `+` | Select group |
| `\` | Unselect group |
| `Insert` | Toggle select file |
| `*` | Reverse selection |

## File Operations

| Key | Action |
|-----|--------|
| `F3` / `Ctrl + f` | View file |
| `F4` / `Ctrl + e` | Edit file |
| `F5` / `F6` | Copy / Move |
| `F7` | Make directory |
| `F8` / `Del` | Delete |
| `Shift + F6` | Rename |
| `Ctrl + x, c` | Chmod |
| `Ctrl + x, o` | Chown |
| `Ctrl + x, l` | Create link |
| `Ctrl + x, s` | Create symlink |

## Quick Keys

| Key | Action |
|-----|--------|
| `Enter` | Open file / enter dir |
| `Ctrl + Enter` | Copy filename to command line |
| `Alt + Enter` | Copy full path to command line |
| `Ctrl + space` | Show dir size |
| `Alt + ?` | Search |
| `Alt + c` | Quick cd |
| `Ctrl + r` | Refresh panel |
| `Ctrl + u` | Swap panels |
| `Ctrl + o` | Toggle subshell (show terminal) |
| `Ctrl + l` | Redraw screen |
| `Esc` (x2) | Cancel / close dialog |

## External Commands

| Command | Action |
|---------|--------|
| `cd` | Change dir (also in subshell) |
| `!` | Execute shell command |
| `!!` | Execute shell command with selected file |
| `!$` | Execute with current file |
| `Ctrl + t` | Tag file (same as Insert) |

## Panel Layout

| Key | Action |
|-----|--------|
| `Alt + t` | Change panel format |
| `Ctrl + x, i` | Info panel (file details) |
| `Ctrl + x, q` | Quick view panel |
| `Ctrl + x, !` | Directory only mode |
| `Ctrl + x, 2` | Two panels equal |
| `Ctrl + x, 1` | One panel full |

## Archives & VFS

```bash
# Enter archive (treats as directory)
Enter on .tar.gz, .zip, .rar, .7z

# Copy from/to archives directly
F5 from archive panel to file panel

# FTP/SFTP
Ctrl + \ → FTP link
# Format: user@host/dir

# Shell link
Ctrl + \ → Shell link
# Format: /sh:user@host/dir
```

## Bookmarks (Directory Hotlist)

```bash
Ctrl + \           # Open hotlist
Ctrl + h           # Add current dir
```

## Config Files

```
~/.config/mc/ini              # Main config
~/.config/mc/panels.ini       # Panel settings
~/.config/mc/mc.keymap        # Keybindings
~/.config/mc/mc.ext           # File associations
```

## One-Liners

```bash
# Run command on selected files
# Select files with Insert, then:
! tar czf backup.tar.gz %t    # %t = tagged files

# Find in current dir only
Alt + ? → type pattern → Enter

# Quick edit config
F9 → Options → Configuration

# Enable syntax highlighting in editor
F9 → Options → General → Editor → Use internal editor
```

## Comparison: mc vs ranger vs nnn vs yazi

| Feature | mc | ranger | nnn | yazi |
|---------|-----|--------|-----|------|
| Two panels | ✅ Classic | ❌ | ❌ | ❌ |
| Modal (vim) | ❌ | ✅ | ❌ | ✅ |
| Speed | Medium | Python | Fast (C) | Fast (Rust) |
| Previews | Limited | ✅ | Via plugin | ✅ Native |
| Archives as dirs | ✅ | ❌ | ❌ | ❌ |
| Built-in editor | ✅ | ❌ | ❌ | ❌ |
| Mouse support | ✅ | ⚠️ | ✅ | ✅ |

> mc is the classic Norton Commander clone — rock solid, runs everywhere, two-panel workflow. Use nnn or yazi for speed and modern previews. Use ranger for vim-style navigation.
