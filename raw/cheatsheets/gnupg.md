---
id: gnupg-cheatsheet
title: gnupg Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,crypto,security]# gnupg Cheatsheet

**Category:** GnuPG / OpenPGP Encryption & Signing  
**Official Docs:** https://www.gnupg.org/documentation/

## Install
```bash
# macOS
brew install gnupg
# Debian/Ubuntu
sudo apt install gnupg
# Fedora
sudo dnf install gnupg
```

## Key Generation & Listing

```bash
gpg --full-generate-key          # Interactive key gen
gpg --list-keys                  # Public keys
gpg --list-secret-keys           # Private keys
gpg --list-keys --keyid-format LONG   # Long key IDs
gpg --fingerprint                # Show fingerprints
```

## Key Export & Import

```bash
# Export public key (ASCII armor)
gpg --armor --export user@example.com > pubkey.asc

# Export private key (BACKUP SECURELY)
gpg --armor --export-secret-keys user@example.com > privkey.asc

# Export revocation certificate
gpg --gen-revoke user@example.com

# Import key
gpg --import pubkey.asc
```

## Encryption & Decryption

| Command | Description |
|---------|-------------|
| `gpg -c file.txt` | Symmetric encrypt (password) |
| `gpg -d file.txt.gpg` | Decrypt symmetric |
| `gpg -e -r user@example.com file.txt` | Encrypt for recipient |
| `gpg -d file.txt.gpg > file.txt` | Decrypt to file |
| `gpg --output file.txt -d file.txt.gpg` | Decrypt with output |

## Signing & Verification

```bash
# Sign (detached .sig file)
gpg --detach-sign file.txt

# Sign (inline/cleartext)
gpg --clearsign file.txt

# Verify signature
gpg --verify file.txt.sig file.txt

# Sign + encrypt in one
gpg --sign --encrypt -r recipient@example.com file.txt
```

## Keyserver Operations

```bash
# Upload public key to keyserver
gpg --keyserver keyserver.ubuntu.com --send-keys KEYID

# Search for key
gpg --keyserver keyserver.ubuntu.com --search-keys user@example.com

# Refresh keys
gpg --refresh-keys

# Receive specific key
gpg --keyserver keyserver.ubuntu.com --recv-keys KEYID
```

## Trust & Editing

```bash
# Edit key (trust, expiration, subkeys)
gpg --edit-key user@example.com

# Inside edit-key prompt:
# trust    → set ownertrust
# expire     → change expiration
# addkey    → add subkey
# save      → save changes
# quit      → quit without saving

# Change passphrase
gpg --change-passphrase user@example.com
```

## Revocation & Deletion

```bash
# Revoke key (you need revocation cert)
gpg --import revocation.asc
gpg --send-keys KEYID

# Delete public key
gpg --delete-key user@example.com

# Delete secret key
gpg --delete-secret-key user@example.com

# Delete both
gpg --delete-secret-and-public-key user@example.com
```

## Useful Flags

| Flag | Description |
|------|-------------|
| `-a`, `--armor` | ASCII armor output |
| `-r`, `--recipient` | Specify recipient |
| `-e`, `--encrypt` | Encrypt |
| `-d`, `--decrypt` | Decrypt |
| `-s`, `--sign` | Sign |
| `-c`, `--symmetric` | Symmetric encryption |
| `-o`, `--output` | Output file |
| `-v`, `--verbose` | Verbose |
| `-q`, `--quiet` | Quiet |
| `--batch` | Non-interactive mode |
| `--yes` | Auto-answer yes |

## Quick Snippets

```bash
# Encrypt file for yourself
gpg -e -r $(gpg --list-keys --with-colons | grep uid | head -1 | cut -d: -f10) file.txt

# Decrypt and pipe to stdout
gpg -d file.txt.gpg | less

# Create ASCII-signed message
echo "Secret message" | gpg --clearsign

# Verify downloaded ISO signature
gpg --verify sha256sums.txt.gpg sha256sums.txt

# Agent cache timeout (5 minutes)
echo "default-cache-ttl 300" >> ~/.gnupg/gpg-agent.conf
gpgconf --reload gpg-agent
```

## Comparison: gpg vs openssl

| Task | gpg | openssl |
|------|-----|---------|
| Email encryption | ✅ Native | ❌ |
| Key management | ✅ Keyring | Manual certs |
| Symmetric file encrypt | ✅ | ✅ |
| X.509 / TLS | ❌ | ✅ |
| S/MIME | ❌ | ✅ |
| Web PKI | ❌ | ✅ |

> Use gpg for email, file encryption, and OpenPGP workflows. Use openssl for TLS certificates, HTTPS, and X.509 infrastructure.
