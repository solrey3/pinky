---
id: uuidgen-cheatsheet
title: uuidgen Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,uuid,identifier]
---

# uuidgen Cheatsheet

**Category:** UUID Generator  
**Official Docs:** `man uuidgen` (util-linux on Linux, native on macOS)

## Generate UUIDs

```bash
# Random UUID (v4) — default
uuidgen
# → 550e8400-e29b-41d4-a716-446655440000

# Time-based UUID (v1) — Linux
uuidgen -t

# Random UUID (v4) — Linux explicit
uuidgen -r

# SHA1-based (v5) with namespace — Linux
uuidgen --sha1 --namespace @dns --name "example.com"

# MD5-based (v3) with namespace — Linux
uuidgen --md5 --namespace @url --name "https://example.com"
```

## Format Options

```bash
# macOS: uppercase (default)
uuidgen
# → 550E8400-E29B-41D4-A716-446655440000

# Lowercase
uuidgen | tr '[:upper:]' '[:lower:]'

# No dashes
uuidgen | tr -d '-'
# → 550e8400e29b41d4a716446655440000

# URN format
uuidgen --namespace @dns --name test --sha1
```

## Linux vs macOS

| Feature | Linux (util-linux) | macOS |
|---------|-------------------|-------|
| uuidgen -t | Time-based (v1) | Same |
| uuidgen -r | Random (v4) | Same |
| uuidgen -s | Not available | Not available |
| --sha1 / --md5 | ✅ v5/v3 | ❌ |
| --namespace | ✅ | ❌ |

## One-Liners

```bash
# Generate multiple
for i in {1..5}; do uuidgen; done

# Insert into SQL
echo "INSERT INTO users (id) VALUES ('$(uuidgen)');"

# Generate API key (no dashes, lowercase)
uuidgen | tr -d '-' | tr '[:upper:]' '[:lower:]'

# Nano ID alternative (if available)
nanoid 2>/dev/null || openssl rand -hex 16

# Bulk generate to file
uuidgen > uuids.txt          # 1
for i in {1..100}; do uuidgen; done > uuids.txt

# UUID v5 from string (Linux)
uuidgen --sha1 --namespace @dns --name "user-123"
# → deterministic: same input = same UUID
```

## UUID Versions

| Ver | Type | Use Case |
|-----|------|----------|
| v1 | Time + MAC | Not recommended (leaks MAC) |
| v3 | MD5 + namespace | Deterministic |
| v4 | Random | Most common, default |
| v5 | SHA1 + namespace | Deterministic, preferred over v3 |
| v7 | Time-sortable random | Modern, DB-friendly |

## In Scripts

```bash
# Safe temp dir
TMPDIR="/tmp/$(uuidgen)"
mkdir -p "$TMPDIR"
trap "rm -rf $TMPDIR" EXIT

# Unique log file
LOG="/var/log/app-$(uuidgen).log"
```

## Comparison: uuidgen vs /proc/sys/kernel/random/uuid

| Source | Speed | Quality | Notes |
|--------|-------|---------|-------|
| `uuidgen` | Fast | OS CSPRNG | Portable, standard |
| `/proc/sys/kernel/random/uuid` | Fast | Kernel CSPRNG | Linux only, no v1/v5 |
| `cat /proc/sys/kernel/random/uuid` | Same | Same | Same |

> uuidgen is the portable standard. On Linux, /proc/sys/kernel/random/uuid is equivalent but less flexible. For deterministic UUIDs (v3/v5), uuidgen on Linux is required.
