---
id: "019e1b12-d1a1-7ea1-ff02-ab7f7a8b9c41"
title: "Container Orchestration"
type: concept
created: "2026-05-10T15:45:00-0400"
updated: "2026-05-10T15:45:00-0400"
tags: [containers, kubernetes, docker, devops, infrastructure]
source_count: 4
---

# Container Orchestration

The automated deployment, scaling, and management of containerized applications. Kubernetes (k8s) is the dominant orchestration platform, managing container lifecycles, networking, storage, and service discovery across clusters of machines.

## Sources

- [2026-05-10: kubectl Cheatsheet](sources/kubectl.md) — Kubernetes CLI for deploying and managing containerized applications
- [2026-05-10: k9s Cheatsheet](sources/k9s.md) — Terminal UI for navigating and managing Kubernetes clusters
- [2026-05-10: lazydocker Cheatsheet](sources/lazydocker.md) — Terminal UI for Docker container management
- [2026-05-10: nginx Cheatsheet](sources/nginx.md) — Reverse proxy and load balancer commonly deployed as a container

## Related Concepts

- [[Terminal-Centric Workflow]]
- [[Cloud & Infrastructure]]
- [[DevOps]]

## Notes

Container orchestration is the deployment layer of the infrastructure stack. kubectl provides the command-line control plane; k9s makes it navigable; lazydocker handles the underlying container runtime; nginx terminates traffic at the edge. This stack enables the reproducible, declarative infrastructure that makes remote VPS management (like this DigitalOcean instance) feasible without a dedicated ops team.
