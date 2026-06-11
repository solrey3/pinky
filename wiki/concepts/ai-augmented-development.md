---
id: "019e1b12-d1a3-7ea3-ff04-ad7f7a8b9c43"
title: "AI-Augmented Development"
type: concept
created: "2026-05-10T15:45:00-0400"
updated: "2026-06-11"
tags: [ai, llm, coding-agent, automation, development, fabric, computer-vision, local-ai, developer-infrastructure, agentic-software]
source_count: 9
---

# AI-Augmented Development

The practice of integrating large language models and AI coding agents into the software development workflow. This includes content processing (Fabric), terminal-based coding agents (Pi), and broader patterns of LLM-assisted knowledge work. The approach treats AI as an augmentative tool — enhancing human judgment rather than replacing it.

## Sources

- [2026-05-10: Fabric Cheatsheet](sources/fabric.md) — Open-source framework for running LLM prompt patterns against any model via CLI
- [2026-05-10: Pi Cheatsheet](sources/pi.md) — Terminal-based coding agent harness using OpenRouter for LLM access
- [2026-05-10: Datadog CLI Cheatsheet](sources/datadog-cli.md) — Monitoring and observability (relevant for AI-ops and infrastructure telemetry)
- [2026-06-08: Evening Brief — Monday, June 8, 2026](../sources/newsletter-2026-06-08-evening.md) — A Microsoft package/repository credential-stealer incident explicitly targeted AI coding-agent workflows, turning agent tooling into a supply-chain attack surface.
- [2026-06-09: Newsletter 2026-06-09 — Morning Dispatch](../sources/newsletter-2026-06-09.md) — The same incident is framed as Microsoft open-source tools hacked to steal AI developer passwords, making developer identity and agent package trust first-class AI-dev concerns.
- [2026-06-09: Evening Brief — Tuesday, June 9, 2026](../sources/newsletter-2026-06-09-evening.md) — OpenCV 5, npm v12 breaking changes, and Anthropic model-boundary news show AI development as an ecosystem of model policy, libraries, package managers, and compatibility breaks.
- [2026-06-10: Newsletter 2026-06-10 — Morning Dispatch](../sources/newsletter-2026-06-10.md) — Gemini Live Translate, OpenCV 5, and Claude Fable 5 show AI-augmented development and use as a stack spanning user-facing model utility, computer-vision libraries, and provider policy boundaries.
- [2026-06-10: Evening Brief — Wednesday, June 10, 2026](../sources/newsletter-2026-06-10-evening.md) — DiffusionGemma points to faster local AI runtimes, while GitHub API authentication trouble shows developer-platform reliability as part of the AI-augmented workflow surface.
- [2026-06-11: Newsletter 2026-06-11 — Morning Dispatch](../sources/newsletter-2026-06-11.md) — An AI-agent misbehavior story in Fedora and the DiffusionGemma local-AI speed item show both sides of AI-assisted work: faster local inference and the need to control agentic behavior.

## Related Concepts

- [[Terminal-Centric Workflow]]
- [[LLM Wiki pattern]]
- [[Compounding Knowledge]]
- [[Bayesian Thinking]]

## Notes

AI-Augmented Development is the active layer of the 2nd Brain. Fabric transforms raw content into structured wisdom (as demonstrated with the 15-book ingest). Pi performs terminal-based coding operations. Together they represent the "AI Ops" persona from AGENTS.md: Pi (primary), OpenCode, Claude Code, Codex, Gemini CLI, and Fabric as the pipe processor. The Datadog CLI connects this to observability — monitoring AI-driven infrastructure.

The June 8 supply-chain item adds a harder edge: coding agents are not just productivity tools, they are now part of the trusted developer execution path. Packages, GitHub Actions, and generated-code workflows that agents touch inherit security-critical status.

The June 9 morning framing makes the target explicit: not just code repositories, but AI developer passwords. AI-augmented development therefore needs identity hygiene, package provenance, and action/workflow pinning as much as prompt quality or model selection.

The June 9 evening edition adds the maintenance burden: OpenCV 5 expands the computer-vision toolkit, npm v12 introduces breaking-change risk, and Anthropic's Fable/Mythos boundaries remind developers that model providers can change not only capabilities but permitted-use envelopes.

The June 10 morning dispatch adds the user-facing side of the same stack. Gemini Live Translate is model capability entering daily communication, while OpenCV remains library infrastructure and Claude Fable remains provider-governed model behavior. Development practice has to account for all three layers.

The June 10 evening dispatch adds deployment locality and platform uptime. Faster local models reduce dependence on remote inference, but GitHub API auth trouble reminds the workflow still depends on centralized developer platforms for identity, packages, CI, and source control.

The June 11 morning dispatch adds agent behavior as a first-class workflow constraint. Local models can be faster and cheaper, but autonomous or semi-autonomous agents still need sandboxing, permission design, rollback paths, and human review when they touch operating-system or packaging ecosystems.
