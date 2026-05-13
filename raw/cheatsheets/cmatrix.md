---
id: cmatrix-cheatsheet
title: cmatrix Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,screensaver,fun]
---

# cmatrix Cheatsheet

**Category:** Matrix Digital Rain Screensaver  
**Official Docs:** `man cmatrix`

## Install
```bash
# Debian/Ubuntu
sudo apt install cmatrix
# macOS
brew install cmatrix
# Fedora
sudo dnf install cmatrix
```

## Launch

```bash
cmatrix                        # Default green rain
cmatrix -C red                 # Red rain
cmatrix -C blue                # Blue rain
cmatrix -C yellow              # Yellow rain
cmatrix -C white               # White rain
cmatrix -C magenta             # Magenta rain
cmatrix -C cyan                # Cyan rain
```

## Flags

| Flag | Description |
|------|-------------|
| `-a` | Asynchronous scroll |
| `-b` | Bold characters on |
| `-B` | All bold (default off) |
| `-C color` | Color: green, red, blue, white, yellow, cyan, magenta, black |
| `-f` | Force $TERM linux mode |
| `-l` | Linux mode (uses console chars) |
| `-o` | Use old-style scrolling |
| `-s` | Screenshot mode (no bold) |
| `-u delay` | Update delay (0-10, lower=faster) |
| `-n` | No bold at all |
| `-x` | X window mode (not standard) |
| `-k` | Japanese katakana (if compiled) |
| `-K` | Korean (if compiled) |

## Interactive Keys

| Key | Action |
|-----|--------|
| `0-9` | Change update speed |
| `!` / `@` / `#` | Change color |
| `a` | Toggle asynchronous |
| `b` | Toggle bold |
| `B` | Toggle all bold |
| `n` | Toggle no-bold |
| `q` | Quit |
| `?` | Help |

## One-Liners

```bash
# Red pill mode
cmatrix -C red -b

# Screenshot-friendly (no bold)
cmatrix -C cyan -s

# Slow contemplative rain
cmatrix -u 10 -C blue

# Fast frantic
cmatrix -u 0 -a

# Old-school mono
cmatrix -C white -o

# Background process (detach)
nohup cmatrix -C green > /dev/null 2>&1 &

# Lock screen + matrix (cool but insecure)
cmatrix; vlock    # cmatrix exits then vlock engages
```

## Systemd User Unit

```ini
# ~/.config/systemd/user/matrix.service
[Unit]
Description=Matrix Digital Rain

[Service]
Type=simple
ExecStart=/usr/bin/cmatrix -C green -b
Restart=always

[Install]
WantedBy=default.target
```

## Comparison: cmatrix vs unimatrix

| Tool | Language | Features | Notes |
|------|----------|----------|-------|
| cmatrix | C | Classic, fast | The original |
| unimatrix | Python | Colors, glyphs, async | Modern, more config |
| tmatrix | Rust | 3D perspective | New, configurable |

> cmatrix is the classic — lightweight, zero dependencies, works on any terminal. Use unimatrix or tmatrix for more customization.
