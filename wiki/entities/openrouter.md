---
id: 2fc32224-750e-4963-8593-5aeba242cdab
title: OpenRouter
type: entity
entity_type: product
created: 2026-05-30
updated: 2026-05-30
tags: [product, ai, llm, api, infrastructure, openrouter]
source_count: 1
---

# OpenRouter

LLM API routing infrastructure layer. OpenRouter provides a unified API endpoint that routes requests to hundreds of language models across providers (Anthropic, OpenAI, Google, Meta, Mistral, and more) under a single authentication scheme. Developers pay per token at pass-through or near-pass-through pricing, with no per-model key management overhead. The value proposition is model arbitrage: switch between providers without changing application code.

**Relevance to this stack:** OpenRouter is the primary model-access layer for this VPS. Pi (the primary coding agent), Open WebUI (browser chat), and Fabric (content processing via `claude-opus-4.7`) all route through OpenRouter. A healthy, well-capitalized OpenRouter is load-bearing infrastructure.

## 2026 Milestone

**Series B: $113M** (announced 2026-05-30). The developer community responded with 306 HN upvotes on announcement day — a signal of genuine utility recognition, not hype. Institutional backing at this scale means OpenRouter is being treated as permanent multi-model infrastructure, not a transitional hack. At the Series B stage the company is moving from startup to platform.

## Sources

- [2026-05-30: Newsletter 2026-05-30 Evening Dispatch](sources/newsletter-2026-05-30-evening.md) — OpenRouter raises $113M Series B; 306 HN upvotes on announcement.

## Related

- [[Anthropic]] — one of the major model providers routed through OpenRouter
- [[LLM API Routing]] — the architectural concept OpenRouter instantiates
- [[Pi]] — primary agent on this stack; uses OpenRouter for model access
