---
id: 6e82360a-fc59-4f2e-817e-3e3721216c69
title: Agentic Access Control
type: concept
created: 2026-06-20
updated: 2026-06-20
tags: [ai, agents, identity, access-control, security, cloud, automation, least-privilege]
source_count: 1
---

# Agentic Access Control

Agentic access control is the practice of treating AI agents as explicit security principals: scoped identities with temporary credentials, least-privilege permissions, auditable actions, expiration, and revocation. The core shift is from “an agent uses my account” to “an agent receives a bounded identity for a bounded job.”

## Sources

- [2026-06-20: Evening Brief — Saturday, June 20, 2026](../sources/newsletter-2026-06-20-evening.md) — Cloudflare's temporary accounts for AI agents make scoped, revocable, time-limited agent identity a concrete cloud-platform pattern.

## Related Concepts

- [[Security & Privacy Toolkit]]
- [[Cloud & Infrastructure]]
- [[AI-Augmented Development]]

## Notes

The practical control is separation: human accounts, service accounts, and agent accounts should not collapse into one credential pool. Agents need narrowly scoped rights, short lifetimes, observable action logs, and a kill switch. That turns automation from a blind delegation problem into an identity-governance problem.
