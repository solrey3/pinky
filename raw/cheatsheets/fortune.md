---
id: fortune-cheatsheet
title: fortune Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,quotes,fun]
---

# fortune Cheatsheet

**Category:** Random Quotation Generator  
**Official Docs:** `man fortune`

## Install
```bash
# Debian/Ubuntu
sudo apt install fortune-mod fortunes fortunes-off
# macOS
brew install fortune
# Fedora
sudo dnf install fortune-mod
```

## Basic Usage

```bash
fortune                        # Random from all categories
fortune literature             # Specific category
fortune -a                     # All fortunes (incl. offensive)
fortune -o                     # Offensive only
fortune -f                     # List categories
fortune -m keyword             # Search for keyword
fortune -n 160                 # Max length 160 chars
fortune -s                     # Short fortunes only
fortune -l                     # Long fortunes only
```

## Categories

```bash
fortune -f                     # List all databases
fortune literature             # Books, authors
fortune wisdom                 # Proverbs
fortune science                # Science quotes
fortune computers              # Tech humor
fortune linux                  # Linux/open source
fortune startrek               # Star Trek
fortune zippy                  # Zippy the Pinhead
fortune calvin                 # Calvin & Hobbes
fortune off/ascii-art          # ASCII art (often in -off pkg)
```

## Custom Database

```bash
# Create custom fortune file
echo -e "Quote 1\n\%\nQuote 2\n\%\nQuote 3" > myquotes
cd /usr/share/games/fortunes
sudo strfile /path/to/myquotes myquotes.dat
fortune myquotes
```

## One-Liners

```bash
# Daily quote in shell startup
fortune | cowsay -f tux

# Email signature rotation
fortune -s | fmt -w 60

# Motivational wallpaper text
fortune wisdom > ~/today.txt

# Grep all fortunes for author
fortune -f | awk '{print $1}' | while read db; do fortune -m "Einstein" "$db"; done
```

## Comparison: fortune vs randquote

| Feature | fortune | randquote |
|---------|---------|-----------|
| Categories | Many built-in | Single file |
| Custom dbs | Easy | Manual |
| Offensive | Optional | No |
| Size | Large install | Go binary |

> fortune is the Unix classic. Install `fortunes-off` for the full irreverent experience.
