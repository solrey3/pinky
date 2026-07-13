---
id: "019e1b12-d1a4-7ea4-ff05-ae7f7a8b9c44"
title: "Cloud & Infrastructure"
type: concept
created: "2026-05-10T15:45:00-0400"
updated: 2026-07-13
tags: [cloud, infrastructure, devops, vps, networking, hosting, developer-networking, cloudflare, ai-agents, postgres, benchmarking, ipv6, linux, data-centers, power, water, http, ai-infrastructure, semiconductors, oracle, hardware, custom-silicon, runtimes, liquid-cooling, water-efficiency, satellite-networking, inference]
source_count: 25
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

- [2026-06-23: Daytime Dispatch — Tuesday, June 23, 2026](../sources/newsletter-2026-06-23-daytime.md) — Texas requiring data centers to bring their own power and reuse water, plus HTTP QUERY protocol coverage, ties cloud infrastructure to physical resources and web/API semantics.

- [2026-06-23: Evening Brief — Tuesday, June 23, 2026](../sources/newsletter-2026-06-23-evening.md) — Oracle's debt-funded AI investment/layoff framing and Samsung's stacked-FET item show AI infrastructure as capital structure, labor allocation, and semiconductor physics.

- [2026-06-24: Daytime Dispatch — Wednesday, June 24, 2026](../sources/newsletter-2026-06-24-daytime.md) — Oracle's AI-investment layoffs repeat, while a Raspberry Pi Pico W USB Wi-Fi adapter project keeps small hardware/networking in the operator-infrastructure frame.

- [2026-06-24: Evening Brief — Wednesday, June 24, 2026](../sources/newsletter-2026-06-24-evening.md) — OpenAI/Broadcom custom silicon and Qualcomm's Modular acquisition show AI infrastructure spanning chips, compilers, runtimes, and platform economics.

- [2026-06-25: Daytime Dispatch — Thursday, June 25, 2026](../sources/newsletter-2026-06-25-daytime.md) — Nvidia's 45°C cooling design and OpenAI/Broadcom inference silicon tie AI infrastructure to thermals, water use, power density, and custom hardware supply.

- [2026-06-26: Daytime Dispatch — Friday, June 26, 2026](../sources/newsletter-2026-06-26-daytime.md) — IBM process-scaling claims and Framework's 10G Ethernet/USB-C complexity show that AI-era infrastructure depends on chips, ports, modules, and operational reliability.
- [2026-06-26: Evening Brief — Friday, June 26, 2026](../sources/newsletter-2026-06-26-evening.md) — AWS Lambda MicroVMs and SpaceX Starlink mobile service extend the infrastructure graph into sandbox lifecycle control and satellite-to-phone network reach.
- [2026-06-27: Daytime Dispatch — Saturday, June 27, 2026](../sources/newsletter-2026-06-27-daytime.md) — Starlink mobile repeats as satellite-to-phone infrastructure, while DeepSeek's inference optimizations make serving efficiency part of the AI infrastructure stack.

- [2026-06-29: Evening Brief — Monday, June 29, 2026](../sources/newsletter-2026-06-29-evening.md) — Rocket Lab's planned Iridium acquisition adds satellite communications and space-sector consolidation to the infrastructure watchlist.

- [2026-06-30: Daytime Dispatch — Tuesday, June 30, 2026](../sources/newsletter-2026-06-30-daytime.md) — Rocket Lab/Iridium extends infrastructure tracking into satellite connectivity and vertically integrated space-network assets.

- [2026-07-01: Evening Brief — Wednesday, July 1, 2026](../sources/newsletter-2026-07-01-evening.md) — DOE heat-wave grid orders and Cloudflare x402 both treat infrastructure as an active control surface: one for reliability under stress, the other for edge monetization.

- [2026-07-02: Daytime Dispatch — Thursday, July 2, 2026](../sources/newsletter-2026-07-02-daytime.md) — T-Mobile's reported VMware migration turns Broadcom/VMware fallout into enterprise infrastructure planning: licensing risk, migration cost, and virtualization platform dependence.

