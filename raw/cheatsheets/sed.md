---
id: sed-cheatsheet
title: sed Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,text,stream-editor]
---

# sed Cheatsheet

**Category:** Stream Editor  
**Official Docs:** https://www.gnu.org/software/sed/manual/sed.html

## Basic Syntax

```bash
sed 's/old/new/' file          # Replace first occurrence per line
sed 's/old/new/g' file         # Replace all occurrences
sed -i 's/old/new/g' file      # Edit in place
sed -i.bak 's/old/new/g' file  # Backup before edit
```

## Core Commands

| Command | Description |
|---------|-------------|
| `s/pattern/replacement/flags` | Substitute |
| `d` | Delete line |
| `p` | Print line |
| `i text` | Insert before line |
| `a text` | Append after line |
| `c text` | Change (replace) line |
| `y/abc/xyz/` | Transliterate (like tr) |

## Substitution Flags

| Flag | Description |
|------|-------------|
| `g` | Global (all matches per line) |
| `i` | Case-insensitive |
| `n` | Replace nth occurrence only |
| `p` | Print if substituted |
| `w file` | Write to file if substituted |

## Address Ranges

```bash
sed '3d' file                  # Delete line 3
sed '1,5d' file                # Delete lines 1-5
sed '/pattern/d' file          # Delete matching lines
sed '/start/,/end/d' file      # Delete range between patterns
sed '3!d' file                 # Delete everything EXCEPT line 3
```

## Common Patterns

```bash
# Replace in all files
sed -i 's/foo/bar/g' *.txt

# Remove lines matching pattern
sed '/^#/d' file               # Remove comments
sed '/^$/d' file               # Remove blank lines

# Extract specific lines
sed -n '10,20p' file           # Print lines 10-20
sed -n '/pattern/p' file       # Print matching lines

# Add line numbers
sed '=' file | sed 'N; s/\n/ /'

# Remove trailing whitespace
sed -i 's/[[:space:]]*$//' file

# Replace delimiter (use # or | when / is in pattern)
sed 's#/usr/local#/opt#g' file
sed 's|/home/user|/data|g' file
```

## In-Place Editing

```bash
# GNU sed (Linux)
sed -i 's/old/new/g' file

# BSD sed (macOS) — requires empty string argument
sed -i '' 's/old/new/g' file

# Portable: use perl
perl -pi -e 's/old/new/g' file
```

## One-Liners

```bash
# Double-space a file
sed G file

# Reverse file
sed '1!G;h;$!d' file

# Sort unique (with sort)
sed 's/foo/bar/g' file | sort -u

# Replace multi-line pattern
sed -n 'N; s/\npattern/replacement/; P; D' file

# Convert DOS to Unix line endings
sed -i 's/\r$//' file

# Wrap lines at 80 chars
sed -i -E 's/(.{80})/\1\n/g' file

# Print lines matching multiple patterns
sed -n '/error\|warning/p' logfile
```

## Escape Sequences

| Code | Meaning |
|------|---------|
| `\n` | Newline |
| `\t` | Tab |
| `\r` | Carriage return |
| `\` | Backslash |
| `&` | Matched string in replacement |

## Comparison: sed vs awk vs perl

| Task | sed | awk | perl |
|------|-----|-----|------|
| Simple substitution | ✅ Best | Overkill | Overkill |
| Column processing | ❌ | ✅ Best | Capable |
| Complex logic | ❌ | Capable | ✅ Best |
| Multi-line patterns | Hard | Capable | ✅ Easiest |

> sed is the go-to for simple text transforms in pipelines. For anything requiring arithmetic or field parsing, reach for awk. For maximum power (regex, modules), perl -pi -e is the nuclear option.
