---
id: "019e1b12-d1a5-7ea5-ff06-af7f7a8b9c45"
title: "DevOps & Observability"
type: concept
created: "2026-05-10T15:45:00-0400"
updated: "2026-05-10T15:45:00-0400"
tags: [devops, monitoring, observability, git, ci-cd, automation]
source_count: 4
---

# DevOps & Observability

The practices and tools for continuous integration, deployment automation, system monitoring, and operational visibility. DevOps bridges development and operations; observability provides the telemetry (metrics, logs, traces) needed to understand system behavior in production.

## Sources

- [2026-05-10: lazygit Cheatsheet](sources/lazygit.md) — Terminal UI for git, the version control backbone of DevOps
- [2026-05-10: lazydocker Cheatsheet](sources/lazydocker.md) — Container management and local dev environment orchestration
- [2026-05-10: Datadog CLI Cheatsheet](sources/datadog-cli.md) — Application performance monitoring and infrastructure observability
- [2026-05-10: kubectl Cheatsheet](sources/kubectl.md) — Production deployment and cluster management

## Related Concepts

- [[Container Orchestration]]
- [[Cloud & Infrastructure]]
- [[Terminal-Centric Workflow]]

## Notes

DevOps on this stack is lightweight but comprehensive. Git (via lazygit) tracks all configuration. Docker (via lazydocker) packages services. kubectl deploys to k8s when needed. Datadog (alongside Prometheus/LGTM/Sentry) watches everything. The absence of a heavy CI/CD pipeline reflects the "simplicity first" coding principle from AGENTS.md — minimum infrastructure that solves the problem, nothing speculative.
