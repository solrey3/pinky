---
id: wget-cheatsheet
title: wget Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli, download, http]
---

# wget Cheatsheet

**Category:** CLI / Downloader  
**Official Docs:** https://www.gnu.org/software/wget/manual/wget.html

## Install

```bash
# Debian/Ubuntu
sudo apt install wget

# macOS
brew install wget

# Fedora
sudo dnf install wget
```

## Basic Usage

```bash
# Download file
wget https://example.com/file.zip

# Save with custom name
wget -O myfile.zip https://example.com/file.zip

# Verbose / quiet
wget -nv https://example.com    # non-verbose
wget -q https://example.com    # quiet
```

## Multiple Files

```bash
# Download from list
wget -i urls.txt

# Download list and save with original names
wget -i urls.txt -O /dev/null
```

## Resume & Continue

```bash
# Resume partial download
wget -c https://example.com/largefile.iso

# Always try to resume
wget --continue https://example.com/file.zip
```

## Recursion & Mirroring

```bash
# Mirror entire site (careful!)
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent https://example.com

# Download recursively (limit depth)
wget -r -l 2 https://example.com
wget --recursive --level=2 https://example.com
```

## HTTP Authentication & Headers

```bash
# Basic auth
wget --user=username --password=secret https://example.com

# Add header
wget --header="Authorization: Bearer TOKEN" https://api.example.com

# Set user agent
wget --user-agent="Mozilla/5.0" https://example.com
```

## Speed & Timeout

```bash
# Limit speed (5 MB/s)
wget --limit-rate=5M https://example.com/file

# Timeout
wget --timeout=10 https://example.com

# Tries
wget --tries=5 https://example.com
```

## Useful Flags

| Flag | Description |
|------|-------------|
| `-c` | Continue partial download |
| `-O` | Save with custom filename |
| `-nv` | Non-verbose |
| `-q` | Quiet |
| `-r` | Recursive |
| `-l N` | Recursion depth |
| `--limit-rate=XB` | Download speed limit |
| `--user-agent=UA` | Set user agent |
| `--timeout=SEC` | Timeout in seconds |
| `--tries=N` | Number of tries |
| `--header=LINE` | Add custom header |

## One-liners

```bash
# Check website status
wget -q --spider -S https://example.com 2>&1 | grep "HTTP/"

# Quiet download with retries
wget -q -c --tries=3 --timeout=10 -O file.txt https://example.com
```

This is a quick reference for common `wget` usage in the terminal. For advanced use, see the official manual.