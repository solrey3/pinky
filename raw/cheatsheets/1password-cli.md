---
title: 1Password CLI (op)
category: cli
docs_url: https://developer.1password.com/docs/cli/
created: "2026-05-10"
tags: [1password, password-manager, secrets, cli, security]
---

# 1Password CLI (op) Cheatsheet

> Official 1Password command-line tool. Manage items, vaults, users, and securely inject secrets into scripts and environments.

**Official Docs:** https://developer.1password.com/docs/cli/  
**Platform(s):** macOS, Linux, Windows

---

## Installation

### macOS
```bash
brew install --cask 1password-cli
```

### Linux
```bash
# Download from https://app-updates.agilebits.com/product_history/CLI2
# Or
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
sudo apt update && sudo apt install 1password-cli
```

### Windows
```powershell
scoop install 1password
```

### Verify
```bash
op --version
```

---

## Setup

### Sign in
```bash
# Interactive sign-in (browser)
op signin

# Using biometric unlock (1Password desktop app)
op signin --biometric

# Service account (CI/CD)
op signin --service-account-token <token>
```

### Environment setup
```bash
# Add to shell rc for automatic sign-in
export OP_BIOMETRIC_UNLOCK_ENABLED=true

eval "$(op signin)"  # Legacy eval mode
# Modern: op signin is interactive, no eval needed
```

---

## Command Reference

### Accounts & Sign-in
| Command | Description |
|---------|-------------|
| `op signin` | Sign in to 1Password |
| `op signout` | Sign out |
| `op account list` | List accounts |
| `op account add --address my.1password.com --email me@example.com` | Add account |
| `op whoami` | Show current user |

### Vaults
| Command | Description |
|---------|-------------|
| `op vault list` | List vaults |
| `op vault get <name>` | Vault details |
| `op vault create <name>` | Create vault |
| `op vault delete <name>` | Delete vault |
| `op vault group grant --group <group> --vault <vault> --permissions manage_vault` | Grant permissions |

### Items
| Command | Description |
|---------|-------------|
| `op item list` | List items |
| `op item list --vault <vault>` | List in vault |
| `op item get <item>` | Get item details |
| `op item get <item> --field password` | Get specific field |
| `op item get <item> --field password --reveal` | Show password |
| `op item create --category=login --title="My Login" username=me password=secret` | Create item |
| `op item edit <item> --url https://example.com` | Edit item |
| `op item delete <item>` | Delete item |
| `op item share <item> --emails friend@example.com` | Share item |

### Documents & Files
| Command | Description |
|---------|-------------|
| `op document list` | List documents |
| `op document get <doc> --output-file file.pdf` | Download document |
| `op document create file.pdf --title "My PDF"` | Upload document |
| `op document delete <doc>` | Delete document |

### Secrets Injection
| Command | Description |
|---------|-------------|
| `op run --env-file=.env -- <cmd>` | Run command with secrets from 1Password |
| `op run -- npm start` | Inject secrets and run npm |
| `op inject -i template.env -o .env` | Inject secrets into template |
| `op read "op://vault/item/field"` | Read secret field directly |
| `op read "op://Private/GitHub/token"` | Read specific password |

### Templates
```bash
# Create a .env template
cat > env.template << 'EOF'
DATABASE_URL=op://Production/Database/password
API_KEY=op://Production/API/credential
EOF

# Inject
op inject -i env.template -o .env
```

### SSH Keys
| Command | Description |
|---------|-------------|
| `op ssh add --fingerprint <fp>` | Add SSH key agent |
| `op ssh generate --vault <vault>` | Generate SSH key |
| `op ssh list` | List SSH keys |

### Users & Groups
| Command | Description |
|---------|-------------|
| `op user list` | List users |
| `op group list` | List groups |
| `op group user list <group>` | List group members |

---

## Examples

### Run script with secrets
```bash
op run --env-file=.env -- ./deploy.sh
```

### Docker with secrets
```bash
op run --env-file=.env -- docker run --env-file <(op env) myapp
```

### CI/CD service account
```bash
# Set service account token
export OP_SERVICE_ACCOUNT_TOKEN="ops_xxxxxxxx"
op signin --service-account-token "$OP_SERVICE_ACCOUNT_TOKEN"
op item get "API Key" --field credential
```

### Password generation
```bash
op item create --category password --generate-password=20,letters,digits --title "Generated Password"
```

---

## Tips

- **Biometric unlock:** Enable in 1Password desktop app settings, then use `op signin --biometric`.
- **Service accounts:** Use for CI/CD. Create in 1Password admin console, scope to specific vaults.
- **Secret references:** Use `op://vault/item/field` URIs for declarative secret management.
- **Templates:** Store `.env.template` in git, never `.env`. Use `op inject` at runtime.
- **`op run`:** Automatically replaces env var values that match `op://...` URIs.
- **SSH agent integration:** `op ssh add` lets you use 1Password-stored SSH keys without ssh-agent setup.

---
*Generated via cheatsheet skill on 2026-05-10*
