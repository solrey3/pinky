---
id: 5db7aa2c-4a2b-48a3-b485-afab38fbccdb
title: Compounding knowledge
type: concept
created: 2026-05-09
updated: 2026-05-09
tags: [knowledge-management, llm, epistemology]
source_count: 1
---

# Compounding Knowledge

The property of a knowledge base where each new source adds not just raw information but strengthens the existing synthesis — cross-references are updated, contradictions are flagged, and the overall understanding becomes richer. Contrasts with stateless retrieval where understanding is rebuilt from scratch on every query.

## Definition

In a compounding knowledge system:
- Cross-references between entities and concepts already exist
- Contradictions have already been flagged and resolved (or noted)
- The synthesis already reflects everything read so far
- Each new question or source makes the structure richer, not just larger

## Contrast with Stateless Retrieval

Most RAG systems (NotebookLM, ChatGPT file uploads) treat documents as a pile of chunks. When you ask a question, the LLM retrieves relevant chunks and pieces together an answer. Nothing is persisted. Ask the same subtle question tomorrow, and the LLM redoes the work.

In a compounding system, the LLM has already done the work of integrating sources into a structured wiki. Queries are answered by reading the pre-synthesized pages, not by re-deriving from raw documents.

## Sources

- [2026-05-09: LLM Wiki — A Pattern for Building Personal Knowledge Bases Using LLMs](../sources/karpathy-llm-wiki-pattern.md) — The wiki is described as a "persistent, compounding artifact" where "the cross-references are already there" and "the synthesis already reflects everything you've read."

## Related Concepts

- [[LLM Wiki pattern]] — the architecture designed to achieve compounding knowledge
