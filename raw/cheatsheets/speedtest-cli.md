---
id: speedtest-cli-cheatsheet
title: speedtest-cli Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,network,diagnostic]
---

# speedtest-cli Cheatsheet

**Category:** Network Speed Test  
**Official Docs:** https://github.com/sivel/speedtest-cli

## Install
```bash
# pip
pip install speedtest-cli
# Debian/Ubuntu
sudo apt install speedtest-cli
# macOS
brew install speedtest-cli
```

## Basic Usage

| Command | Description |
|---------|-------------|
| `speedtest-cli` | Full test (finds best server) |
| `speedtest-cli --simple` | Simple output (ping, down, up) |
| `speedtest-cli --json` | JSON output for parsing |
| `speedtest-cli --csv` | CSV output |
| `speedtest-cli --list` | List all servers |
| `speedtest-cli --server ID` | Test specific server |
| `speedtest-cli --source IP` | Bind to specific interface |

## Flags Reference

| Flag | Description |
|------|-------------|
| `--simple` | Minimal output |
| `--json` | Machine-readable JSON |
| `--csv` | CSV format |
| `--share` | Generate result image URL |
| `--list` | Show all test servers |
| `--server ID` | Use specific server |
| `--mini URL` | Use mini speedtest server |
| `--source IP` | Bind to source IP |
| `--timeout SEC` | Timeout |
| `--secure` | Use HTTPS |
| `--no-download` | Skip download test |
| `--no-upload` | Skip upload test |

## One-Liners

```bash
# Quick check
speedtest-cli --simple

# JSON for logging
speedtest-cli --json > speed-$(date +%s).json

# Test specific server (useful for comparing)
speedtest-cli --server 12345 --simple

# Weekly cron log
speedtest-cli --csv >> ~/speedtests.csv

# Bind to specific interface
speedtest-cli --source 10.0.0.5

# Shareable result link
speedtest-cli --share
```

## Output Examples

```bash
# Simple
Ping: 12.345 ms
Download: 850.67 Mbit/s
Upload: 420.33 Mbit/s

# JSON (key fields)
{
  "server": {"name": "Server Name", "location": "City"},
  "ping": 12.345,
  "download": 106333750,  # bytes/s
  "upload": 52541250,
  "timestamp": "2026-05-11T10:00:00.000000Z"
}
```

## Comparison: speedtest-cli vs iperf3 vs fast.com

| Tool | Pros | Cons |
|------|------|------|
| speedtest-cli | Speedtest.net servers, widely known | Single-threaded, Python overhead |
| iperf3 | LAN testing, multi-thread, raw | Requires server endpoint |
| fast.com | Netflix CDN, no install | Web only, less detail |

> Use speedtest-cli for quick internet speed checks. Use iperf3 for testing between specific endpoints (VPS to home, etc).
