---
title: k9s
category: cli
docs_url: https://k9scli.io/
created: "2026-05-10"
tags: [kubernetes, k8s, tui, devops, monitoring]
---

# k9s Cheatsheet

> Kubernetes CLI to manage clusters in style. Full-screen TUI for navigating pods, logs, resources, and executing commands.

**Official Docs:** https://k9scli.io/  
**GitHub:** https://github.com/derailed/k9s  
**Version:** v0.32+

---

## Installation

### macOS
```bash
brew install k9s
```

### Linux
```bash
# Binary
curl -sS https://webinstall.dev/k9s | bash

# Arch
sudo pacman -S k9s

# Or download from releases
curl -LO https://github.com/derailed/k9s/releases/latest/download/k9s_linux_amd64.tar.gz
tar -xzf k9s_linux_amd64.tar.gz
sudo mv k9s /usr/local/bin/
```

### Windows
```powershell
choco install k9s
# or
scoop install k9s
```

### Verify
```bash
k9s version
```

---

## Quick Start

```bash
k9s                                    # Start with current context
k9s -n <namespace>                     # Start in specific namespace
k9s -c <context>                       # Start with specific context
k9s --readonly                         # Read-only mode
k9s -l debug                           # Log level
```

---

## Configuration

**Config file:** `~/.config/k9s/config.yaml`
**Skins:** `~/.config/k9s/skins/`

```yaml
k9s:
  liveViewAutoRefresh: false
  screenDumpDir: /tmp/k9s-screens
  refreshRate: 2
  maxConnRetry: 5
  readOnly: false
  noExitOnCtrlC: false
  ui:
    enableMouse: false
    headless: false
    logoless: false
    crumbsless: false
    noIcons: false
    defaultsToFullScreen: false
  clusters:
    <cluster-name>:
      namespace:
        active: default
        favorites:
          - default
          - kube-system
          - production
      view:
        active: pod
  thresholds:
    cpu:
      critical: 90
      warn: 70
    memory:
      critical: 90
      warn: 70
```

---

## Command Reference

### Global Keys
| Key | Action |
|-----|--------|
| `?` | Help |
| `q` / `Ctrl+c` | Quit |
| `:` | Command mode (go to resource) |
| `/` | Filter mode |
| `Esc` | Cancel / back |
| `a` | Toggle autorefresh |
| `Ctrl+r` | Refresh |
| `Ctrl+d` | Delete resource |
| `Ctrl+k` | Kill resource |
| `Ctrl+q` | Toggle fullscreen |
| `d` | Describe resource |
| `e` | Edit resource |
| `l` | Logs |
| `y` | YAML view |
| `r` | Resource view |

### Navigation
| Key | Action |
|-----|--------|
| `g` / `G` | Top / bottom |
| `j` / `k` | Down / up |
| `h` / `l` | Parent / child |
| `Tab` | Next view |
| `Backspace` | Previous view |
| `0-9` | Jump to row |

### Resource Switching
| Command | Description |
|---------|-------------|
| `:pod` / `:po` | Pods |
| `:deploy` | Deployments |
| `:svc` | Services |
| `:ns` | Namespaces |
| `:node` | Nodes |
| `:cm` | ConfigMaps |
| `:secret` | Secrets |
| `:pv` / `:pvc` | Persistent Volumes/Claims |
| `:job` | Jobs |
| `:cronjob` | CronJobs |
| `:ing` | Ingress |
| `:rbac` | RBAC |
| `:sa` | ServiceAccounts |
| `:rs` | ReplicaSets |
| `:ds` | DaemonSets |
| `:sts` | StatefulSets |
| `:hpa` | HorizontalPodAutoscalers |
| `:netpol` | NetworkPolicies |
| `:role` / `:cr` | Roles / ClusterRoles |
| `:all` | All resources |

### Pod Operations
| Key | Action |
|-----|--------|
| `s` | Shell into pod |
| `Shift+s` | Shell with specific container |
| `l` | View logs |
| `Shift+l` | Previous container logs |
| `f` | Follow logs |
| `p` | Port forward |
| `Shift+p` | Port forward to specific port |
| `Shift+d` | Describe pod |

### Namespace Switching
| Key | Action |
|-----|--------|
| `:` then type namespace | Filter namespaces |
| `:ns` | View all namespaces |
| `Enter` on namespace | Switch context |

### Context Switching
| Key | Action |
|-----|--------|
| `:ctx` | View contexts |
| `Enter` on context | Switch |

---

## Tips

- **Skinning:** Place skins in `~/.config/k9s/skins/` and select with `:skin <name>`.
- **Plugins:** Define custom commands in `~/.config/k9s/plugins.yaml`.
- **Read-only mode:** `k9s --readonly` for production safety.
- **Resource usage:** Built-in thresholds show CPU/memory warnings.
- **Port forwarding:** `p` on a pod opens port-forward dialog.
- **XRay views:** Use `:xray` for visual cluster topology.

---
*Generated via cheatsheet skill on 2026-05-10*
