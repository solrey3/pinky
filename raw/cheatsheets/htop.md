---
id: htop-cheatsheet
title: htop Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli, monitoring, process]
---

# htop Cheatsheet

**Category:** Interactive Process Viewer  
**Official Docs:** https://htop.dev/

## Launch

```bash
htop              # Default
center htop -u sancho    # Show only user processes
htop -d 5          # Refresh delay (tenths of sec)
htop -C            # Monochrome mode (no color)
htop --sort-key=PERCENT_CPU
```

## Navigation

| Key | Action |
|-----|--------|
| `↑` / `↓` | Select process |
| `PgUp` / `PgDn` | Scroll faster |
| `F1` / `?` | Help |
| `F2` / `S` | Setup (colors, meters, columns) |
| `F3` / `/` | Search by name |
| `F4` / `\` | Filter by name |
| `F5` / `t` | Tree view |
| `F6` | Sort by column |
| `F9` / `k` | Kill (send signal) |
| `F10` / `q` | Quit |

## Sorting

| Key | Sort By |
|-----|---------|
| `P` | CPU% |
| `M` | Memory% |
| `T` | Time (CPU time) |
| `F6` | Choose from list |

## Process Actions

```bash
# Kill (F9 / k)
- 9  SIGKILL   # Force kill (no cleanup)
- 15 SIGTERM   # Graceful terminate
- 1  SIGHUP    # Reload config
- 18 SIGCONT   # Continue stopped
- 19 SIGSTOP   # Pause

# Mark/unmark (F4 / Space)
- Select multiple → F9 to send signal to batch
```

## Setup (F2)

```
Meters: Add/remove meters (CPU, Memory, Swap, Load, Uptime)
Display options: Show threads, highlight base, shadow processes
Colors: Choose color scheme
Columns: Customize displayed columns
```

## Useful Shortcuts

| Shortcut | Effect |
|----------|--------|
| `<` / `>` | Scroll to prev/next list tab (CPU/MEM/etc) |
| `,` / `.` | Change meter display (e.g. bar → text) |
| `I` | Invert sort order |
| `u` | Filter by user |
| `s` | Trace process (strace) |
| `l` | lsof on selected process |

## One-Liners

```bash
# Auto-kill highest CPU process
htop --sort-key=PERCENT_CPU

# Show specific user only
htop -u sancho

# Run detached in background (via screen/tmux)
screen -dm htop

# Export config
htop --no-color | tee htop.log   # Not built-in; use script instead
```

## Comparison: htop vs top vs btop

| Feature | top | htop | btop |
|---------|-----|------|------|
| Mouse | ❌ | ✅ | ✅ |
| Tree | ❌ | ✅ | ❌ |
| Color config | ❌ | ✅ | ✅ |
| Scrollable | ❌ | ✅ | ❌ |
| Batch mode | ❌ | ❌ | ✅ |
| GPU / disks | ❌ | ❌ | ✅ |

htop hits the sweet spot: rich UI, zero dependencies, available everywhere. btop is prettier but requires build tools. top is universal but bare.
