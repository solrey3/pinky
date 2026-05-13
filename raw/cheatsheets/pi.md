---
title: Pi (pi-coding-agent)
category: cli
docs_url: https://github.com/badlogic/pi
created: "2026-05-10"
tags: [pi, coding-agent, cli, ai, coding]
---

# Pi Cheatsheet

> Terminal-based coding agent harness. Uses OpenRouter for LLM access. Supports file operations, bash execution, code editing, and writing. Progressive skill loading for specialized workflows.

**Official Docs:** See `~/.local/share/mise/installs/node/24.15.0/lib/node_modules/@mariozechner/pi-coding-agent/README.md`  
**GitHub:** https://github.com/badlogic/pi  
**Platform(s):** Linux, macOS (Node.js based)

---

## Installation

### Prerequisites
- Node.js 24+ (via mise recommended)
- pnpm or npm
- An OpenRouter API key

### Install via npm
```bash
npm install -g @mariozechner/pi-coding-agent
# or
pnpm install -g @mariozechner/pi-coding-agent
```

### Or clone and run
```bash
git clone https://github.com/badlogic/pi.git
cd pi && pnpm install && pnpm build
```

### Verify
```bash
pi --version
```

---

## Setup

### Configuration
**Config file:** `~/.config/pi/settings.json` (or project-level `.pi/settings.json`)

```json
{
  "model": "openrouter/auto",
  "apiKey": "sk-or-v1-xxxxxxxx",
  "maxIterations": 30,
  "temperature": 0.7,
  "enableSkillCommands": true,
  "skills": ["~/.pi/agent/skills"]
}
```

### Environment variables
| Variable | Description |
|----------|-------------|
| `OPENROUTER_API_KEY` | API key for OpenRouter |
| `PI_CONFIG` | Path to custom config |

### Skill directories
- Global: `~/.pi/agent/skills/`
- Project: `.pi/skills/` (in cwd or ancestor dirs)

---

## Command Reference

### Basic usage
| Command | Description |
|---------|-------------|
| `pi "<prompt>"` | Single-shot execution |
| `pi` | Interactive mode |
| `pi -f <file>` | Read prompt from file |
| `pi --model <model>` | Override model |
| `pi --max-iterations <n>` | Limit iterations |
| `pi --skill <path>` | Load specific skill |
| `pi --no-skills` | Disable skill loading |

### Interactive mode
| Key | Action |
|-----|--------|
| `Ctrl+c` | Cancel current operation |
| `Ctrl+d` | Exit |
| `/quit` | Quit |
| `/settings` | Open settings |
| `/skill:<name>` | Load and execute skill |
| `/clear` | Clear screen |

### Skills
| Command | Description |
|---------|-------------|
| `pi --list-skills` | List available skills |
| `pi --skill <path>` | Load skill from path |
| `/skill:cheatsheet <product>` | Create a cheatsheet |
| `/skill:wiki-ingest <path>` | Ingest into wiki |
| `/skill:web-search <query>` | Web search |

---

## Tips

- **Context window:** Pi maintains conversation context across multiple turns in interactive mode.
- **Skills:** Skills are loaded on-demand. Use `/skill:name` to force-load or let the agent match tasks.
- **Project skills:** Place skill directories in `.pi/skills/` for project-specific workflows.
- **Settings:** Project-level `.pi/settings.json` overrides global settings.
- **No RAG by default:** Pi is stateless unless you use skills like wiki-ingest for persistent knowledge.

---
*Generated via cheatsheet skill on 2026-05-10*
