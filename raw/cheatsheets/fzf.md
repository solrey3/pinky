---
title: fzf
category: cli
docs_url: https://github.com/junegunn/fzf
created: 2026-05-10
tags: [fuzzy-finder, search, cli, shell, productivity]
---

# fzf Cheatsheet

> General-purpose command-line fuzzy finder. Fast, interactive filtering of any list.

**Official Docs:** [github.com/junegunn/fzf](https://github.com/junegunn/fzf)  
**Platform(s):** macOS, Linux, Windows

---

## Installation

### macOS
```bash
brew install fzf
$(brew --prefix)/opt/fzf/install   # Install key bindings and fuzzy completion
```

### Linux
```bash
# Debian/Ubuntu
sudo apt install fzf

# Or one-liner git install
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Arch
sudo pacman -S fzf

# Fedora
sudo dnf install fzf
```

### Windows (via scoop or choco)
```powershell
scoop install fzf
# or
choco install fzf
```

### Verify
```bash
fzf --version
```

---

## Quick Start

```bash
# Basic usage — feed anything to fzf
cat file.txt | fzf
ls | fzf

# Interactive file search
fzf

# Preview file content
fzf --preview 'cat {}'

# Multi-select with Tab
fzf --multi
```

---

## Shell Integration

After running the install script, add to `~/.bashrc` or `~/.zshrc`:

```bash
source <(fzf --zsh)      # zsh (fzf v0.48+)
source <(fzf --bash)     # bash (fzf v0.48+)
# Legacy: ~/.fzf.bash or ~/.fzf.zsh
```

**Key bindings enabled:**
- `Ctrl+t` — fuzzy file finder (insert into command line)
- `Ctrl+r` — fuzzy history search
- `Alt+c` — fuzzy cd into directory

---

## Command Reference

### Core flags
| Flag | Description | Example |
|------|-------------|---------|
| `--multi` / `-m` | Multi-select (Tab) | `fzf -m` |
| `--preview 'cmd'` | Preview pane | `fzf --preview 'cat {}'` |
| `--preview-window` | Preview layout | `fzf --preview-window up:50%` |
| `--height` | Height of finder | `fzf --height 40%` |
| `--layout` | Layout: default/reverse | `fzf --layout reverse` |
| `--border` | Add border | `fzf --border rounded` |
| `--prompt` | Custom prompt | `fzf --prompt 'Query> '` |
| `--header` | Header line | `fzf --header 'Select a file'` |
| `--query` | Pre-fill query | `fzf --query 'init'` |
| `--exact` / `-e` | Exact match (no fuzzy) | `fzf -e` |
| `--case` | Case sensitivity: smart/ignore/respect | `fzf --case ignore` |
| `--nth` | Search only Nth field | `fzf --nth 2` |
| `--delimiter` | Field delimiter | `fzf --delimiter ':' --nth 1` |
| `--tac` | Reverse input order | `fzf --tac` |
| `--no-sort` | Don't sort by score | `fzf --no-sort` |
| `--ansi` | Parse ANSI color codes | `fzf --ansi` |
| `--bind` | Custom key bindings | `fzf --bind 'ctrl-a:select-all'` |

### Multi-select bindings
| Key | Action |
|-----|--------|
| `Tab` | Select/deselect |
| `Shift+Tab` | Deselect |
| `Ctrl+a` | Select all |
| `Ctrl+d` | Deselect all |
| `Ctrl+t` | Toggle all |

---

## Examples

### Find and open file
```bash
vim $(fzf)
```

### Kill process with preview
```bash
ps aux | fzf --multi --header-lines=1 | awk '{print $2}' | xargs kill -9
```

### Git branch switcher
```bash
git branch --all | fzf --preview 'git log --oneline {-1}' | xargs git checkout
```

### Directory jump
```bash
cd $(find . -type d | fzf)
```

### Search with ripgrep preview
```bash
rg --line-number --no-heading --color=always "" | fzf --delimiter ':' --nth 3.. --preview 'bat --color=always {1} --highlight-line {2}'
```

### Custom key bindings
```bash
fzf --bind 'ctrl-a:select-all' \
    --bind 'ctrl-d:deselect-all' \
    --bind 'ctrl-t:toggle-all' \
    --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort' \
    --bind 'ctrl-o:execute(vim {})+abort'
```

---

## Environment Variables

| Variable | Description |
|----------|-------------|
| `FZF_DEFAULT_COMMAND` | Default input command (e.g., `fd --type f`) |
| `FZF_DEFAULT_OPTS` | Default flags (e.g., `--height 40% --layout reverse --border`) |
| `FZF_CTRL_T_COMMAND` | Command for Ctrl+t binding |
| `FZF_ALT_C_COMMAND` | Command for Alt+c binding |
| `FZF_CTRL_R_OPTS` | Options for Ctrl+r history |

---

## Tips

- Pair with `fd`, `rg`, or `bat` for best results (`fd --type f | fzf --preview 'bat --color=always {}'`)
- Use `--preview` for file content, git log, man pages, etc.
- Set `FZF_DEFAULT_OPTS` in your shell rc for consistent styling.
- `fzf-tmux` wrapper available for tmux popups: `fzf-tmux -p80%,60%`
- For 2-pane rg integration: `fzf --bind 'change:reload:rg {q}'`

---
*Generated via cheatsheet skill on 2026-05-10*
