---
id: "019e1b12-d1a4-7ea4-ff05-ae7f7a8b9c44"
title: "Cloud & Infrastructure"
type: concept
created: "2026-05-10T15:45:00-0400"
updated: "2026-06-21"
tags: [cloud, infrastructure, devops, vps, networking, hosting, developer-networking, cloudflare, ai-agents, postgres, benchmarking, ipv6, linux]
source_count: 8
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
- [2026-06-20: Evening Brief — Saturday, June 20, 2026](../sources/newsletter-2026-06-20-evening.md) — Cloudflare temporary accounts for AI agents and PostgresBench's reproducible benchmarking both belong to platform operations: identity, access, performance baselines, and service comparison.
- [2026-06-21: Daytime Dispatch — Sunday, June 21, 2026](../sources/newsletter-2026-06-21-daytime.md) — Google reaching **50% IPv6** and Linux epoll/io_uring discussion are infrastructure signals: protocol adoption and kernel I/O primitives shape how services scale.

## Related Concepts

- [[Container Orchestration]]
- [[Security & Privacy Toolkit]]
- [[Terminal-Centric Workflow]]

## Notes

This infrastructure runs on a DigitalOcean VPS (Ubuntu 24.04 LTS, 2 vCPU / 4 GB / 80 GB SSD) with SSH + Tailscale as the only access vectors — zero public exposure. doctl manages the cloud layer; nginx handles ingress; Nextcloud provides external sync; Datadog (alongside Prometheus/LGTM) provides observability. The stack reflects the Cloud Architect and Infra Engineer personas from AGENTS.md.

The June 16 Iroh 1.0 note is not part of the current homelab stack, but it belongs in the concept graph because application networking is infrastructure: peer discovery, secure transport, NAT traversal, and developer ergonomics determine how distributed tools can be built and operated.

The June 20 evening dispatch adds two platform-operation primitives. Temporary agent accounts are identity infrastructure for automation, while PostgresBench-style reproducible tests are measurement infrastructure for database selection and capacity planning.

The June 21 daytime dispatch adds quieter plumbing. IPv6 adoption is not flashy, but crossing the 50% mark at Google scale indicates real network transition. Linux I/O APIs matter for the same reason: kernel primitives become application architecture constraints once workloads hit scale.
