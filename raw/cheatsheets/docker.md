---
id: docker-cheatsheet
title: Docker Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli, containers]
---

# Docker (Native CLI) Cheatsheet

**Category:** Containers  
**Official Docs:** https://docs.docker.com/engine/reference/commandline/docker/

## Install

```bash
# macOS (Desktop)
brew install docker

# Debian/Ubuntu (Docker Engine)
curl -fsSL https://get.docker.com | sudo sh
```

## Images

```bash
# List images
docker images

# Pull image
docker pull ubuntu:latest

# Remove image
docker rmi ubuntu:latest

# Build from Dockerfile
docker build -t myapp:1.0 .

# Inspect image
docker inspect ubuntu:latest
```

## Containers

```bash
# Run container (foreground)
docker run ubuntu:latest

# Run detached + name
docker run -d --name web nginx

# Run with port mapping
docker run -p 8080:80 nginx

# Shell access
docker run -it ubuntu bash

# List running containers
docker ps

# List all containers
docker ps -a

# Stop / start / restart
docker stop web
docker start web
docker restart web

# Kill / remove
docker kill web
docker rm web

# Execute command in running container
docker exec -it web bash

# Logs
docker logs web
```

## Useful Flags

| Flag | Description |
|------|-------------|
| `-d` | Detached |
| `-it` | Interactive tty |
| `-p HOST:CONTAINER` | Port map |
| `--name NAME` | Container name |
| `-v /host:/container` | Volume mount |
| `--rm` | Remove on exit |
| `-e KEY=VAL` | Environment variable |

## Quick Commands

```bash
# List volumes
docker volume ls

# List networks
docker network ls

# System usage
docker system df

# Prune unused
docker system prune

# Follow logs
docker logs -f web
```

This is optimized for fast daily lookup in the terminal.Courtesy: instant utility for the terminal-centric workflow.