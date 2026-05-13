---
title: doctl
category: cli
docs_url: https://docs.digitalocean.com/reference/doctl/reference/
created: "2026-05-10"
tags: [digitalocean, cloud, cli, devops, infrastructure]
---

# doctl Cheatsheet

> Official DigitalOcean CLI. Manage Droplets, Kubernetes, Apps, Databases, Volumes, Domains, and more.

**Official Docs:** https://docs.digitalocean.com/reference/doctl/reference/  
**GitHub:** https://github.com/digitalocean/doctl  
**Platform(s):** macOS, Linux, Windows

---

## Installation

### macOS
```bash
brew install doctl
```

### Linux
```bash
# Download latest release
curl -sL https://github.com/digitalocean/doctl/releases/latest/download/doctl-linux-amd64.tar.gz | tar -xzv
sudo mv doctl /usr/local/bin/

# Or via snap
sudo snap install doctl
```

### Windows
```powershell
scoop install doctl
```

### Verify
```bash
doctl version
```

---

## Setup

### Authentication
```bash
# Generate API token at https://cloud.digitalocean.com/account/api/tokens
doctl auth init --context production
# Paste your API token

# Switch contexts
doctl auth list
doctl auth switch --context production
```

### Configuration
**Config file:** `~/.config/doctl/config.yaml`

```yaml
access-token: dop_v1_xxxxxxxxxx
context: production
output: text
```

---

## Command Reference

### Auth
| Command | Description |
|---------|-------------|
| `doctl auth init` | Authenticate with token |
| `doctl auth list` | List auth contexts |
| `doctl auth switch` | Switch context |
| `doctl auth remove` | Remove context |

### Account
| Command | Description |
|---------|-------------|
| `doctl account get` | Account info |
| `doctl account ratelimit` | API rate limit |

### Droplets (Compute)
| Command | Description |
|---------|-------------|
| `doctl compute droplet list` | List droplets |
| `doctl compute droplet create <name> --region nyc1 --size s-1vcpu-1gb --image ubuntu-22-04-x64 --ssh-keys <fingerprint>` | Create droplet |
| `doctl compute droplet delete <id>` | Delete droplet |
| `doctl compute droplet get <id>` | Droplet details |
| `doctl compute droplet resize <id> --size s-2vcpu-2gb --policy yes` | Resize |
| `doctl compute droplet snapshot <id> --snapshot-name <name>` | Snapshot |
| `doctl compute droplet-action reboot <id>` | Reboot |
| `doctl compute droplet-action power-off <id>` | Power off |
| `doctl compute droplet-action power-on <id>` | Power on |
| `doctl compute ssh <id/name>` | SSH into droplet |

### Kubernetes
| Command | Description |
|---------|-------------|
| `doctl kubernetes cluster list` | List clusters |
| `doctl kubernetes cluster create <name>` | Create cluster |
| `doctl kubernetes cluster delete <id>` | Delete cluster |
| `doctl kubernetes cluster get <id>` | Cluster details |
| `doctl kubernetes cluster kubeconfig save <id>` | Save kubeconfig |
| `doctl kubernetes node-pool list <cluster-id>` | List node pools |
| `doctl kubernetes options regions` | Available regions |
| `doctl kubernetes options versions` | Available versions |
| `doctl kubernetes options sizes` | Available sizes |
| `doctl registry login` | Login to container registry |

### Apps (App Platform)
| Command | Description |
|---------|-------------|
| `doctl apps list` | List apps |
| `doctl apps create --spec app.yaml` | Create from spec |
| `doctl apps update <id> --spec app.yaml` | Update from spec |
| `doctl apps delete <id>` | Delete app |
| `doctl apps logs <id>` | View logs |
| `doctl apps spec validate < file.yaml` | Validate spec |

### Databases
| Command | Description |
|---------|-------------|
| `doctl databases list` | List databases |
| `doctl databases create <name> --engine pg --version 15 --size db-s-1vcpu-1gb --region nyc1 --num-nodes 1` | Create |
| `doctl databases get <id>` | Database details |
| `doctl databases delete <id>` | Delete |
| `doctl databases user list <id>` | List users |
| `doctl databases backup list <id>` | List backups |
| `doctl databases replica list <id>` | List replicas |
| `doctl databases pool list <id>` | List connection pools |
| `doctl databases sql-mode get <id>` | Get SQL modes |

### Volumes (Block Storage)
| Command | Description |
|---------|-------------|
| `doctl compute volume list` | List volumes |
| `doctl compute volume create <name> --region nyc1 --size 10` | Create |
| `doctl compute volume delete <id>` | Delete |
| `doctl compute volume-action attach <volume-id> <droplet-id>` | Attach |
| `doctl compute volume-action detach <volume-id>` | Detach |

### Domains / DNS
| Command | Description |
|---------|-------------|
| `doctl compute domain list` | List domains |
| `doctl compute domain create <domain>` | Add domain |
| `doctl compute domain delete <domain>` | Delete domain |
| `doctl compute domain records list <domain>` | List records |
| `doctl compute domain records create <domain> --record-type A --record-name www --record-data 1.2.3.4` | Add record |

### Networking
| Command | Description |
|---------|-------------|
| `doctl compute floating-ip list` | List floating IPs |
| `doctl compute floating-ip create --region nyc1` | Create |
| `doctl compute floating-ip-action assign <ip> <droplet-id>` | Assign |
| `doctl compute firewall list` | List firewalls |
| `doctl compute firewall create --name <name>` | Create firewall |
| `doctl compute load-balancer list` | List LBs |

### VPC / Spaces / Registry
| Command | Description |
|---------|-------------|
| `doctl vpc list` | List VPCs |
| `doctl vpc create --name <name> --region <region> --ip-range <cidr>` | Create VPC |
| `doctl registry login` | Registry login |
| `doctl registry create <name> --subscription-tier basic` | Create registry |
| `doctl registry repository list` | List repos |
| `doctl registry garbage-collection start` | GC registry |

### SSH Keys
| Command | Description |
|---------|-------------|
| `doctl compute ssh-key list` | List keys |
| `doctl compute ssh-key import <name> --public-key-file ~/.ssh/id_rsa.pub` | Add key |
| `doctl compute ssh-key delete <id>` | Delete key |

---

## Global Flags

| Flag | Description |
|------|-------------|
| `--access-token` | API token |
| `--output` | Output format: text/json/yaml |
| `--format` | Go template format |
| `--context` | Auth context |
| `--trace` | Trace HTTP requests |
| `--verbose` | Verbose output |

---

## Tips

- **Output format:** Use `-o json` or `-o yaml` for scripting. Default is human-readable text.
- **Context switching:** Multiple DO accounts? Use `doctl auth init --context staging` for different tokens.
- **App Platform:** The `--spec` flag uses a declarative YAML. See `doctl apps spec get <app-id>` to export existing app specs.
- **Wait flags:** Many create commands have `--wait` to block until ready.
- **SSH:** `doctl compute ssh <name>` auto-resolves the IP and authenticates using the configured SSH key.

---
*Generated via cheatsheet skill on 2026-05-10*
