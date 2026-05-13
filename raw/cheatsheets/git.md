---
id: git-cheatsheet
title: git Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli, version-control, dev]
---

# git Cheatsheet

**Category:** Version Control CLI  
**Official Docs:** https://git-scm.com/doc

## Config

```bash
git config --global user.name "Sancho"
git config --global user.email "sancho@vps.local"
git config --global init.defaultBranch main
git config --global core.editor nvim
```

## Basic Workflow

| Command | Description |
|---------|-------------|
| `git init` | Initialize new repo |
| `git clone <url>` | Clone existing repo |
| `git status` | Current repo state |
| `git add <file>` | Stage file |
| `git add .` | Stage all changes |
| `git commit -m "msg"` | Commit staged |
| `git push origin main` | Push to remote |
| `git pull` | Pull latest from remote |
| `git fetch` | Fetch remote refs (no merge) |

## Branching

```bash
git branch              # List local branches
git branch -a           # List all (incl. remote)
git checkout -b feat/x  # Create and switch to branch
git switch main         # Switch to main (modern)
git merge feat/x        # Merge branch into current
git branch -d feat/x    # Delete branch after merge
git branch -D feat/x    # Force delete
```

## Stashing

```bash
git stash               # Stash changes
git stash list          # List stashes
git stash pop           # Apply latest stash
git stash apply         # Apply without removing
git stash drop          # Delete latest stash
```

## History & Diff

```bash
git log --oneline -20         # Short log, last 20
git log --graph --oneline     # Graph view
git diff                      # Unstaged changes
git diff --staged             # Staged changes
git diff <commit> <commit>    # Diff two commits
git show <commit>             # Show commit details
```

## Undoing

| Command | What it does |
|---------|-------------|
| `git restore <file>` | Discard unstaged changes |
| `git restore --staged <file>` | Unstage file |
| `git reset --soft HEAD~1` | Undo last commit, keep changes staged |
| `git reset --mixed HEAD~1` | Undo last commit, keep changes unstaged |
| `git reset --hard HEAD~1` | ⚠️ Obliterate last commit & changes |
| `git revert <commit>` | Create new commit undoing <commit> |

## Remotes

```bash
git remote -v                       # List remotes
git remote add origin <url>         # Add remote
git remote set-url origin <url>     # Change remote URL
git push -u origin main             # Push + set upstream
git push --force-with-lease         # Safer force push
```

## Tagging

```bash
git tag v1.0.0                      # Create lightweight tag
git tag -a v1.0.0 -m "Release 1.0" # Annotated tag
git push origin v1.0.0              # Push tag to remote
git push origin --tags              # Push all tags
```

## Aliases

```bash
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

## Rebase

```bash
git rebase main               # Rebase current branch onto main
git rebase -i HEAD~3          # Interactive rebase last 3 commits
git rebase --abort            # Cancel rebase
```

## Quick Snippets

```bash
# Stage + commit in one
git commit -am "message"

# Amend last commit (no edit)
git commit --amend --no-edit

# See what's in a stash
git stash show -p stash@{0}

# Cherry-pick a commit
git cherry-pick <commit-hash>

# Get a file from another branch
git checkout other-branch -- path/to/file
```

Essential daily reference for terminal-based version control.
