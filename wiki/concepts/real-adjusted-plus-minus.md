---
id: "5cb73549-e204-4b8d-aa1d-11c951c2ce39"
title: "Real Adjusted Plus Minus"
type: concept
created: "2026-05-14T23:10:00-0400"
updated: "2026-05-14T23:10:00-0400"
tags: [basketball, nba, analytics, statistics, regression]
source_count: 1
---

# Real Adjusted Plus Minus

RAPM is a player valuation metric that measures points contributed per 100 possessions based on a team's performance when the player is on vs. off the floor, adjusting for the quality of teammates and opponents. It is theoretically comprehensive and unbiased, capturing both tangible and intangible contributions.

However, RAPM is very noisy, takes several seasons to stabilize, and is computationally intensive. For this reason, [[RAPTOR]] and [[Box Plus/Minus|BPM]] were designed: they use faster-stabilizing box score and tracking statistics to *approximate* long-term RAPM via regression.

## Sources

- [2026-05-14: How Our RAPTOR Metric Works](sources/fivethirtyeight-raptor-metric.md) — RAPM explained as the ground truth RAPTOR's regression is fitted against

## Related Concepts

- [[RAPTOR]]
- [[Box Plus/Minus]]
- [[Plus-Minus Statistics]]
