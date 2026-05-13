---
id: jq-cheatsheet
title: jq Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli, json, data]
---

# jq Cheatsheet

**Category:** CLI / JSON Processor  
**Official Docs:** https://jqlang.github.io/jq/manual/

## Install

```bash
# macOS
brew install jq

# Debian/Ubuntu
sudo apt install jq

# Fedora
sudo dnf install jq
```

## Basic Usage

```bash
# Pretty-print JSON
cat file.json | jq .

# Read from stdin
curl -s https://api.example.com | jq .

# Read from file
jq . file.json
```

## Extraction

```bash
# Get specific field
jq '.name' data.json

# Nested field
jq '.user.name' data.json

# Array access
jq '.users[0]' data.json
jq '.[0].name' data.json

# Select multiple
jq '.name,.email' data.json
```

## Filtering & Maps

```bash
# Filter array
jq '.users[] | select(.age > 30)' data.json

# Map fields
jq '.users[] | {name: .name, age: .age}' data.json

# Extract array
jq '.users[].name' data.json
```

## Construction

```bash
# Create object
echo '{"name":"Sancho"}' | jq '{name: .name, upper: (.name | ascii_upcase)}'

# Create array from stream
jq -n '[{a:1},{a:2}]'
```

## Useful Filters & Functions

| Filter | Description |
|--------|-------------|
| `.` | Identity |
| `.key` | Get key |
| `.[index]` | Array index |
| `[]` | All array elements |
| `\|` | Pipe |
| `select(cond)` | Filter |
| `map(f)` | Map over array |

## Compact & Raw Output

```bash
# Single line
jq -c . file.json

# Raw string (no quotes)
jq -r '.name' data.json
```

## Command-line Injection

```bash
# Pass variables
cat data.json | jq --arg name "Sancho" '{greeting: "hi \($name)"}'

# Multiple args
jq --argjson num 42 --arg str "test" '{num: $num, str: $str}' file.json
```

## Common Patterns

```bash
# Pretty-print & color
jq . file.json

# Count array items
jq '.items | length' data.json

# Grab only errors
jq '.response | select(.error)' data.json

# Flatten list of objects
jq '[.users[] | {id: .id, name: .name}]' data.json
```

## One-liners

```bash
# Extract specific field from API
curl -s https://api.example.com/user | jq -r '.data.name'

# Filter and format
jq -r '.users[] | select(.active) | .email' users.json
```

Fast, powerful, and essential for terminal JSON work.