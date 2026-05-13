---
id: starship-cheatsheet
title: starship Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,prompt,shell]
---

# Starship Cheatsheet

**Category:** Cross-Shell Prompt (Rust)  
**Official Docs:** https://starship.rs/

## Install
```bash
curl -sS https://starship.rs/install.sh | sh
brew install starship
```

## Shell Setup
```bash
# Bash (~/.bashrc)
eval "$(starship init bash)"

# Zsh (~/.zshrc)
eval "$(starship init zsh)"

# Fish (~/.config/fish/config.fish)
starship init fish | source
```

## Quick Config (~/.config/starship.toml)
```toml
# Minimal
format = "$all"

# Hide elements
[python]
disable = true

[nodejs]
disable = true

# Show only if directory matches
[rust]
detect_folders = ["src"]
```

## Modules

| Module | Trigger | What it shows |
|--------|---------|---------------|
| `character` | Always | Prompt character (≥, $, #) |
| `directory` | Always | Current path |
| `git_branch` | In git repo | Branch name |
| `git_status` | In git repo | Added, modified, untracked |
| `python` | `.py` or `requirements.txt` | Version + venv name |
| `nodejs` | `package.json` | Node version |
| `rust` | `Cargo.toml` | Rust version |
| `docker` | `Dockerfile` | Docker version/context |
| `aws` | `~/.aws/credentials` | AWS profile |
| `cmd_duration` | Long commands | Execution time |
| `sudo` | After sudo | Sudo indicator |
| `status` | Failed commands | Exit code |
| `time` | Configured | Current time |
| `battery` | If available | Battery level |

## Config Snippets

```toml
# Simpler prompt for large repos
[git_status]
conflicted = "🏳"
ahead = "🏎💨"
behind = "😰"
diverged = "😵"
untracked = "🤷‍"
stashed = "📦"
modified = "📝"
staged = "✅"

# Time
[time]
disabled = false
format = '[$time]($style) '

# Kubernetes
[kubernetes]
disabled = false
format = '󱃾 [⛵ $context](dimmed green) '
```

## One-Liners
```bash
# Preview prompt
echo "$(starship prompt)"

# Explain current prompt
starship explain

# Timing debug
starship timings
```

## Comparison
| Feature | starship | powerlevel10k | oh-my-posh |
|---------|----------|---------------|------------|
| Speed | Fast (Rust) | Medium | Medium |
| Cross-shell | All | Zsh only | All |
| Config | TOML | p10k wizard | JSON/JSONC |
| Simplicity | High | Medium | Medium |
