---
id: 27341565-b4be-4a6f-a5dd-21c89dbf2590
title: Native Mobile Development
type: concept
created: 2026-09-11
updated: 2026-09-11
tags: [software-engineering, mobile, ios, android, swift, kotlin, react-native, architecture]
source_count: 2
---

# Native Mobile Development

Native mobile development builds applications with the primary languages, frameworks, and tooling of each target platform—for example, Swift on iOS and Kotlin on Android—rather than sharing most application code through a cross-platform runtime. It generally trades duplicated implementation effort for closer platform integration, more direct performance control, and fewer abstraction-layer constraints.

## Sources

- [2026-09-11: Morning Dispatch — Friday, September 11, 2026](../sources/newsletter-2026-09-11-daytime.md) — Shopify's native rewrite reinforces that shared-code savings must be weighed against platform fidelity, maintenance, and operating-system access.

- [2026-09-11: Midnight Dispatch — Friday, September 11, 2026](../sources/newsletter-2026-09-11-midnight.md) — Shopify's reported migration from React Native back to Swift and Kotlin shows a large product team deciding that native control outweighs shared-code benefits.

## Related Concepts

- [[AI-Augmented Development]]
- [[Refactoring Economics]]

## Notes

Shopify's migration should not be generalized into a universal verdict against cross-platform frameworks. It is evidence that architecture economics change with application scale, platform-specific requirements, team structure, debugging costs, and the maturity of both native and shared-code toolchains.
