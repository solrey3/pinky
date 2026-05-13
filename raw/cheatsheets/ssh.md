---
id: ssh-cheatsheet
title: ssh Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli, ssh, remote]
---

# ssh Cheatsheet

**Category:** Secure Remote Access  
**Official Docs:** https://man.openbsd.org/ssh_config

## Connect

```bash
ssh user@host                          # TCP 22
ssh user@host -p 2222                 # Custom port
ssh user@host -i ~/.ssh/key           # Specific key
ssh -i ~/.ssh/key.pem ec2-user@1.2.3.4 # AWS EC2
```

## Config File (~/.ssh/config)

```bash
Host myvps
    HostName 203.0.113.10
    User sancho
    Port 22
    IdentityFile ~/.ssh/id_vps
    ServerAliveInterval 60

Host github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
```

## Key Management

```bash
# Generate key pair
ssh-keygen -t ed25519 -C "comment" -f ~/.ssh/id_name
ssh-keygen -t rsa -b 4096 -C "comment"

# Generate without passphrase
ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_name

# Generate from CSR (for IoT/auth)
openssl req -newkey rsa:2048 -nodes -keyout key.pem -out csr.pem

# Copy public key to server
ssh-copy-id user@host

# Show key fingerprint
ssh-keygen -lf ~/.ssh/id_ed25519.pub

# Show randomart
ssh-keygen -lvf ~/.ssh/id_ed25519.pub
```

## Agent & Forwarding

```bash
# Add key to agent
ssh-add ~/.ssh/id_ed25519

# List agent keys
ssh-add -l

# Remove agent key
ssh-add -d ~/.ssh/id_ed25519

# Agent forwarding (on connect)
ssh -A user@host
```

## SSHFS (Mount Remote Filesystem)

```bash
# Mount remote directory
sshfs user@host:/remote/path /local/mountpoint

# Unmount
fusermount -u /local/mountpoint
```

## Tunneling / Port Forwarding

| Type | Command |
|------|---------|
| Local forward | `ssh -L 8080:localhost:80 user@host` |
| Remote forward | `ssh -R 9090:localhost:3000 user@host` |
| Dynamic/SOCKS | `ssh -D 1080 user@host` |
| Jump host | `ssh -J bastion user@target` |
| ProxyCommand | `ssh -o ProxyCommand="ssh -W %h:%p bastion" user@target` |

## SCP (Secure Copy)

```bash
# Copy local to remote
scp file.txt user@host:/path/

# Copy remote to local
scp user@host:/path/file.txt ./

# Recursive
scp -r ./folder user@host:/path/

# Preserving attributes
scp -p file.txt user@host:/path/

# Limit bandwidth (KB/s)
scp -l 800 file.txt user@host:/path/
```

## Checking & Diagnostic

```bash
# Test connection
ssh -T user@host

# Verbose (for debugging)
ssh -vvv user@host

# Show server fingerprint on first connect
ssh-keyscan -t ed25519 host

# Check authorized_keys
ssh user@host "cat ~/.ssh/authorized_keys"
```

## Quick Recipes

```bash
# Git over SSH (no https)
git clone git@github.com:user/repo.git

# Sudo over ssh
ssh user@host "sudo systemctl restart nginx"

# Tail remote log
ssh user@host "tail -f /var/log/syslog"

# Kill all your ssh sessions
pkill -u $(whoami) sshd
```

Must-have for VPS life, cloud work, and secure remote access.
