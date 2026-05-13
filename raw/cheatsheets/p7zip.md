---
id: p7zip-cheatsheet
title: p7zip Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,archive,compression]
---

# p7zip Cheatsheet

**Category:** 7-Zip Command Line (7z, 7za, 7zr)  
**Official Docs:** https://www.7-zip.org/

## Install
```bash
# Debian/Ubuntu
sudo apt install p7zip-full p7zip-rar
# macOS
brew install p7zip
# Fedora
sudo dnf install p7zip p7zip-plugins
```

## Binaries

| Command | Description |
|---------|-------------|
| `7z` | Full (all formats) |
| `7za` | Standalone (7z, zip, gzip, bzip2, xz, tar) |
| `7zr` | Minimal (7z only) |

## Create Archives

```bash
# Create 7z archive (default, best compression)
7z a archive.7z file1 dir/

# Create with password + encryption
7z a archive.7z file1 -p -mhe=on

# Create zip archive
7z a archive.zip file1 dir/

# Ultra compression (LZMA2, max level)
7z a archive.7z dir/ -mx=9 -m0=lzma2
```

## Extract Archives

```bash
# Extract 7z
7z x archive.7z              # Full paths
7z e archive.7z              # Flat (no paths)

# Extract to specific dir
7z x archive.7z -o/dest/dir

# Extract with password
7z x archive.7z -p

# Extract single file
7z x archive.7z file_inside.txt
```

## List & Test

```bash
7z l archive.7z              # List contents
7z t archive.7z              # Test integrity
7z t archive.7z -p           # Test with password
```

## Update & Manage

```bash
7z u archive.7z newfile.txt  # Update (add/replace)
7z d archive.7z oldfile.txt  # Delete file from archive
7z rn archive.7z oldname newname  # Rename inside archive
```

## Compression Levels & Methods

| Level | Switch | Use Case |
|-------|--------|----------|
| 0 | `-mx=0` | Store only, no compression |
| 1 | `-mx=1` | Fastest |
| 3 | `-mx=3` | Fast |
| 5 | `-mx=5` | Normal (default) |
| 7 | `-mx=7` | Maximum |
| 9 | `-mx=9` | Ultra (slowest, best ratio) |

## Methods

```bash
# LZMA2 (default, best for 7z)
7z a archive.7z dir/ -m0=lzma2

# BZip2
7z a archive.7z dir/ -m0=bzip2

# PPMd (good for text)
7z a archive.7z dir/ -m0=ppmd
```

## Splits & Volumes

```bash
# Split into 100MB volumes
7z a archive.7z bigdir/ -v100m

# Extract split archive
7z x archive.7z.001
```

## One-Liners

```bash
# Compress with max settings + password
7z a secure.7z secrets/ -mx=9 -m0=lzma2 -p -mhe=on

# Quick backup with timestamp
7z a backup-$(date +%F).7z ~/important -mx=5

# Extract silently
7z x archive.7z -ooutput -y

# Compare 7z vs zip size
7z a test.7z dir/ && 7z a test.zip dir/ && ls -lh test.*
```

## Comparison: p7zip vs tar.gz vs zip

| Feature | 7z | tar.gz | zip |
|---------|-----|--------|-----|
| Compression ratio | ✅ Best | Good | Fair |
| Speed | Slower | Fast | Fast |
| Encryption (AES-256) | ✅ | With gpg | Weak |
| Unicode filenames | ✅ | ✅ | ✅ |
| Split volumes | ✅ | With split | ❌ |
| Recovery record | ✅ | ❌ | ❌ |

> 7z is the choice for maximum compression + strong encryption. Use tar.gz for Unix compatibility and streaming. Use zip for universal Windows/Mac compatibility.
