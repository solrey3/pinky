---
id: 84c4ddb8-9c67-4761-9b08-cd58f7c84819
title: Software Supply Chain Security
type: concept
created: 2026-08-04
updated: 2026-09-05
tags: [cybersecurity, software-supply-chain, npm, packages, provenance, developer-tools, ci-cd, credentials]
source_count: 5
---

# Software Supply Chain Security

Software supply chain security is the practice of protecting the packages, maintainers, registries, build steps, and dependency graphs that software systems rely on before code reaches production.

## Sources

- [2026-09-05: Morning Dispatch — Saturday, September 5, 2026](../sources/newsletter-2026-09-05-daytime.md) — An actively exploited Chromium sandbox RCE underscores the need to patch shared browser-runtime dependencies quickly and verify isolation boundaries.

- [2026-08-23: Noon Dispatch — Sunday, August 23, 2026](../sources/newsletter-2026-08-23-noon.md) — Malware embedded in Android automotive head-unit firmware shows how compromised upstream images can persist into safety-adjacent devices.

- [2026-08-20: Noon Dispatch — Thursday, August 20, 2026](../sources/newsletter-2026-08-20-noon.md) — A malicious Rust crate reportedly executes a build-time payload, underscoring that dependency builds are privileged code-execution boundaries.

- [2026-08-17: Noon Dispatch — Monday, August 17, 2026](../sources/newsletter-2026-08-17-noon.md) — An AI-generated Copilot “Autofix” reportedly enabling compromise of Snowflake’s Jira shows that automated remediation inside CI/CD is a privileged supply-chain boundary.

- [2026-08-13: Morning Dispatch — Thursday, August 13, 2026](../sources/newsletter-2026-08-13-daytime.md) — A reported breach exposing credentials across 2,500 companies and 434,000 CI/CD pipelines frames build systems as high-leverage trust boundaries.

## Related Concepts

- [[Developer Tool Trust]]
- [[Security & Privacy Toolkit]]
- [[npm]]
- [[Keyv]]
- [[Shai-Hulud]]

## Notes

This concept was created from an active npm compromise item; future sources should distinguish package takeover, malicious updates, dependency confusion, maintainer credential theft, and registry-level incident response.
