---
id: just-cheatsheet
title: just Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,task-runner,build]
---

# just Cheatsheet

**Category:** Command Runner (Makefile Alternative)  
**Official Docs:** https://just.systems/man/en/

## Install
```bash
# macOS
brew install just

# Debian/Ubuntu (cargo)
cargo install just

# As single binary
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash
```

## Justfile Basics

Create `justfile` (or `.justfile`, `Justfile`) in project root:

```just
# Default recipe (runs when you type `just`)
default:
    just --list

# Run dev server
dev:
    uv run python manage.py runserver

# Run tests
test:
    pytest -xvs

# Lint + format
check:
    ruff check .
    ruff format --check .

# Build prod
build:
    docker build -t myapp:latest .

# Deploy
deploy: build
    docker push myapp:latest
    kubectl rollout restart deployment/myapp
```

## Running Recipes

| Command | What it does |
|---------|-------------|
| `just` | Run default recipe |
| `just dev` | Run `dev` recipe |
| `just build` | Run `build` recipe |
| `just deploy` | Run `deploy` (which depends on `build`) |
| `just --list` | List all recipes |
| `just --show recipe` | Show recipe body |
| `just -n recipe` | Dry run (print commands, don't execute) |

## Variables

```just
port := "8000"
env := "development"

run:
    uv run python manage.py runserver {{port}}

# Override from CLI
# just run port=9000
```

## Parameters

```just
 greet name:
     echo "Hello, {{name}}!"

# just greet Sancho  → Hello, Sancho!
```

## Conditionals & Logic

```just
os := `uname`

build:
    #!/usr/bin/env bash
    if [ "{{os}}" = "Linux" ]; then
        echo "Building for Linux"
    else
        echo "Building for {{os}}"
    fi
```

## Aliases & Dependencies

```just
# Alias
alias t := test

# Dependencies (run before)
test: setup
    pytest

setup:
    pip install -e .
```

## Recipe Attributes

```just
[no-cd]
global:
    echo "Runs in justfile dir regardless of cwd"

[private]
helper:
    echo "Hidden from --list"

[confirm("Are you sure? Deploy to production?")]
deploy-prod:
    kubectl apply -f k8s/prod/
```

## Dotenv Integration

```just
set dotenv-load

run:
    echo "Database: $DATABASE_URL"
```

## Export Variables

```just
export RUST_BACKTRACE := "1"

debug:
    cargo run
```

## Comparison: just vs Makefile

| Feature | just | Makefile |
|---------|------|----------|
| Syntax | Modern, readable | Tab-sensitive, archaic |
| Variables | `:=` assignment | `=` / `:=` |
| Parameters | Built-in | Hacky ( $@ ) |
| `.PHONY` | Not needed | Required |
| Cross-platform | ✅ Bash/fish/pwsh | ❌ Shell-dependent |
| Shebang recipes | ✅ | ❌ |
| Error handling | Stops on first error | Continues |
| Listed by default | ✅ `--list` | ❌ |

> `just` is a saver for Python/Node/Rust projects where Make feels like overkill. No `.PHONY` boilerplate, no tab gotchas.
