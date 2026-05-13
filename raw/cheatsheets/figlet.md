---
id: figlet-cheatsheet
title: figlet Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,ascii,fun]
---

# figlet Cheatsheet

**Category:** ASCII Art Banner Generator  
**Official Docs:** `man figlet`

## Install
```bash
# Debian/Ubuntu
sudo apt install figlet
# macOS
brew install figlet
# Fedora
sudo dnf install figlet
```

## Basic Usage

```bash
figlet "HELLO"              # Default font
figlet -f slant "HELLO"     # Slant font
figlet -c "CENTERED"        # Center align
figlet -r "RIGHT"           # Right align
figlet -l "LEFT"            # Left align (default)
figlet -w 40 "NARROW"       # Width limit
figlet -k "Kerned"          # Kerning mode
```

## Standard Fonts

| Font | Style |
|------|-------|
| `standard` | Default |
| `big` | Huge |
| `small` | Compact |
| `slant` | Italic-like |
| `banner` | Huge block |
| `block` | Block letters |
| `bubble` | Rounded bubbles |
| `digital` | Digital clock |
| `lean` | Leaning |
| `mini` | Minimal |
| `script` | Cursive |
| `shadow` | Shadowed |

## List & Show Fonts

```bash
figlet -I 2                   # Show font directory
ls "$(figlet -I 2)"           # List all fonts
figlet -f slant "TEST"        # Preview specific font
showfigfonts                  # Show all font samples
```

## One-Liners

```bash
# MOTD banner
figlet -f slant "$(hostname)" | lolcat

# Pipeline welcome
uname -a | figlet -f small | boxes -d shell

# Vertical text
figlet -W "UP"               # Read input vertically

# Control chars as text
figlet -A "TAB@HERE"

# Centered server label
echo "$(figlet -cf slant "PROD")"
```

## Comparison: figlet vs toilet vs banner

| Tool | Fonts | Rainbow | Notes |
|------|-------|---------|-------|
| figlet | 100+ | Pipe to lolcat | Classic, standard |
| toilet | Figlet compat + filters | Native --gay, --metal | Modern replacement |
| banner | 1 | No | BSD tradition |

> Pipe figlet output through `lolcat` for rainbow effects, or `boxes` for borders.
