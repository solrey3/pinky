---
id: uv-cheatsheet
title: uv Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli, python, env]
---

# uv Cheatsheet

**Category:** Python Environment Manager  
**Official Docs:** https://docs.astral.sh/uv/

## Install

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

## Basic Python Version Management

```bash
# Install Python version
uv python install 3.12

# List installed
uv python list

# Set default for project
uv python pin 3.12
```

## Create Project

```bash
# New project from scratch
uv init myproject
cd myproject

# New project with lib layout
uv init --lib mylib
```

## Virtual Environments

```bash
# Create venv (auto-selects Python)
uv venv
source .venv/bin/activate

# Create with specific version
uv venv --python 3.11

# Auto-activate when in project dir
# (requires .python-version or pyproject.toml)
```

## Dependency Management

```bash
# Add dependency
uv add requests
uv add --dev pytest

# Remove dependency
uv remove requests

# Sync dependencies
uv sync

# Install dependencies (legacy style)
uv pip install -r requirements.txt

# Lock dependencies
uv pip compile pyproject.toml -o requirements.txt
```

## Run Scripts

```bash
# Run with auto-resolved env
uv run python script.py

# Run module
uv run python -m http.server

# Run tools without installing
uv run --with ruff ruff check .
uv run --with mypy mypy src/

# Run arbitrary command in project env
uv run pytest
uv run flask --app app run
```

## Build & Publish

```bash
# Build package
uv build

# Publish to PyPI
uv publish
```

## Upgrade & Maintenance

```bash
# Self-update
uv self update

# Lock file regenerate
uv lock

# Check outdated
uv tree --outdated
```

## Quick Snippets

```bash
# One-liner script with deps
uv run --with requests -- python -c "import requests; print(requests.get('https://api.github.com').status_code)"

# Jupyter lab without installing
uv run --with jupyter jupyter lab

# Django management
uv run python manage.py migrate

# FastAPI server
uv run --with fastapi fastapi dev main.py
```

## Comparison: uv vs legacy

| Legacy | uv |
|--------|-----|
| `python -m venv .venv` | `uv venv` |
| `pip install -r requirements.txt` | `uv sync` or `uv pip install -r ...` |
| `pip install requests` | `uv add requests` |
| `python script.py` | `uv run python script.py` |
| `pip-compile` | `uv pip compile` |
| `python -m build` | `uv build` |
| `twine upload` | `uv publish` |

Dropped-in replacement for pip + virtualenv + pip-tools, written in Rust, blazing fast.
