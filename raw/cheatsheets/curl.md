---
id: curl-cheatsheet
title: curl Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli, http, network]
---

# curl Cheatsheet

**Category:** CLI / HTTP Client  
**Official Docs:** https://curl.se/docs/manpage.html

## Install

```bash
# macOS
brew install curl

# Debian/Ubuntu
sudo apt install curl

# Fedora
sudo dnf install curl
```

## Basic Requests

```bash
# Simple GET
curl https://example.com

# Follow redirects
curl -L https://example.com

# Verbose output
curl -v https://example.com

# Show headers only
curl -I https://example.com

# Write to file
curl -o output.html https://example.com
curl -O https://example.com/file.txt   # Use remote filename
```

## HTTP Methods & Data

```bash
# POST form data
curl -X POST -d "key=value&foo=bar" https://example.com

# POST JSON
curl -X POST -H "Content-Type: application/json" \
  -d '{"name":"Sancho","role":"AI"}' \
  https://example.com/api

# PUT / PATCH / DELETE
curl -X PUT ...
curl -X PATCH ...
curl -X DELETE ...
```

## Headers & Authentication

```bash
# Set header
curl -H "Authorization: Bearer TOKEN" https://api.example.com

# Basic auth
curl -u username:password https://example.com

# Bearer token
curl -H "Authorization: Bearer $TOKEN" ...

# Multiple headers
curl -H "Accept: application/json" -H "X-Custom: value" ...
```

## Cookies

```bash
# Save cookies
curl -c cookies.txt https://example.com

# Load cookies
curl -b cookies.txt https://example.com

# Save + load in one
curl -c cookies.txt -b cookies.txt ...
```

## Upload / Download

```bash
# Upload file
curl -F "file=@/path/to/file.txt" https://example.com/upload

# Download with progress
curl --progress-bar -o file.zip https://example.com/file.zip

# Resume download
curl -C - -o file.zip https://example.com/file.zip
```

## Timeouts & Retries

```bash
# Timeout
curl --max-time 10 https://example.com

# Connect timeout
curl --connect-timeout 5 https://example.com

# Retry on failure (curl 7.71+)
curl --retry 5 --retry-delay 1 --retry-all-errors ...
```

## Proxies & SSL

```bash
# HTTP proxy
curl -x http://proxy:8080 https://example.com

# TLS / SSL
curl -k https://self-signed.example.com     # insecure
curl --cacert /path/to/ca.crt https://...   # custom CA
```

## Useful Flags

| Flag | Description |
|------|-------------|
| `-i` | Include response headers |
| `-s` | Silent (no progress) |
| `-I` | HEAD request only |
| `-X METHOD` | Specify HTTP method |
| `-d data` | Send POST data |
| `-H header` | Add request header |
| `-f` | Fail silently on HTTP errors |
| `-S` | Show error even in silent mode |
| `-w '%{http_code}'` | Output only status code |

## One-liner Snippets

```bash
# Check website status
curl -I -s -o /dev/null -w "%{http_code}\n" https://example.com

# Download and pipe
curl https://example.com | grep "foo"

# JSON pretty print
curl -s https://api.example.com | jq .
```

This cheatsheet is optimized for quick daily reference inside the terminal workflow.