- [2026-07-02: Evening Brief — Thursday, July 2, 2026](../sources/newsletter-2026-07-02-evening.md) — Google AI electricity demand, Podman v6.0.0, and Palantir procurement concerns all widen infrastructure from servers and runtimes into energy and trust policy.

- [2026-07-11: Evening Brief — Saturday, July 11, 2026](../sources/newsletter-2026-07-11-evening.md) — PgBouncer throughput scaling highlights backend connection management as practical infrastructure work, not just database trivia.
- [2026-07-12: Daytime Dispatch — Sunday, July 12, 2026](../sources/newsletter-2026-07-12-daytime.md) — Distributed AI on Iroh, reusable-rocket recovery, and extraction reliability all keep infrastructure framed as repeatable operation under constraints.

- [2026-07-12: Evening Brief — Sunday, July 12, 2026](../sources/newsletter-2026-07-12-evening.md) — Agent context overhead, quantum recalibration, prediction-market extraction, and reusable rockets all connect reliability to infrastructure operations.

- [2026-07-13: Daytime Dispatch — Monday, July 13, 2026](../sources/newsletter-2026-07-13-daytime.md) — GhostLock, Hue firmware recovery, quantum recalibration, rocket reuse, and prediction-market extraction all show infrastructure value depends on operability under failure.

## Related Concepts

- [[Container Orchestration]]
- [[Security & Privacy Toolkit]]
- [[Terminal-Centric Workflow]]

## Notes

This infrastructure runs on a DigitalOcean VPS (Ubuntu 24.04 LTS, 2 vCPU / 4 GB / 80 GB SSD) with SSH + Tailscale as the only access vectors — zero public exposure. doctl manages the cloud layer; nginx handles ingress; Nextcloud provides external sync; Datadog (alongside Prometheus/LGTM) provides observability. The stack reflects the Cloud Architect and Infra Engineer personas from AGENTS.md.

The June 16 Iroh 1.0 note is not part of the current homelab stack, but it belongs in the concept graph because application networking is infrastructure: peer discovery, secure transport, NAT traversal, and developer ergonomics determine how distributed tools can be built and operated.

The June 20 evening dispatch adds two platform-operation primitives. Temporary agent accounts are identity infrastructure for automation, while PostgresBench-style reproducible tests are measurement infrastructure for database selection and capacity planning.

The June 21 daytime dispatch adds quieter plumbing. IPv6 adoption is not flashy, but crossing the 50% mark at Google scale indicates real network transition. Linux I/O APIs matter for the same reason: kernel primitives become application architecture constraints once workloads hit scale.

The June 23 daytime dispatch makes the physical layer impossible to ignore. Data centers are not abstract cloud boxes; they are power, water, siting, regulation, and local politics. HTTP QUERY supplies the opposite end of the stack: tiny protocol semantics that still shape service behavior once traffic hits production.

The evening dispatch adds the financing and silicon layers. Oracle's AI investment story connects infrastructure growth to debt and workforce cuts, while Samsung's 3D stacked-FET item shows that cloud capacity ultimately rests on transistor architecture as much as data-center siting.

The June 24 source keeps infrastructure grounded at both ends of the stack: Oracle shows cloud/AI expansion as capital allocation and layoffs, while a Pico W Wi-Fi-adapter project shows useful infrastructure can also be tiny, cheap, and hardware-hacker shaped.

The evening source adds vertical integration to the infrastructure frame. AI capacity is shaped not only by data centers but also by custom accelerators, foundry partnerships, compilers, runtimes, app-store economics, and the business deals that bind those layers together.

The June 25 source keeps infrastructure physical. AI capacity is limited not only by chips and money but also by facility engineering: water loops, liquid cooling, operating temperatures, heat reuse, and permitting around power/water constraints.

The June 26 daytime dispatch adds a hardware-interface reminder to the infrastructure graph. Cloud and AI systems ride on physical constraints: silicon process, interconnects, USB-C behavior, cooling, power, and reliable data extraction.

The June 27 daytime source adds two infrastructure levers at different layers: Starlink mobile expands network reach, while inference optimization reduces serving cost/latency pressure. Both change what can be deployed and where.
