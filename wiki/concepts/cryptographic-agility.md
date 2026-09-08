---
id: 0580bdd3-037d-42ae-8d6c-c48410ecd046
title: Cryptographic Agility
type: concept
created: 2026-09-08
updated: 2026-09-08
tags: [cryptography, security, key-management, certificates, rsa, migration, technical-debt]
source_count: 2
---

# Cryptographic Agility

Cryptographic agility is the ability to inventory, replace, and retire algorithms, keys, certificates, and trust anchors as attack methods, computing power, standards, or operational requirements change. It treats cryptography as a managed lifecycle rather than a permanent property of deployed systems.

## Sources

- [2026-09-08: Morning Dispatch — Tuesday, September 8, 2026](../sources/newsletter-2026-09-08-daytime.md) — Factored 1990s certificate-authority RSA keys reinforce that legacy key strength decays and obsolete trust material must be retired.

- [2026-09-08: Midnight Dispatch — Tuesday, September 8, 2026](../sources/newsletter-2026-09-08-midnight.md) — A report that 1990s certificate-authority RSA keys were factored demonstrates how legacy key strength can decay and why obsolete trust material must be retired.

## Related Concepts

- [[Security & Privacy Toolkit]]
- [[Software Supply Chain Security]]
- [[Passwordless Authentication Security]]
- [[Quantum Computing Policy]]

## Notes

Migration planning should cover discovery, dependency mapping, dual-operation where necessary, revocation, trust-store cleanup, and evidence that retired keys can no longer authenticate active systems. A historical key compromise is not automatically a current incident; impact depends on whether any live verifier still trusts the affected material.
