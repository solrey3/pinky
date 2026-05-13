---
id: lynx-cheatsheet
title: lynx Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,browser,web]
---

# lynx Cheatsheet

**Category:** Text-Mode Web Browser  
**Official Docs:** https://lynx.invisible-island.net/

## Launch

```bash
lynx https://example.com
lynx -dump https://example.com          # Dump text to stdout
lynx -source https://example.com        # Dump HTML source
lynx -listonly https://example.com      # List links only
```

## Navigation

| Key | Action |
|-----|--------|
| `↑` / `↓` | Next / previous link |
| `→` / `Enter` | Follow link |
| `←` | Go back |
| `Tab` | Next link |
| `Shift+Tab` | Previous link |
| `g` | Go to URL prompt |
| `G` | Edit current URL |
| `q` | Quit |
| `Q` | Quit immediately |
| `z` | Return to previous document |
| `=` | Show info about current link |
| `a` | Bookmark link |
| `d` | Download link |

## Page Navigation

| Key | Action |
|-----|--------|
| `Space` / `PgDn` | Page down |
| `b` / `PgUp` | Page up |
| `Home` | Top of page |
| `End` | Bottom of page |
| `]` | Next bookmark |
| `[` | Previous bookmark |

## Search

| Key | Action |
|-----|--------|
| `/` | Search forward |
| `?` | Search backward |
| `n` | Next match |
| `N` | Previous match |

## History & Bookmarks

| Key | Action |
|-----|--------|
| `V` | View history |
| `a` | Add bookmark |
| `A` | Add current page to bookmark |
| `r` | Remove bookmark |
| `o` | Options menu |

## Dump Options

```bash
# Plain text dump
lynx -dump https://example.com

# Width-wrapped dump
lynx -dump -width 80 https://example.com

# Non-interactive ( scripting )
lynx -dump -nolist https://example.com

# Save to file
lynx -dump https://example.com > page.txt

# List all links
lynx -listonly -dump https://example.com

# With cookies
lynx -accept_all_cookies -dump https://example.com
```

## Config File (~/.lynxrc)

```
STARTFILE:https://example.com
EDITOR:nvim
SAVE_SPACE:/tmp
ACCEPT_ALL_COOKIES:TRUE
FORCE_SSL_COOKIES_SECURE:TRUE
VI_KEYS_ALWAYS_ON:TRUE
SHOW_CURSOR:TRUE
LINEEDIT_MODE:DEFAULT
```

## One-Liners

```bash
# Read docs in terminal
lynx -dump https://docs.python.org/3/ | less

# Extract all links from page
lynx -dump -listonly https://example.com | grep -o 'http[^ ]*'

# Form dump (non-interactive)
lynx -post_data https://api.example.com < data.txt

# With authentication
lynx -auth=user:pass https://example.com

# Dump through proxy
lynx -dump -psproxy=http://proxy:8080 https://example.com
```

## Comparison: lynx vs w3m

| Feature | lynx | w3m |
|---------|------|-----|
| Speed | Fast | Fast |
| Tables | ⚠️ Minimal | ✅ Better |
| SSL | ✅ | ✅ |
| Cookies | ✅ | ✅ |
| Color | ⚠️ Basic | ✅ Richer |
| Tabs | ❌ | ✅ |
| Inline images (w/ support) | ❌ | ✅ |
| Japanese support | Basic | ✅ Excellent |
| Configuration | ~/.lynxrc | ~/.w3m/config |

> lynx is the classic text browser — rock solid, minimal dependencies, oldest in the game. w3m is the modern alternative with better table rendering and tab support. Keep both installed; lynx for stability, w3m for feature richness.
