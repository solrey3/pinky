---
id: gh-cheatsheet
title: gh Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,git,github,dev]
---

# gh Cheatsheet

**Category:** GitHub CLI  
**Official Docs:** https://cli.github.com/manual/

## Install
```bash
# macOS
brew install gh

# Debian/Ubuntu
sudo apt install gh

# Fedora
sudo dnf install gh
```

## Auth
```bash
gh auth login              # Interactive login
git auth status            # Check auth
git auth logout            # Log out
```

## Repo Operations

| Command | Description |
|---------|-------------|
| `gh repo list` | List your repos |
| `gh repo view owner/repo` | View repo details |
| `gh repo clone owner/repo` | Clone a repo |
| `gh repo create myrepo` | Create new repo |
| `gh repo fork owner/repo` | Fork a repo |
| `gh repo delete owner/repo` | Delete a repo |
| `gh repo sync` | Sync fork with upstream |

## Issues

```bash
gh issue list                        # List open issues
gh issue list --state all            # All issues
gh issue view 123                    # View issue #123
gh issue create --title "Bug" --body "Desc"  # Create issue
gh issue close 123                   # Close issue
gh issue reopen 123                  # Reopen issue
gh issue comment 123 --body "LGTM"   # Comment
```

## Pull Requests

```bash
gh pr list                           # List open PRs
gh pr view 42                        # View PR #42
gh pr checkout 42                    # Checkout PR branch locally
gh pr create --base main             # Create PR from current branch
gh pr merge 42                       # Merge PR
gh pr merge 42 --squash              # Squash merge
gh pr merge 42 --auto                # Auto-merge when checks pass
gh pr checks 42                      # View/check CI status
gh pr review 42 --approve            # Approve PR
gh pr review 42 --request-changes --body "Fix tests"
gh pr close 42                       # Close PR
```

## Workflows (Actions)

```bash
gh run list                          # List recent workflow runs
gh run view 1234567890               # View specific run
gh run watch 1234567890              # Watch run in real time
gh run rerun 1234567890              # Rerun failed jobs
gh run cancel 1234567890             # Cancel run
```

## Gists, Releases, Codespaces

```bash
# Gists
gh gist list                         # List your gists
gh gist create file.txt              # Create gist
gh gist view ID                      # View gist

# Releases
gh release list                      # List releases
gh release create v1.0.0 --notes "Release notes"
gh release upload v1.0.0 file.tar.gz

# Codespaces
gh codespace list                    # List codespaces
gh codespace create --repo owner/repo
gh codespace ssh -c ID               # SSH into codespace
```

## Aliases & Config

```bash
gh alias set co "pr checkout"        # Create alias
git alias list                       # List aliases
git alias delete co                  # Delete alias

gh config set editor nvim
gh config set git_protocol ssh
```

## One-Liners

```bash
# Quick PR from current branch
git push && gh pr create --fill-first

# Review and merge in one flow
gh pr checkout 42 && gh pr view && gh pr merge 42 --squash

# Check status of current PR
gh pr checks

# Browse repo in web
git repo view --web
```

Essential for GitHub-centric development without leaving the terminal.
