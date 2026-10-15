---
title: Herdr
category: tool
docs_url: https://herdr.dev/docs/
created: 2026-10-15
tags: [tool, terminal, coding-agents, multiplexer]
---

# Herdr Cheatsheet

> Persistent terminal workspace manager for AI coding agents: sessions contain workspaces, tabs, and panes; the sidebar tracks agent states.

**Official Docs:** https://herdr.dev/docs/

**CLI reference:** https://herdr.dev/docs/cli-reference/

**Version referenced:** 0.9.5

**Platforms:** Linux, macOS, Windows

## Installation

```bash
# Linux / macOS (direct installer)
curl -fsSL https://herdr.dev/install.sh | sh
# macOS or Linux with Homebrew
brew install herdr
# mise
mise use -g herdr
# Verify
herdr --version
```

```powershell
# Windows PowerShell
powershell -ExecutionPolicy Bypass -c "irm https://herdr.dev/install.ps1 | iex"
herdr --version
```

On Windows, if PowerShell's fileless install is blocked, see [official installation alternatives](https://herdr.dev/docs/install/). Update direct installs with `herdr update`; update Homebrew/mise/Nix installs through their package managers.

## Setup / Quickstart

```bash
cd ~/project
herdr                        # launch or attach to persistent default session
# Start pi, claude, codex, etc. in a pane; Herdr detects supported agents.
herdr status                 # inspect local client/server
herdr session list           # named sessions
herdr session attach work    # separate named session
```

Mouse: click panes/tabs, drag split borders, right-click for actions. To detach without stopping processes: `Ctrl+b`, then `q`. Do not launch `herdr` inside an existing Herdr pane; use the CLI to manage the running session. `herdr server stop` *does* stop that session and its processes.

## Configuration

- Linux/macOS: `~/.config/herdr/config.toml`; Windows: `%APPDATA%\herdr\config.toml`.
- Config is optional. `herdr --default-config` shows available settings; `herdr --help` shows the resolved path.
- After editing: `herdr server reload-config`.

```toml
[theme]
name = "catppuccin"

[terminal]
default_shell = ""  # use $SHELL, then /bin/sh
```

| Environment variable | Purpose |
|---|---|
| `HERDR_CONFIG_PATH` | Override config path |
| `HERDR_SESSION` | Select named session for CLI calls |
| `HERDR_SOCKET_PATH` | Override local socket path |
| `HERDR_LOG` | Set log filter, e.g. `herdr=debug` |

## Command Reference

| Command | Purpose |
|---|---|
| `herdr --help` / `herdr <group> --help` | Discover commands and flags |
| `herdr status [server\|client]` | Inspect runtime |
| `herdr workspace list` | List project workspaces |
| `herdr workspace create --cwd ~/project --label project --no-focus` | Create without changing focus |
| `herdr workspace focus <id>` | Focus a workspace |
| `herdr tab list --workspace <id>` | List workspace tabs |
| `herdr tab create --workspace <id> --label logs` | Add a tab |
| `herdr pane list --workspace <id>` | List panes |
| `herdr pane split <id> --direction right` | Split a pane |
| `herdr pane read <id> --source recent-unwrapped --lines 120` | Read pane output |
| `herdr pane run <id> 'command'` | Run a shell command in a pane |
| `herdr agent list` | Show detected agents and states |
| `herdr agent explain <target> --json` | Diagnose agent detection |
| `herdr notification show 'Done' --body 'Task complete'` | Display a notification |
| `herdr server reload-config` | Apply config edits |
| `herdr server stop` | Stop default server and panes |
| `herdr channel set stable` | Choose direct-install release channel |
| `herdr update` | Update a direct install |

## Tips & Gotchas

- Detaching preserves live processes; restarting/stopping the server is different. Named sessions are independent.
- `--remote <ssh-target>` attaches a local client to a remote Herdr server; `herdr machine list` lists saved SSH machines.
- Do not substitute tmux commands/config: Herdr uses its own CLI, socket API, and TOML config.
- For version-specific flags, run `herdr <group> --help` or consult the [CLI reference](https://herdr.dev/docs/cli-reference/).

## See Also

- [Official docs](https://herdr.dev/docs/)
- [Install](https://herdr.dev/docs/install/) · [Configuration](https://herdr.dev/docs/configuration/) · [Concepts](https://herdr.dev/docs/concepts/)
- [GitHub](https://github.com/herdrdev/herdr)

---
*Generated via cheatsheet skill on 2026-10-15*
