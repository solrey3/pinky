---
title: Tailscale
category: service
docs_url: https://tailscale.com/kb
created: "2026-05-10"
tags: [vpn, networking, mesh, tailscale, zero-trust]
---

# Tailscale Cheatsheet

> Zero-config VPN that creates a secure mesh network between your devices. Based on WireGuard. No open ports, no firewall rules.

**Official Docs:** https://tailscale.com/kb  
**Platform(s):** macOS, Linux, Windows, iOS, Android, BSD

---

## Installation

### macOS
```bash
brew install --cask tailscale
# or Mac App Store
```

### Linux
```bash
# One-liner
curl -fsSL https://tailscale.com/install.sh | sh

# Or package manager
sudo apt install tailscale    # Debian/Ubuntu
sudo dnf install tailscale    # Fedora
sudo pacman -S tailscale      # Arch
sudo apk add tailscale        # Alpine
```

### Windows
```powershell
winget install tailscale.tailscale
# or
scoop install tailscale
```

### Verify
```bash
tailscale version
```

---

## Setup

### Authenticate
```bash
sudo tailscale up
# Or with specific auth key for headless
sudo tailscale up --authkey tskey-auth-xxxxxxxxxx

# With specific tags
sudo tailscale up --authkey tskey-auth-xxx --advertise-tags=tag:server
```

### Enable features
```bash
sudo tailscale up --ssh              # Enable tailscale SSH
sudo tailscale up --accept-routes    # Accept subnet routes
sudo tailscale up --advertise-routes=10.0.0.0/24  # Advertise routes
sudo tailscale up --advertise-exit-node            # Make this an exit node
sudo tailscale up --exit-node=100.x.x.x            # Use exit node
sudo tailscale up --netfilter-mode=off             # Disable subnet routing
```

### Configure as systemd service
```bash
sudo systemctl enable --now tailscaled
```

---

## Command Reference

### Connection
| Command | Description |
|---------|-------------|
| `tailscale up` | Connect to Tailscale network |
| `tailscale down` | Disconnect |
| `tailscale status` | Show connection status |
| `tailscale status --json` | JSON output |
| `tailscale ip` | Show Tailscale IP addresses |
| `tailscale ip -4` | IPv4 only |
| `tailscale ping <host>` | Ping over Tailscale |

### SSH
| Command | Description |
|---------|-------------|
| `tailscale ssh user@machine` | SSH over Tailscale |
| `tailscale serve --https=443 /` | Serve local service |
| `tailscale funnel 3000` | Expose local port to internet |

### Network
| Command | Description |
|---------|-------------|
| `tailscale netcheck` | Network diagnostics |
| `tailscale status` | List peers and relay status |
| `tailscale bugreport` | Generate bug report identifier |
| `tailscale web` | Run web interface (legacy) |
| `tailscale certs <domain>` | Get TLS certs for machine |

### File sharing
| Command | Description |
|---------|-------------|
| `tailscale file cp <file> <machine>:` | Send file to machine |
| `tailscale file get` | Receive files |
| `tailscale file get --wait` | Wait for incoming file |

### ACLs / Admin
| Command | Description |
|---------|-------------|
| `tailscale login` | Re-authenticate (browser) |
| `tailscale logout` | Log out |
| `tailscale set --operator=$USER` | Allow user to run tailscale commands without sudo |

---

## Tips

- **Tailscale IP:** Every device gets a stable 100.x.x.x IP. Use it as a permanent address.
- **MagicDNS:** Access machines by name: `ssh my-server` instead of `ssh 100.x.x.x`.
- **Subnet routers:** Advertise entire subnets with `--advertise-routes` for accessing legacy networks.
- **Exit nodes:** Route all traffic through a node (like a VPN) with `--exit-node`.
- **Tailscale SSH:** No need to manage SSH keys — use `tailscale ssh user@host` or enable `--ssh` for keyless access.
- **Funnel:** Publicly expose a local service: `tailscale funnel 3000` gives you a public URL.
- **Serve:** Serve static files or reverse proxy locally: `tailscale serve https /path`
- **ACLs:** Control access via admin console ACLs at https://login.tailscale.com/admin/acls

---
*Generated via cheatsheet skill on 2026-05-10*
