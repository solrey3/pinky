---
id: zip-cheatsheet
title: zip & unzip Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,archive,compression]
---

# zip & unzip Cheatsheet

**Category:** ZIP Archive Tools  
**Official Docs:** https://linux.die.net/man/1/zip

## Create Archives

```bash
# Zip directory
zip -r archive.zip directory/

# Zip files
zip archive.zip file1 file2

# Zip with password
zip -r -e archive.zip directory/

# Zip excluding patterns
zip -r archive.zip directory/ -x '*.git*' -x '*.log'

# Update existing zip
zip -u archive.zip newfile.txt

# Delete from zip
zip -d archive.zip file_inside.txt

# Cross-platform compatibility (legacy)
zip -r -k archive.zip directory/
```

## Extract Archives

```bash
# Extract all
unzip archive.zip

# Extract to directory
unzip archive.zip -d /dest/dir

# Extract single file
unzip archive.zip file_inside.txt

# List without extracting
unzip -l archive.zip

# Test integrity
unzip -t archive.zip

# Overwrite silently
unzip -o archive.zip

# Never overwrite
unzip -n archive.zip

# Quiet
unzip -q archive.zip
```

## Flags Reference

### zip
| Flag | Description |
|------|-------------|
| `-r` | Recursive |
| `-e` | Encrypt |
| `-u` | Update |
| `-d` | Delete from archive |
| `-q` | Quiet |
| `-v` | Verbose |
| `-9` | Maximum compression |
| `-0` | No compression (store) |
| `-x` | Exclude files |
| `-i` | Include only |
| `-j` | Junk paths (flat) |

### unzip
| Flag | Description |
|------|-------------|
| `-l` | List contents |
| `-t` | Test |
| `-o` | Overwrite |
| `-n` | Never overwrite |
| `-q` | Quiet |
| `-d` | Destination dir |
| `-j` | Junk paths |
| `-p` | Pipe to stdout |
| `-Z` | Info-ZIP mode |

## One-Liners

```bash
# Zip with timestamp
zip -r backup-$(date +%F).zip ~/important

# Stream zip to stdout
zip -r - directory/ > archive.zip

# Extract specific pattern
unzip archive.zip '*.txt' -d texts/

# Fix DOS line endings in zip
unzip -p archive.zip file.txt | dos2unix > file.txt

# Create password-protected zip
zip -r -e -P mypassword archive.zip secrets/

# Compare zip vs original
unzip -l archive.zip | awk '{print $4}' | sort > zip.list
find directory -type f | sed 's|directory/||' | sort > orig.list
diff zip.list orig.list
```

## Comparison: zip vs tar vs 7z

| Feature | zip | tar.gz | 7z |
|---------|-----|--------|-----|
| Unix perms | ⚠️ | ✅ | ✅ |
| Symlinks | ❌ | ✅ | ✅ |
| Encryption | Weak (ZipCrypto) | With gpg | AES-256 |
| Compression | Medium | Good | Best |
| Streaming | ❌ | ✅ | ❌ |
| Universal compat | ✅ Best | Unix | Win/Linux |

> zip is the universal exchange format — every OS handles it natively. Use for cross-platform sharing. Use tar.gz for Unix backups. Use 7z for maximum compression + encryption.
