---
title: lazygit
category: cli
docs_url: https://github.com/jesseduffield/lazygit
created: 2026-05-10
tags: [git, tui, cli, productivity, version-control]
---

# lazygit Cheatsheet

> Simple terminal UI for git commands. Worktree, staging, branching, merging, rebasing, stashing — all in a single TUI pane.

**Official Docs:** [github.com/jesseduffield/lazygit](https://github.com/jesseduffield/lazygit)  
**Config Reference:** [github.com/jesseduffield/lazygit/blob/master/docs/Config.md](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md)  
**Platform(s):** macOS, Linux, Windows

---

## Installation

### macOS
```bash
brew install jesseduffield/lazygit/lazygit
# or
brew install lazygit
```

### Linux
```bash
# Ubuntu
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin/

# Arch
sudo pacman -S lazygit

# Fedora
sudo dnf copr enable atim/lazygit -y && sudo dnf install lazygit
```

### Windows
```powershell
scoop install lazygit
# or
choco install lazygit
```

### Verify
```bash
lazygit --version
```

---

## Quick Start

```bash
# Launch in current repo
lazygit

# Launch in specific repo
lazygit -p /path/to/repo

# Launch with debug log
lazygit --debug
```

---

## Configuration

**Config file:** `~/.config/lazygit/config.yml`

### Example config
```yaml
gui:
  theme:
    activeBorderColor:
      - green
      - bold
    inactiveBorderColor:
      - white
  showFileTree: true
  nerdFontsVersion: "3"

git:
  paging:
    colorArg: always
    pager: delta --dark --paging=never
  commit:
    signOff: false
  merging:
    manualCommit: false
    args: ""
  pull:
    mode: "merge"
  skipHookPrefix: "WIP"

keybinding:
  universal:
    quit: q
    quitWithoutChangingDirectory: Q
    return: <esc>
  status:
    checkForUpdate: u
  files:
    commitChanges: c
    commitChangesWithEditor: C
    amendLastCommit: A
    toggleStagedAll: a
    refresh: R
  branches:
    createPullRequest: o
    viewPullRequestOptions: O
    checkoutBranchByName: c
    forceCheckoutBranch: F
    merge: M
    rebaseBranch: r
    fastForward: f
    createTag: T

os:
  editCommand: "nvim"
  openCommand: "xdg-open {{filename}}"
```

---

## Key Bindings

### Universal
| Key | Action |
|-----|--------|
| `q` | Quit |
| `?` | Help (context-aware) |
| `1-5` | Switch panels: Status/Files/LocalBranches/Commits/Stash |
| `Tab` / `Shift+Tab` | Next/prev panel |
| `+` | Next layout |
| `_` | Prev layout |
| `:` | Command mode |
| `@` | Open command log |

### Status panel (`1`)
| Key | Action |
|-----|--------|
| `e` | Edit config |
| `u` | Check for updates |

### Files panel (`2`)
| Key | Action |
|-----|--------|
| `Space` | Stage/unstage file |
| `a` | Stage/unstage all |
| `Enter` | View diff |
| `d` | Discard changes |
| `D` | Reset options |
| `c` | Commit (message inline) |
| `C` | Commit (open editor) |
| `A` | Amend last commit |
| `n` | New branch |
| `r` | Refresh |
| `s` | Stash |
| `S` | Stash including untracked |
| `i` | Add to .gitignore |
| `o` | Open file |
| `e` | Edit file |
| `w` | Without pre-commit hook |
| `g` | View upstream reset options |

### Local Branches panel (`3`)
| Key | Action |
|-----|--------|
| `Space` | Checkout branch |
| `n` | New branch |
| `o` | Create pull request |
| `O` | View PR options |
| `M` | Merge into current |
| `r` | Rebase onto current |
| `R` | Rename branch |
| `d` | Delete branch |
| `f` | Fast-forward |
| `g` | View reset options |
| `t` | Set upstream |
| `T` | Create tag |

### Commits panel (`4`)
| Key | Action |
|-----|--------|
| `Enter` | View commit |
| `Space` | Checkout commit |
| `d` | Drop commit |
| `r` | Reword commit |
| `R` | Rename commit with editor |
| `g` | Reset to commit |
| `s` | Squash above commits |
| `f` | Fixup commit |
| `A` | Amend commit |

### Stash panel (`5`)
| Key | Action |
|-----|--------|
| `Space` | Apply stash |
| `g` | Pop stash |
| `d` | Drop stash |

---

## Tips

- **Delta pager:** Set `git.paging.pager: delta` for beautiful diffs.
- **Nerd Fonts:** Set `gui.nerdFontsVersion: "3"` for file icons.
- **CD on exit:** Use the shell integration in your `.zshrc`/`.bashrc` to `cd` to the repo on quit.
- **Custom commands:** Use the `:` command mode for any git command not mapped.
- **Interactive rebase:** Select commits and press `r` to rebase, then `s` to squash, `d` to drop, `e` to edit.
- **Conflict resolution:** Conflicts show as files in the Files panel; press `Enter` to resolve.

---
*Generated via cheatsheet skill on 2026-05-10*
