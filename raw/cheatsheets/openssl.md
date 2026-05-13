---
id: openssl-cheatsheet
title: openssl Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,crypto,tls,security]
---

# openssl Cheatsheet

**Category:** TLS/SSL & Cryptography Toolkit  
**Official Docs:** https://www.openssl.org/docs/

## Check Certificate

```bash
# Inspect server certificate
openssl s_client -connect example.com:443 -servername example.com </dev/null

# Extract certificate to file
openssl s_client -connect example.com:443 -servername example.com </dev/null | openssl x509 -outform PEM > cert.pem

# Parse certificate file
openssl x509 -in cert.pem -text -noout

# Check expiration
echo | openssl s_client -connect example.com:443 2>/dev/null | openssl x509 -noout -dates
```

## Generate Keys & Certificates

```bash
# Generate RSA private key
openssl genrsa -out key.pem 4096

# Generate with AES password protection
openssl genrsa -aes256 -out key.pem 4096

# Generate ECDSA key
openssl ecparam -genkey -name prime256v1 -out key.pem

# Generate self-signed certificate (snakeoil)
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365 -nodes -subj "/CN=localhost"

# Generate CSR
openssl req -newkey rsa:4096 -keyout key.pem -out csr.pem -nodes

# View CSR
openssl req -in csr.pem -text -noout
```

## Convert Formats

| From → To | Command |
|-----------|---------|
| PEM key → DER | `openssl rsa -in key.pem -outform DER -out key.der` |
| DER → PEM | `openssl rsa -in key.der -inform DER -out key.pem` |
| PEM cert → DER | `openssl x509 -in cert.pem -outform DER -out cert.der` |
| PKCS#12 (pfx) → PEM | `openssl pkcs12 -in bundle.pfx -nocerts -out key.pem` |
| PEM → PKCS#12 | `openssl pkcs12 -export -out bundle.pfx -inkey key.pem -in cert.pem` |

## Verify & Debug

```bash
# Verify cert chain
openssl verify -CAfile ca.crt cert.pem

# Check certificate against hostname
openssl x509 -in cert.pem -noout -checkhost example.com

# Test cipher support
openssl s_client -connect example.com:443 -tls1_3

# Check SSL/TLS version negotiated
echo | openssl s_client -connect example.com:443 2>/dev/null | grep Protocol

# Test specific cipher
echo | openssl s_client -connect example.com:443 -cipher 'ECDHE-RSA-AES128-GCM-SHA256'
```

## Hashing & Encoding

```bash
# MD5 (legacy, not secure)
openssl md5 file.txt

# SHA-256
openssl sha256 file.txt
openssl dgst -sha256 file.txt

# Base64 encode
echo "data" | openssl base64
echo "ZGF0YQo=" | openssl base64 -d

# Hex encode
openssl rand -hex 16
```

## Random & Encryption

```bash
# Generate random bytes
openssl rand -base64 32
openssl rand -hex 32

# Encrypt file with AES-256-CBC
openssl enc -aes-256-cbc -salt -in file.txt -out file.txt.enc

# Decrypt
openssl enc -aes-256-cbc -d -in file.txt.enc -out file.txt

# Encrypt with passphrase from env
openssl enc -aes-256-cbc -pbkdf2 -in secret.txt -out secret.txt.enc -pass pass:"$PASS"
```

## TLS Server Test

```bash
# Start TLS listener for testing
openssl s_server -cert cert.pem -key key.pem -accept 4433

# Connect to test server
openssl s_client -connect localhost:4433
```

## One-Liners

```bash
# Check when cert expires
echo | openssl s_client -connect google.com:443 2>/dev/null | openssl x509 -noout -enddate

# Get all SANs from cert
openssl x509 -in cert.pem -noout -text | grep -A1 "Subject Alternative Name"

# Check HSTS header
curl -sI https://example.com | grep strict-transport-security

# Generate password hash (bcrypt-style via passwd)
openssl passwd -crypt mypassword

# Verify TLS 1.2 vs 1.3
echo | openssl s_client -connect example.com:443 -tls1_3 2>&1 | grep "Protocol\|Cipher"
```

## Comparison: openssl vs gpg

| Task | openssl | gpg |
|------|---------|-----|
| TLS certificates | ✅ | ❌ |
| File encryption (ad-hoc) | ✅ | ✅ |
| Email encryption | ❌ | ✅ |
| Key management | X.509 | OpenPGP|
| PKI infrastructure | ✅ | ❌ |
| Password managers | OpenSSL-based | GPG-based |

> Use openssl for TLS, HTTPS debugging, PKI, and X.509 certificate management. Use gpg for email, file sharing, and OpenPGP ecosystems.
