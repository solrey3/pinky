---
id: 0ee9fd89-63f6-4f3e-bc32-c2919a3428e6
title: LLM Wiki — A Pattern for Building Personal Knowledge Bases Using LLMs
type: source
source_type: article
created: 2026-05-09
updated: 2026-05-09
tags: [llm, knowledge-management, wiki, architecture, karpathy]
source_path: raw/gists/karpathy-llm-wiki-pattern.md
---

# LLM Wiki — A Pattern for Building Personal Knowledge Bases Using LLMs

**Author:** Andrej Karpathy  
**Date:** 2026-04 (approximate)  
**Source:** [raw/gists/karpathy-llm-wiki-pattern.md](../../raw/gists/karpathy-llm-wiki-pattern.md)

## Summary

Andrej Karpathy proposes an architectural pattern where LLM agents maintain a persistent, interlinked markdown wiki instead of relying on stateless RAG retrieval. The pattern separates concerns into three layers — raw sources (immutable), the wiki (LLM-generated, compounding), and a schema document (conventions and workflows). When a new source is added, the LLM reads it, extracts key information, and integrates it across existing wiki pages — updating entities, flagging contradictions, and strengthening synthesis. This approach turns the knowledge base into a compounding artifact rather than a pile of indexed documents.

The pattern is intentionally abstract: no fixed directory structure, tooling, or implementation details. The LLM and user collaborate to instantiate a version that fits their domain. Karpathy uses Obsidian as the viewer and an LLM agent (Codex, Claude Code, etc.) as the maintainer, with a schema document (e.g., `CLAUDE.md`, `AGENTS.md`) that co-evolves over time.

## Key Claims

1. **RAG is stateless and non-compounding.** Systems like NotebookLM and ChatGPT file uploads retrieve chunks at query time but rebuild understanding from scratch every time. There is no persistent synthesis.
2. **The wiki is a persistent, compounding artifact.** Cross-references exist. Contradictions are flagged. The synthesis reflects everything read so far. Each new source makes the wiki richer.
3. **Humans curate; LLMs maintain.** The human sources documents and asks questions. The LLM handles summarizing, cross-referencing, filing, and bookkeeping — the work humans abandon wikis over.
4. **Three-layer architecture:** Raw sources (immutable) → The wiki (LLM-owned markdown) → The schema (configuration document).
5. **Three core operations:** Ingest (process source, touch 10-15 pages), Query (synthesize with citations, file good answers back), Lint (health-check for contradictions, orphans, stale claims).
6. **Two special files:** `index.md` (content catalog for navigation) and `log.md` (append-only chronological record with parseable prefixes).
7. **The pattern traces to Vannevar Bush's Memex (1945).** Bush envisioned a personal, curated knowledge store with associative trails. The unsolved problem was maintenance — LLMs solve that.

## Entities Mentioned

- [[Andrej Karpathy]] — author of the pattern
- [[Vannevar Bush]] — conceptual ancestor (Memex, 1945)
- [[qmd]] — local markdown search engine with hybrid BM25/vector + LLM reranking
- [[Obsidian]] — recommended wiki viewing tool

## Concepts Introduced

- [[LLM Wiki pattern]] — the core three-layer architecture
- [[Compounding knowledge]] — persistent synthesis vs. stateless retrieval
- Ingest / Query / Lint — the three operations
- Schema document — the config file that makes the LLM a disciplined maintainer

## Synthesis Notes

This pattern validates and articulates much of what the 2nd Brain wiki already does: raw sources in `~/pinky/raw/`, LLM-generated pages in `~/pinky/wiki/`, a schema in `AGENTS.md`, and the wiki-ingest skill. Differences to consider: Karpathy explicitly calls out `index.md` and `log.md` as first-class files (already present here), recommends a periodic "Lint" operation (not yet formalized), and mentions tooling like qmd, Marp, and Dataview for scaling. The pattern is a good reference to point future LLM sessions at when they need to understand *why* the wiki is structured this way.
