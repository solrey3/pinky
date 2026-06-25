---
id: 3cd688d5-2486-4f40-be9a-1a20476b4c97
title: LLM Wiki pattern
type: concept
created: 2026-05-09
updated: 2026-06-25
tags: [llm, architecture, knowledge-management, karpathy, ai-first-notes, openknowledge]
source_count: 2
---

# LLM Wiki Pattern

An architectural pattern for building personal knowledge bases where an LLM agent incrementally builds and maintains a persistent markdown wiki, as opposed to stateless retrieval-augmented generation (RAG). Proposed by Andrej Karpathy.

## Definition

The pattern has three layers:

1. **Raw sources** — immutable source documents (articles, papers, images, data files). The LLM reads from them but never modifies them.
2. **The wiki** — a directory of LLM-generated markdown files: summaries, entity pages, concept pages, comparisons, overviews, synthesis. The LLM owns this layer entirely.
3. **The schema** — a configuration document (e.g., `CLAUDE.md`, `AGENTS.md`) that tells the LLM how the wiki is structured, what conventions to follow, and what workflows to use.

## Operations

- **Ingest** — Process a new source: read it, extract key information, integrate into existing wiki pages. A single source may touch 10-15 pages.
- **Query** — Ask questions against the wiki. Good answers can be filed back into the wiki as new pages so explorations compound.
- **Lint** — Periodically health-check the wiki for contradictions, stale claims, orphan pages, missing cross-references, and data gaps.

## Key Files

- **`index.md`** — Content-oriented catalog. Lists every page with a one-line summary, organized by category. The LLM reads this first when answering queries.
- **`log.md`** — Append-only chronological record of ingests, queries, and lint passes. Parseable with simple Unix tools.

## Contrast with RAG

| | RAG | LLM Wiki |
|---|---|---|
| Persistence | Stateless per-query | Persistent, compounding |
| Synthesis | Rebuilt every time | Already compiled and cross-referenced |
| Contradictions | Rediscovered each query | Flagged during ingest |
| Maintenance | None (raw docs unchanged) | LLM-maintained, near-zero cost |

## Sources

- [2026-05-09: LLM Wiki — A Pattern for Building Personal Knowledge Bases Using LLMs](../sources/karpathy-llm-wiki-pattern.md) — Original proposal.
- [2026-06-25: Evening Brief — Thursday, June 25, 2026](../sources/newsletter-2026-06-25-evening.md) — OpenKnowledge appears as an open-source AI-first alternative to Obsidian/Notion, showing that LLM-native knowledge bases are becoming a visible product category.

## Related Concepts

- [[Compounding knowledge]] — the key advantage of this pattern over RAG
- [[Zettelkasten]] — the linked-note philosophy our wiki architecture implements
- [[PARA]] — the actionability framework governing raw-source lifecycle
- [[OpenKnowledge]] — an AI-first knowledge-management product appearing in the June 25 evening dispatch
