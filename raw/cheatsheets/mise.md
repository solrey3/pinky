---
title: mise
category: cli
docs_url: https://mise.jdx.dev/
created: "2026-05-10"
tags: [mise, version-manager, devtools, rust, productivity]
---

# mise Cheatsheet

> Polyglot dev tools version manager. Replaces asdf, nvm, pyenv, rbenv, etc. with a single Rust binary. Fast, concurrent, and declarative.

**Official Docs:** https://mise.jdx.dev/  
**GitHub:** https://github.com/jdx/mise  
**Platform(s):** macOS, Linux, Windows (WSL)

---

## Installation

### One-liner
```bash
curl https://mise.run | sh
```

### macOS (Homebrew)
```bash
brew install mise
```

### Linux (Arch)
```bash
yay -S mise
# or
paru -S mise
```

### Linux (cargo)
```bash
cargo install mise
```

### Verify
```bash
mise --version
```

---

## Setup

### Shell activation (required)
Add to your shell rc file:

**Bash (`~/.bashrc`):**
```bash
eval "$(mise activate bash)"
```

**Zsh (`~/.zshrc`):**
```bash
eval "$(mise activate zsh)"
```

**Fish (`~/.config/fish/config.fish`):**
```fish
mise activate fish | source
```

### Global config
**File:** `~/.config/mise/config.toml`

```toml
[tools]
node = "22"
python = "3.12"
rust = "latest"
go = "1.23"
deno = "latest"
bun = "latest"
terraform = "1.9"
helm = "3"
kubectl = "latest"

[env]
PYTHONDONTWRITEBYTECODE = "1"

[settings]
python_compile = true
experimental = true
```

### Project config
**File:** `.mise.toml` (in project root)

```toml
[tools]
node = "20.11"
python = { version = "3.11", virtualenv = ".venv" }

[env]
_.file = ".env"
DATABASE_URL = "postgresql://localhost/mydb"

[tasks]
build = "npm run build"
dev = { run = "npm run dev", depends = ["build"] }
lint = "npm run lint"
```

---

## Command Reference

### Installation / Management
| Command | Description |
|---------|-------------|
| `mise install` | Install all tools from config |
| `mise install node@20` | Install specific version |
| `mise install node@latest` | Install latest node |
| `mise use node@20` | Set and install node 20 in current dir |
| `mise use -g node@20` | Set globally |
| `mise list` | List installed versions |
| `mise ls` | Alias for list |
| `mise list node` | List installed node versions |
| `mise ls-remote node` | List available node versions |
| `mise uninstall node@18` | Remove a version |
| `mise prune` | Remove unused versions |
| `mise upgrade` | Upgrade mise itself |

### Environment / Activation
| Command | Description |
|---------|-------------|
| `mise activate` | Print shell activation script |
| `mise deactivate` | Deactivate for current session |
| `mise env` | Print env vars for current config |
| `mise env -s fish` | Print env for fish shell |
| `mise shell node@20` | Activate node 20 for this shell |
| `mise local node@20` | Set `.mise.toml` version |
| `mise global node@20` | Set `~/.config/mise/config.toml` version |

### Execution
| Command | Description |
|---------|-------------|
| `mise run build` | Run task from `.mise.toml` |
| `mise run` | Run default task |
| `mise exec node@20 -- node -v` | Run command with specific version |
| `mise x node@20 -- node -v` | Alias for exec |
| `mise which node` | Show path to current node binary |
| `mise bin-paths` | List all bin paths |
| `mise reshim` | Regenerate shims |

### Inspection
| Command | Description |
|---------|-------------|
| `mise current` | Show current active versions |
| `mise current node` | Show current node version |
| `mise doctor` | Diagnose issues |
| `mise doctor -s` | Short diagnosis |
| `mise settings` | Show current settings |
| `mise settings set key value` | Set a setting |
| `mise settings get key` | Get a setting |
| `mise plugins list` | List installed asdf plugins |
| `mise plugins add <name>` | Add a plugin |
| `mise plugins update` | Update all plugins |
| `mise generate <type>` | Generate config (github-actions, bootstrap, etc.) |

---

## Examples

### Node project setup
```bash
cd ~/project
mise use node@20
node -v  # Automatically uses node 20
```

### Full stack project
```bash
# .mise.toml
mise use node@22 python@3.12 rust@latest terraform@1.9
mise install
```

### CI/CD (GitHub Actions)
```yaml
- uses: jdx/mise-action@v2
  with:
    install: true
    cache: true
- run: mise run build
- run: mise run test
```

### Direnv-compatible
```toml
[env]
_.path = [".venv/bin"]
```
Or use `mise direnv activate` if you use direnv + mise together.

---

## Tips

- **Shims:** mise shims are in `~/.local/share/mise/shims/` — ensure this is in `PATH`.
- **asdf compatible:** mise can read `.tool-versions` natively (no conversion needed).
- **Fast:** Written in Rust, parallel installation, much faster than asdf.
- **Tasks:** `.mise.toml` `[tasks]` section is a lightweight task runner — no Makefile needed.
- **Experimental features:** Set `experimental = true` in settings to unlock early features.
- **Pinning:** `mise use node@20` pins exact latest 20.x. Use `node@20.11.1` for exact pin.

---
*Generated via cheatsheet skill on 2026-05-10*
