---
id: tar-cheatsheet
title: tar Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,archive,backup]
---

# tar Cheatsheet

**Category:** GNU Tar Archiver  
**Official Docs:** https://www.gnu.org/software/tar/manual/tar.html

## Create Archives

| Command | Description |
|---------|-------------|
| `tar cvf archive.tar dir/` | Create tar |
| `tar czvf archive.tar.gz dir/` | Create gzip-compressed tar |
| `tar cjvf archive.tar.bz2 dir/` | Create bzip2-compressed |
| `tar cJvf archive.tar.xz dir/` | Create xz-compressed |

## Extract Archives

| Command | Description |
|---------|-------------|
| `tar xvf archive.tar` | Extract |
| `tar xzvf archive.tar.gz` | Extract gzip |
| `tar xjvf archive.tar.bz2` | Extract bzip2 |
| `tar xJvf archive.tar.xz` | Extract xz |
| `tar xvf archive.tar -C /dest/` | Extract to specific dir |

## List & Inspect

```bash
tar tvf archive.tar            # List contents
tar tzvf archive.tar.gz        # List gzip archive
tar tvf archive.tar | grep foo # Search inside archive
```

## Flags Reference

| Flag | Description |
|------|-------------|
| `-c` | Create |
| `-x` | Extract |
| `-t` | List contents |
| `-v` | Verbose |
| `-f` | Specify filename |
| `-z` | gzip compression/filter |
| `-j` | bzip2 compression/filter |
| `-J` | xz compression/filter |
| `-C` | Change to directory |
| `-p` | Preserve permissions |
| `--exclude=PATTERN` | Exclude files |
| `--exclude-from=FILE` | Exclude from file |
| `--no-recursion` | Don't recurse |
| `-P` | Don't strip leading `/` |
| `--transform` | Rename during archive |

## Modern Suffix Shorthand (GNU tar)

```bash
# Auto-detect compression by suffix — modern --auto-compress
tar caf archive.tar.gz dir/     # auto
tar caf archive.tar.bz2 dir/
tar caf archive.tar.xz dir/
tar xaf archive.tar.gz          # auto-extract
```

## Advanced Examples

```bash
# Exclude patterns
tar czvf backup.tar.gz --exclude='*.log' --exclude='node_modules' project/

# Exclude from file
tar czvf backup.tar.gz --exclude-from=.tarignore project/

# Preserve permissions, absolute paths
tar czPvf backup.tar.gz /etc/nginx

# Incremental backup
tar --listed-incremental=snapshot.snar -czvf backup-1.tar.gz /data
tar --listed-incremental=snapshot.snar -czvf backup-2.tar.gz /data

# What changed?
tar --compare --file=archive.tar -C /target/

# Append to existing archive
tar rvf archive.tar newfile.txt

# Transform paths in archive
tar czvf archive.tar.gz --transform 's,^project/,v1/,' project/

# Create archive from list
find project -name '*.py' > files.txt
tar czvf scripts.tar.gz -T files.txt
```

## One-Liners

```bash
# Quick backup home dir (excluding junk)
tar czvf ~/backup-$(date +%F).tar.gz --exclude='.cache' --exclude='node_modules' ~/

# Extract single file
tar xzvf archive.tar.gz path/inside/file.txt

# Stream over SSH
tar czf - /local/dir | ssh user@host 'tar xzf - -C /remote/dir'

# Compare archive vs filesystem
tar df archive.tar

# Update archive with newer files
tar uvf archive.tar files/to/update
```

## Comparison: tar vs zip vs 7z

| Feature | tar | zip | 7z (p7zip) |
|---------|-----|-----|------------|
| Unix perms | ✅ Full | ⚠️ Partial | ✅ Full |
| Symlinks | ✅ Native | ❌ | ✅ |
| Spanned | ✅ | ✅ | ✅ |
| Encryption | With gpg | With password | AES-256 |
| Compression | External filters | Built-in | Built-in (best) |
| Streaming | ✅ | ❌ | ❌ |

> tar is the Unix standard for archives. Pair it with gzip for speed, xz for max compression, or gpg for encryption.
