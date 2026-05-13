---
title: lazydocker
category: cli
docs_url: https://github.com/jesseduffield/lazydocker
created: 2026-05-10
tags: [docker, containers, tui, cli, devops]
---

# lazydocker Cheatsheet

> Simple terminal UI for both docker and docker-compose. View, manage, and interact with containers, images, volumes, and networks in a single TUI pane.

**Official Docs:** [github.com/jesseduffield/lazydocker](https://github.com/jesseduffield/lazydocker)  
**Platform(s):** macOS, Linux, Windows

---

## Installation

### macOS
```bash
brew install jesseduffield/lazydocker/lazydocker
```

### Linux (binary)
```bash
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
```

### Windows
```powershell
scoop install lazydocker
```

### Docker
```bash
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v ~/.config/lazydocker:/.config/jesseduffield/lazydocker lazyteam/lazydocker
```

### Verify
```bash
lazydocker --version
```

---

## Quick Start

```bash
# Launch in current project
cd /path/to/project  # where docker-compose.yml lives
lazydocker

# Launch anywhere
lazydocker
```

---

## Configuration

**Config file:** `~/.config/lazydocker/config.yml`

```yaml
gui:
  scrollHeight: 2
  language: "auto"
  theme:
    activeBorderColor:
      - green
      - bold
    inactiveBorderColor:
      - white

commandTemplates:
  dockerCompose: "docker compose"
  restartService: "{{ .DockerCompose }} restart {{ .Service.Name }}"
  rebuildService: "{{ .DockerCompose }} up -d --build {{ .Service.Name }}"
  stopService: "{{ .DockerCompose }} stop {{ .Service.Name }}"
  serviceLogs: "{{ .DockerCompose }} logs --since=60m --follow {{ .Service.Name }}"
  viewServiceLogs: "{{ .DockerCompose }} logs --follow {{ .Service.Name }}"
  allLogs: "{{ .DockerCompose }} logs --tail=300 -f"
  viewAlLogs: "{{ .DockerCompose }} logs"
  dockerComposeConfig: "{{ .DockerCompose }} config"

customCommands:
  services:
    - name: "shell"
      attach: true
      command: "docker exec -it {{ .Service.Name }} /bin/sh"

stats:
  graphs:
    - caption: CPU (%)
      statPath: "DerivedStats.CPUPercentage"
    - caption: Memory (MB)
      statPath: "DerivedStats.MemoryPercentage"
```

---

## Key Bindings

### Navigation
| Key | Action |
|-----|--------|
| `?` | Help |
| `Tab` / `Shift+Tab` | Cycle panels |
| `q` | Quit |
| `]` | Next tab |
| `[` | Prev tab |

### Services (docker-compose)
| Key | Action |
|-----|--------|
| `u` | Up service |
| `d` | Down service |
| `r` | Restart service |
| `s` | Stop service |
| `b` | Rebuild service |
| `l` | View logs |
| `Enter` | Attach to container |
| `e` | Exec shell in container |
| `c` | Custom command |

### Containers
| Key | Action |
|-----|--------|
| `r` | Restart |
| `s` | Stop |
| `d` | Remove |
| `p` | Pause |
| `b` | Prune |
| `e` | Exec shell |
| `w` | View top |

### Images
| Key | Action |
|-----|--------|
| `d` | Remove image |
| `D` | Remove dangling images |
| `b` | Build image |
| `r` | Run image |

### Volumes
| Key | Action |
|-----|--------|
| `d` | Remove volume |
| `D` | Prune volumes |

### Networks
| Key | Action |
|-----|--------|
| `d` | Remove network |
| `D` | Prune networks |

---

## Tips

- **docker vs docker-compose:** lazydocker auto-detects `docker-compose.yml` in cwd and shows services. Without one, it shows all Docker resources.
- **Custom commands:** Define frequently used exec commands in `config.yml` under `customCommands`.
- **Logs:** Default is `--since=60m`. Change via `commandTemplates`.
- **Stats graphs:** Real-time CPU/memory graphs use `docker stats` under the hood.
- **Exec shell:** `e` on a service tries `/bin/sh` or `/bin/bash` automatically.

---
*Generated via cheatsheet skill on 2026-05-10*
