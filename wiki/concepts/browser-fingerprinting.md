---
id: 42beb07f-8f2d-428b-a67d-1507fdda071e
title: Browser Fingerprinting
type: concept
created: 2026-08-20
updated: 2026-10-12
tags: [privacy, browsers, tracking, webaudio, surveillance]
source_count: 4
---

# Browser Fingerprinting

Browser fingerprinting identifies or correlates a browser by combining observable device, software, rendering, audio, and behavior characteristics, often without storing a conventional tracking cookie.

## Sources

- [2026-10-12: Morning Dispatch — Monday, October 12, 2026](../sources/newsletters/newsletter-2026-10-12-daytime.md) — Repeats that browser and device characteristics can preserve cross-site correlation after conventional cookies are restricted.

- [2026-10-12: Midnight Dispatch — Monday, October 12, 2026](../sources/newsletters/newsletter-2026-10-12-midnight.md) — Frames fingerprinting as the tracking layer that survives cookie restrictions by correlating browser and device characteristics without conventional stored identifiers.

- [2026-08-24: Evening Brief — Monday, August 24, 2026](../sources/newsletters/newsletter-2026-08-24-evening.md) — Reported inaudible audio signaling on AliExpress shows WebAudio can become a covert correlation channel with operational side effects.

- [2026-08-20: Noon Dispatch — Thursday, August 20, 2026](../sources/newsletters/newsletter-2026-08-20-noon.md) — A report of silent WebAudio fingerprinting on AliExpress also breaking Bluetooth multipoint shows that covert tracking can create operational side effects beyond privacy loss.

## Related Concepts

- [[Automated License-Plate Reader Surveillance]]
- [[Security & Privacy Toolkit]]

## Notes

Fingerprinting controls must consider both identification risk and abuse of browser APIs. Blocking cookies alone does not prevent correlation through audio, graphics, fonts, timing, or device characteristics.
