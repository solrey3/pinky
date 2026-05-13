---
id: w3m-cheatsheet
title: w3m Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,browser,web]
---

# w3m Cheatsheet

**Category:** Terminal Web Browser  
**Official Docs:** https://w3m.sourceforge.net/

## Launch

```bash
w3m https://example.com
w3m -dump https://example.com          # Dump text to stdout
curl -s https://example.com | w3m -T text/html  # Pipe HTML
```

## Navigation

| Key | Action |
|-----|--------|
| `↓` / `↑` | Next / previous link |
| `←` / `→` | Back / forward page |
| `Enter` | Follow link |
| `B` | Back |
| `Tab` | Next input field |
| `Shift+Tab` | Previous input field |
| `Space` | Page down |
| `b` | Page up |
| `g` | Open URL prompt |
| `G` | Edit current URL |
| `q` | Quit (confirm) |
| `Q` | Quit immediately |

## Link Operations

| Key | Action |
|-----|--------|
| `a` | Save link target |
| `u` | Show link URL |
| `c` | Show current URL |
| `ESC + Enter` | Open link in new tab |
| `T` | Open new tab |
| `t` | Close tab |
| `{` / `}` | Previous / next tab |

## Search & Text

| Key | Action |
|-----|--------|
| `/` | Search forward |
| `?` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `v` | View HTML source |
| `s` | Select buffer |
| `E` | Edit current page |

## Bookmarks & History

| Key | Action |
|-----|--------|
| `ESC + b` | View bookmarks |
| `ESC + a` | Add bookmark |
| `C-h` | History |

## One-Liners

```bash
# Render page as plain text
w3m -dump https://example.com

# Render with no color
w3m -dump -cols 80 https://example.com | less

# Search duckduckgo
w3m https://duckduckgo.com/html/?q=query

# Read local HTML file
w3m file:///path/to/file.html

# Pipe API response through w3m
curl -s https://api.github.com | jq . | w3m -T text/plain
```

## Config (~/.w3m/config)

```bash
display_charset UTF-8
color_basic_color white
color_anchor_color cyan
color_image_color green
use_cookie 1
show_photo 0
```

## Comparison: w3m vs lynx vs curl+html2text

| Feature | w3m | lynx | curl+html2text |
|---------|-----|------|----------------|
| Tables | ✅ | ⚠️ | ❌ |
| SSL | ✅ | ✅ | N/A |
| Cookie support | ✅ | ✅ | ❌ |
| Tabs | ✅ | ❌ | ❌ |
| Inline images (w/ support) | ✅ | ❌ | ❌ |
| Speed | Fast | Fast | Fastest |

> w3m is the browser of choice for terminal-based workflows, RSS reading, and HTML-to-text conversion in scripts.
