---
title: Fabric
category: cli
docs_url: https://github.com/danielmiessler/fabric
created: 2026-05-10
tags: [ai, llm, cli, content-processing, patterns]
---

# Fabric Cheatsheet

> Open-source framework for augmenting humans using AI. Organizes prompts (patterns) by real-world task and runs them against any LLM via CLI.

**Official Docs:** [github.com/danielmiessler/fabric](https://github.com/danielmiessler/fabric)  
**DeepWiki:** [deepwiki.com/danielmiessler/Fabric](https://deepwiki.com/danielmiessler/Fabric)  
**Version referenced:** v1.4.447+ (latest stable)  
**Platform(s):** macOS, Linux, Windows

---

## Installation

### One-Line Install (Recommended)

**Unix/Linux/macOS:**
```bash
curl -fsSL https://raw.githubusercontent.com/danielmiessler/fabric/main/scripts/installer/install.sh | bash
```

**Windows PowerShell:**
```powershell
iwr -useb https://raw.githubusercontent.com/danielmiessler/fabric/main/scripts/installer/install.ps1 | iex
```

### Package Managers

| OS | Command | Binary Name |
|----|---------|-------------|
| macOS (Homebrew) | `brew install fabric-ai` | `fabric-ai` (alias `fabric`) |
| Arch Linux (AUR) | `yay -S fabric-ai` | `fabric-ai` (alias `fabric`) |
| Windows (winget) | `winget install danielmiessler.Fabric` | `fabric` |
| Windows (Scoop) | `scoop install fabric-ai` | `fabric-ai` (alias `fabric`) |

> **Note:** Homebrew and AUR install as `fabric-ai`. Add `alias fabric='fabric-ai'` to your shell rc.

### From Source (Go)
```bash
# Requires Go installed
go install github.com/danielmiessler/fabric/cmd/fabric@latest
```

### Docker
```bash
# Pull and run
docker run --rm -it kayvan/fabric:latest --version

# With config mount
mkdir -p $HOME/.fabric-config
docker run --rm -it -v $HOME/.fabric-config:/home/appuser/.config/fabric kayvan/fabric:latest -p summarize

# REST API server
docker run --rm -it -p 8080:8080 -v $HOME/.fabric-config:/home/appuser/.config/fabric kayvan/fabric:latest --serve
```

### Verify
```bash
fabric --version
```

---

## Setup

**First run:**
```bash
# Interactive setup: prompts for default vendor/model, API keys, directories
fabric --setup
```

The setup writes to:
- `~/.config/fabric/.env` — API keys, default vendor, default model
- `~/.config/fabric/fabric.yaml` — runtime YAML config
- `~/.config/fabric/patterns/` — downloaded pattern catalog (~256 patterns)
- `~/.config/fabric/contexts/`, `sessions/`, `strategies/`, `extensions/`, `locales/`

### Supported AI Providers

**Native:** OpenAI, Anthropic Claude, Google Gemini, Ollama, Azure OpenAI, Amazon Bedrock, Vertex AI, LM Studio, Perplexity, OpenAI Codex

**OpenAI-compatible:** Abacus, AIML, Cerebras, DeepSeek, DigitalOcean, GitHub Models, GrokAI, Groq, Langdock, LiteLLM, MiniMax, Mistral, Novita AI, **OpenRouter**, SiliconCloud, Together, Venice AI, Z AI

Run `fabric --listvendors` for the full list.

---

## Configuration

### Env vars (set in `~/.config/fabric/.env` or export in shell)
| Variable | Description |
|----------|-------------|
| `DEFAULT_VENDOR` | Default LLM vendor (e.g., `OpenRouter`, `OpenAI`) |
| `DEFAULT_MODEL` | Default model (e.g., `openrouter/auto`, `claude-sonnet-4`) |
| `OPENROUTER_API_KEY` | API key for OpenRouter |
| `OPENAI_API_KEY` | API key for OpenAI |
| `ANTHROPIC_API_KEY` | API key for Anthropic |
| `OLLAMA_API_URL` | Ollama endpoint (default: `http://localhost:11434`) |
| `FABRIC_MODEL_PATTERN_NAME` | Per-pattern model mapping: `<vendor>\|<model>` |

### Config directories
```
~/.config/fabric/
├── .env              # Environment overrides
├── fabric.yaml       # Runtime config
├── patterns/         # Downloaded patterns (~256+)
├── contexts/         # Saved conversation contexts
├── sessions/         # Saved sessions
├── strategies/       # Prompt strategies
├── extensions/       # Custom extensions
└── locales/          # i18n locale files
```

### Update patterns
```bash
# Pull latest patterns from the fabric repo
fabric --updatepatterns
```

---

## Command Reference

### Core CLI flags
| Flag | Description | Example |
|------|-------------|---------|
| `-p`, `--pattern` | Choose AI pattern | `echo "text" \| fabric -p summarize` |
| `-m`, `--model` | Choose model | `fabric -m claude-sonnet-4 -p analyze` |
| `-V`, `--vendor` | Choose vendor | `fabric -V "OpenRouter" -m openrouter/auto` |
| `-v`, `--variable` | Set pattern variables | `fabric -p write -v=#topic:AI -v=#words:500` |
| `-C`, `--context` | Use saved context | `fabric -C my-context -p summarize` |
| `--session` | Use saved session | `fabric --session my-session` |
| `-l`, `--listpatterns` | List all available patterns | `fabric -l` |
| `-L`, `--listmodels` | List all available models | `fabric -L` |
| `-x`, `--listcontexts` | List saved contexts | `fabric -x` |
| `-X`, `--listsessions` | List saved sessions | `fabric -X` |
| `--listvendors` | List available vendors | `fabric --listvendors` |
| `--liststrategies` | List prompt strategies | `fabric --liststrategies` |
| `-U`, `--updatepatterns` | Update pattern catalog | `fabric -U` |
| `-S`, `--setup` | Re-run interactive setup | `fabric -S` |
| `-c`, `--copy` | Copy output to clipboard | `echo "text" \| fabric -p summarize -c` |
| `-o`, `--output` | Write output to file | `fabric -p summarize -o result.md` |
| `-s`, `--stream` | Stream response to stdout | `fabric -s` |
| `-t`, `--temperature` | Set temperature (default: 0.7) | `fabric -t 0.3` |
| `-T`, `--topp` | Set top_p (default: 0.9) | `fabric -T 0.95` |
| `-r`, `--raw` | Use model defaults (no chat options) | `fabric -r` |
| `--dry-run` | Show prompt without sending to model | `fabric --dry-run -p summarize` |
| `--search` | Enable web search tool | `fabric --search -p research` |

### Per-Pattern Model Mapping
Set an env var named after the pattern to use a specific model:
```bash
export FABRIC_MODEL_SUMMARIZE="Anthropic|claude-3-sonnet-4"
export FABRIC_MODEL_EXTRACT_WISDOM="OpenRouter|anthropic/claude-opus-4.7"
echo "text" | fabric -p summarize   # Uses Claude Sonnet
```

### YouTube integration
| Flag | Description |
|------|-------------|
| `-y`, `--youtube` | YouTube URL to process | `fabric -y "https://youtube.com/watch?v=..." -p extract_wisdom` |
| `--transcript` | Grab transcript (default) | `fabric -y "..." --transcript` |
| `--transcript-with-timestamps` | Transcript with timestamps | `fabric -y "..." --transcript-with-timestamps` |
| `--comments` | Grab comments | `fabric -y "..." --comments` |
| `--visual` | Extract visual data via OCR/FFmpeg | `fabric -y "..." --visual` |

### Web scraping
| Flag | Description |
|------|-------------|
| `-u`, `--scrape_url` | Scrape URL to markdown via Jina AI | `fabric -u "https://..." -p summarize` |
| `-q`, `--scrape_question` | Search question via Jina AI | `fabric -q "what is fabric?"` |

### Session & context management
| Flag | Description |
|------|-------------|
| `--session <name>` | Start/resume session | `fabric --session my-session -p chat` |
| `-C <name>` | Attach context | `fabric -C research -p write` |
| `-w`, `--wipecontext` | Wipe a context | `fabric -w my-context` |
| `-W`, `--wipesession` | Wipe a session | `fabric -W my-session` |
| `--printcontext` | Print a context | `fabric --printcontext my-context` |
| `--printsession` | Print a session | `fabric --printsession my-session` |
| `--output-session` | Save full session to file | `fabric --output-session -o chatlog.md` |

### REST API Server
```bash
# Start the API server
fabric --serve --address :8080

# With API key
fabric --serve --address :8080 --api-key your-key

# Swagger UI at
open http://localhost:8080/swagger/index.html
```

### Debug levels
| Level | Description |
|-------|-------------|
| `--debug=0` | Off (default) |
| `--debug=1` | Basic debug info |
| `--debug=2` | Detailed debugging |
| `--debug=3` | Trace level |

---

## Examples

### Summarize text
```bash
cat article.md | fabric -p summarize
cat article.md | fabric -p extract_wisdom
cat article.md | fabric -p create_markdown
```

### Run a specific model via OpenRouter
```bash
echo "Explain quantum computing simply" | fabric -V OpenRouter -m openrouter/auto -p write
```

### Summarize a YouTube video
```bash
fabric -y "https://youtube.com/watch?v=DEMO" -p extract_wisdom -o video_notes.md
```

### Scrape a website and summarize
```bash
fabric -u "https://docs.python.org/3/" -p summarize -o python_docs_summary.md
```

### Use context and stream output
```bash
fabric -C project-context -s -p write_code -o output.py
```

### Dry-run to inspect prompt construction
```bash
echo "my input" | fabric --dry-run -p analyze_contract
```

### Generate markdown from a PDF (piped)
```bash
pdftotext paper.pdf - | fabric -p create_markdown -o paper_notes.md
```

---

## Tips & Gotchas

- **Homebrew/AUR binary name:** Installs as `fabric-ai`, not `fabric`. Alias it.
- **Pattern variables:** Use `-v=#role:expert -v=#points:30`. Check the pattern file to see what vars it expects.
- **Ollama local:** Set `OLLAMA_API_URL` and use `-V Ollama -m llama3.2` for fully local inference.
- **Per-pattern models:** The `FABRIC_MODEL_<PATTERN_UPPERCASE>` env var is powerful for routing expensive tasks to cheaper models.
- **Update patterns regularly:** `fabric -U` pulls the latest community patterns from the upstream repo.
- **Sessions persist:** `--session` is great for multi-turn workflows. Wipe them with `-W` to clear history.
- **Web search:** `--search` is available for Anthropic, OpenAI, and Gemini models that support tool use.
- **FFmpeg needed:** `--visual` and YouTube visual extraction require `ffmpeg` and `yt-dlp` installed.
- **i18n:** Use `-g=en`, `-g=zh`, `-g=ja`, etc. for locale-aware output.

---

## Common Patterns

```bash
# List all patterns
fabric -l

# Find patterns matching a keyword
fabric -l | grep -i security

# A few popular built-in patterns:
#   summarize        — Summarize content
#   extract_wisdom   — Extract insights, quotes, habits
#   create_markdown  — Convert content to structured markdown
#   write            — Write content on a topic
#   analyze          — Analyze and critique content
#   ai               — General AI assistant mode
#   research         — Deep research with web search
#   tldw             — Too long, didn't watch (video)
```

---

## See Also

- [Official Repo + Installation Guide](https://github.com/danielmiessler/fabric)
- [DeepWiki](https://deepwiki.com/danielmiessler/Fabric)
- [Pattern GitHub Repo](https://github.com/danielmiessler/fabric/tree/main/data/patterns)
- [Extension Guide](https://github.com/danielmiessler/fabric/blob/main/internal/plugins/template/Examples/README.md)
- [Docker Setup](https://github.com/danielmiessler/fabric/tree/main/scripts/docker)

---
*Generated via cheatsheet skill on 2026-05-10*
