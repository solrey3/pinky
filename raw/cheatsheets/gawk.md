---
id: gawk-cheatsheet
title: gawk Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,text,processing]
---

# gawk Cheatsheet

**Category:** GNU awk — Pattern Scanning & Processing  
**Official Docs:** https://www.gnu.org/software/gawk/manual/

## Basic Syntax

```bash
awk 'pattern { action }' file
awk '{ print $1 }' file          # Print first column
awk -F: '{ print $1 }' /etc/passwd  # Custom delimiter
awk 'NR==10' file                # Print line 10
awk '/pattern/' file             # Print matching lines
```

## Built-in Variables

| Variable | Meaning |
|----------|---------|
| `$0` | Entire line |
| `$1, $2, ...` | Field 1, 2, etc. |
| `NF` | Number of fields |
| `NR` | Current record (line) number |
| `FNR` | Record number in current file |
| `FS` | Field separator (default: space/tab) |
| `OFS` | Output field separator |
| `RS` | Record separator (default: newline) |
| `ORS` | Output record separator |
| `FILENAME` | Current filename |
| `ARGC` / `ARGV` | Argument count/values |

## Patterns

```bash
awk 'NR==1' file                 # First line
awk 'NR>=5 && NR<=10' file       # Lines 5-10
awk '/error/' file               # Contains "error"
awk '!/error/' file              # Does NOT contain "error"
awk '$3 > 100' file              # Third field > 100
awk '$2 == "foo"' file           # Second field equals "foo"
awk 'END { print NR }' file      # Total lines
awk 'BEGIN { print "Start" }'    # Before processing
```

## Actions

```bash
# Print columns 1 and 3
awk '{ print $1, $3 }' file

# Sum column 2
awk '{ sum += $2 } END { print sum }' file

# Average column 2
awk '{ sum += $2; n++ } END { print sum/n }' file

# Count occurrences
awk '{ count[$1]++ } END { for (k in count) print k, count[k] }' file

# Replace field
awk '{ $2 = "new"; print }' file

# Conditional print
awk '{ if ($3 > 50) print $0 }' file
```

## Advanced

```bash
# Multiple files
awk '{ print FILENAME, $0 }' file1 file2

# Custom delimiter
awk -F'[:,]' '{ print $2 }' file    # Split on : or ,

# Multi-line records
awk 'BEGIN { RS=""; FS="\n" } { print $2 }' file

# Execute from file
awk -f script.awk file

# Pass variable
awk -v threshold=100 '$2 > threshold' file

# In-place editing (GNU awk 4.1+)
gawk -i inplace '{ gsub(/old/, "new"); print }' file
```

## One-Liners

```bash
# Double-space file
awk '1; { print "" }' file

# Number lines
awk '{ print NR "\t" $0 }' file

# Remove duplicates (sorted)
awk '!seen[$0]++' file

# Print lines > 80 chars
awk 'length > 80' file

# Get column headers as array
awk 'NR==1 { for (i=1; i<=NF; i++) header[i]=$i } NR>1 { print header[1], $1 }' file

# Join lines with comma
awk '{ printf "%s%s", sep, $0; sep="," } END { print "" }' file

# Parse key=value
awk -F= '{ print "Key:", $1, "Value:", $2 }' file

# Sum all numbers in a column
awk '{ s+=$1 } END { print "Sum:", s, "Avg:", s/NR }' file
```

## Comparison: awk vs sed vs perl

| Task | awk | sed | perl |
|------|-----|-----|------|
| Column arithmetic | ✅ Best | ❌ | Capable |
| Simple substitution | Capable | ✅ Best | Overkill |
| Complex logic | ✅ Great | ❌ | ✅ Best |
| Multi-line | ✅ | Hard | ✅ Easiest |
| Regex power | Good | Good | ✅ Best |
| Speed | Fast | Fast | Medium |

> awk is the sweet spot for structured text processing — columns, calculations, and record-based logic. Use sed for simple transforms, perl when you need full regex power.
