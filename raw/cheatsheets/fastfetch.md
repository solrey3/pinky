---
id: fastfetch-cheatsheet
title: fastfetch Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,system,info]
---

# fastfetch Cheatsheet

**Category:** System Info Fast Display (neofetch successor)  
**Official Docs:** https://github.com/fastfetch-cli/fastfetch

## Install
```bash
# macOS
brew install fastfetch
# Debian/Ubuntu
sudo apt install fastfetch
# Arch
sudo pacman -S fastfetch
```

## Basic

| Command | Output |
|---------|--------|
| `fastfetch` | Full system info with logo |
| `fastfetch -l none` | No logo, info only |
| `fastfetch -l debian` | Specific logo |
| `fastfetch -c all` | All modules |
| `fastfetch --help` | Full flag list |

## Common Flags

| Flag | Description |
|------|-------------|
| `-l logo` | Set logo (or `none`) |
| `-s module` | Show specific module |
| `-c preset` | Load config preset |
| `--logo-width N` | Logo width in chars |
| `--logo-height N` | Logo height in chars |
| `--color-keys color` | Key color |
| `--color-title color` | Title color |
| `--separator string` | Key/value separator |
| `--pipe` | Pipe format (for scripts) |
| `--json` | JSON output |
| `--config path` | Custom config file |

## Modules (-s)

| Module | Info shown |
|--------|-----------|
| Title | User@host |
| OS | Operating system |
| Host | Machine model |
| Kernel | Kernel version |
| Uptime | System uptime |
| Packages | Installed package count |
| Shell | Current shell |
| WM | Window manager |
| DE | Desktop environment |
| Theme | GTK/Qt theme |
| Icons | Icon theme |
| Terminal | Terminal emulator |
| CPU | Processor info |
| GPU | Graphics card |
| Memory | RAM usage |
| Disk | Disk usage |
| Battery | Battery status |
| Locale | System locale |
| Break | Empty line |
| Colors | Color palette |

## Presets

```bash
# Minimal (no logo, core only)
fastfetch -l none -s title:os:host:kernel

# Hardware focus
fastfetch -s cpu:gpu:memory:disk

# Software stack
fastfetch -s os:shell:wm:terminal

# Full everything
fastfetch -c all
```

## Config File (~/.config/fastfetch/config.jsonc)

```jsonc
{
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    "logo": {
        "type": "auto",
        "padding": {
            "left": 2
        }
    },
    "display": {
        "separator": "  "
    },
    "modules": [
        "title",
        "os",
        "host",
        "kernel",
        "uptime",
        "packages",
        "shell",
        "de",
        "wm",
        "terminal",
        "cpu",
        "gpu",
        "memory",
        "disk",
        "battery",
        "locale",
        "break",
        "colors"
    ]
}
```

## One-Liners

```bash
# Quick hardware check
fastfetch -s cpu:gpu:memory:disk -l none

# Server info (no gui stuff)
fastfetch -s title:os:kernel:uptime:packages:memory:disk -l none

# JSON for parsing
fastfetch --json | jq '.[] | select(.type=="CPU") | .result'

# Color palette only
fastfetch -s colors -l none
```

## Comparison: fastfetch vs neofetch

| Feature | fastfetch | neofetch |
|---------|-----------|----------|
| Speed | Very fast | Slow (shell loops) |
| Active dev | ✅ | ❌ (archived) |
| Config format | JSONC | Shell script |
| Modules | More, granular | Fixed set |
| JSON output | ✅ | ❌ |
| C implementation | ✅ | Bash |

> fastfetch is the modern replacement — actively maintained, written in C, and 10-100x faster than neofetch.
