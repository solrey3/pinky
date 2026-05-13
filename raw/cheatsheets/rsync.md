---
id: rsync-cheatsheet
title: rsync Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli, sync, backup]
---

# rsync Cheatsheet

**Category:** CLI / Synchronization & Backup  
**Official Docs:** https://linux.die.net/man/1/rsync

## Install

```bash
# macOS
brew install rsync

# Debian/Ubuntu
sudo apt install rsync

# Fedora
sudo dnf install rsync
```

## Basic Usage

```bash
# Copy file
rsync -av src.txt dest/

# Copy directory (recursive)
rsync -av source/ destination/

# Show progress
rsync -av --progress source/ dest/
```

## Common Flags

| Flag | Description |
|------|-------------|
| `-a` | Archive mode (preserve perms, links, etc.) |
| `-v` | Verbose |
| `-r` | Recursive |
| `--progress` | Show transfer progress |
| `-h` | Human readable sizes |
| `--partial` | Resume partial transfers |
| `-z` | Compress during transfer |
| `-n` | Dry run |
| `-u` | Update (skip newer) |
| `-l` | Copy symlinks |
| `-P` | Same as `--partial --progress` |

## Remote Usage

```bash
# Remote copy (SSH)
rsync -av source/ user@host:/path/

# Pull from remote
rsync -av user@host:/path/ ./local/

# Custom SSH port
rsync -e "ssh -p 2222" -av src/ user@host:dest/
```

## Backup Example

```bash
# Incremental backup with timestamped dir
rsync -avh --delete --link-dest=../latest ./source/ backups/$(date +%F)/
```

## Useful One-liners

```bash
# Dry-run what will happen
rsync -avhn source/ dest/

# Delete files on dest not in source
rsync -av --delete source/ dest/

# Exclude patterns
rsync -av --exclude='*.tmp' . /backup/

# Keep only recent files
rsync -av --min-age=7d source/ archive/
```

Reference for common terminal sync/backup tasks. Use `--dry-run` (`-n`) liberally before live runs.