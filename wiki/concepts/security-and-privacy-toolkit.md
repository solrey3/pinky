---
id: "019e1b12-d1a2-7ea2-ff03-ac7f7a8b9c42"
title: "Security & Privacy Toolkit"
type: concept
created: "2026-05-10T15:45:00-0400"
updated: "2026-05-10T15:45:00-0400"
tags: [security, privacy, vpn, encryption, pentesting, osint]
source_count: 5
---

# Security & Privacy Toolkit

The layered defense system protecting this infrastructure: password management, zero-trust networking, secure operating systems, and penetration testing tools. The philosophy is defense in depth — no single tool provides complete security, but the combination creates a resilient perimeter.

## Sources

- [2026-05-10: 1Password CLI Cheatsheet](sources/1password-cli.md) — Password and secret management via command line
- [2026-05-10: Tailscale Cheatsheet](sources/tailscale.md) — Zero-config mesh VPN based on WireGuard
- [2026-05-10: Kali Linux Cheatsheet](sources/kali-linux.md) — Penetration testing and security auditing distribution
- [2026-05-10: Tails OS Cheatsheet](sources/tails-os.md) — Amnesic incognito live system for privacy
- [2026-05-10: Nextcloud Cheatsheet](sources/nextcloud.md) — Self-hosted collaboration platform with end-to-end encryption options

## Related Concepts

- [[Terminal-Centric Workflow]]
- [[Cloud & Infrastructure]]
- [[OSINT]]

## Notes

The security stack reflects a "trust nothing, verify everything" posture. Tailscale replaces open ports with authenticated mesh networking. 1Password CLI enables secret injection without storing credentials in configs. Kali and Tails are the offensive and defensive extremes of the same discipline. This toolkit operationalizes the SecOps persona from the AGENTS.md configuration.
