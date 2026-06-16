---
id: "019e1b12-d1a4-7ea4-ff05-ae7f7a8b9c44"
title: "Cloud & Infrastructure"
type: concept
created: "2026-05-10T15:45:00-0400"
updated: "2026-06-16"
tags: [cloud, infrastructure, devops, vps, networking, hosting, developer-networking]
source_count: 6
---

# Cloud & Infrastructure

The foundational compute, networking, and platform layer running on DigitalOcean VPS. This includes the cloud provider CLI, reverse proxy, self-hosted services, and monitoring infrastructure that keeps the command center operational.

## Sources

- [2026-05-10: doctl Cheatsheet](sources/doctl.md) — DigitalOcean CLI for managing droplets, databases, and cloud resources
- [2026-05-10: nginx Cheatsheet](sources/nginx.md) — Reverse proxy, load balancer, and web server
- [2026-05-10: Nextcloud Cheatsheet](sources/nextcloud.md) — Self-hosted file sync, collaboration, and PIM platform
- [2026-05-10: Tailscale Cheatsheet](sources/tailscale.md) — Mesh networking overlay for secure inter-device communication
- [2026-05-10: Datadog CLI Cheatsheet](sources/datadog-cli.md) — Monitoring, logging, and observability platform
- [2026-06-16: Newsletter 2026-06-16 — Morning Dispatch](../sources/newsletter-2026-06-16.md) — Iroh 1.0 appears as a developer networking-stack release, adding peer/network plumbing to the infrastructure watchlist.

## Related Concepts

- [[Container Orchestration]]
- [[Security & Privacy Toolkit]]
- [[Terminal-Centric Workflow]]

## Notes

This infrastructure runs on a DigitalOcean VPS (Ubuntu 24.04 LTS, 2 vCPU / 4 GB / 80 GB SSD) with SSH + Tailscale as the only access vectors — zero public exposure. doctl manages the cloud layer; nginx handles ingress; Nextcloud provides external sync; Datadog (alongside Prometheus/LGTM) provides observability. The stack reflects the Cloud Architect and Infra Engineer personas from AGENTS.md.

The June 16 Iroh 1.0 note is not part of the current homelab stack, but it belongs in the concept graph because application networking is infrastructure: peer discovery, secure transport, NAT traversal, and developer ergonomics determine how distributed tools can be built and operated.
