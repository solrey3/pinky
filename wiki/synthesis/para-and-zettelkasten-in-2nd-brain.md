---
id: b4222dde-1f1f-415f-826e-2767eb4f0d93
title: PARA and Zettelkasten in Our 2nd Brain
type: synthesis
created: 2026-05-09
updated: 2026-05-09
tags: [2nd-brain, architecture, para, zettelkasten, llm-wiki, system-design]
source_count: 2
---

# PARA and Zettelkasten in Our 2nd Brain

Our 2nd Brain system combines two distinct knowledge-management methodologies into one architecture: **PARA** for workflow and **Zettelkasten** for structure. They operate at different layers and solve different problems. Understanding their separation is essential to using the system correctly.

## The Separation

| Concern | Method | Layer | Question it answers |
|---------|--------|-------|---------------------|
| **What should I work on now?** | PARA | Raw-source lifecycle | Actionability, urgency, deadlines |
| **How does this connect to everything else?** | Zettelkasten | Wiki structure | Links, relationships, synthesis |

## PARA at the Raw-Source Layer

PARA classifies information by **what you need to do with it**:

```
ACTIVE    →  raw/ files you are currently reading or processing
             (Projects: time-bound, outcome-driven)

ONGOING   →  raw/ category directories (articles/, papers/, journal/, etc.)
             (Areas: permanent streams you never stop adding to)

TREATED   →  wiki/ pages: sources/, concepts/, entities/, synthesis/
             (Resources: compiled, cross-referenced, retrievable)

ARCHIVED  →  stale raw/ files, deprecated wiki pages
             (Archives: retained but out of rotation)
```

The key discipline: **move completed things to Archive.** This creates mental space. The fixed `raw/` subdirectories (`articles/`, `papers/`, `journal/`, etc.) are *Areas* — they never close.

## Zettelkasten at the Wiki Layer

The wiki is organized by **links, not folders**. Every page is atomic-ish, addressable, and cross-referenced:

```
raw/inputs (immutable)  →  LLM ingest  →  wiki/graph (linked, evolving)
```

- **Entities** (people, orgs, products, places) accumulate cross-source profiles
- **Concepts** (ideas, frameworks, terms) accumulate definition, nuance, and contradiction
- **Sources** are literature notes — summaries in our own voice
- **Synthesis** is where new connections are made explicit

The wiki has no PARA folders. It would be a mistake to create `wiki/projects/` or `wiki/archive/`. The wiki's job is connection; PARA's job is actionability.

## Why This Dual Architecture Works

1. **PARA prevents hoarding.** It forces closure. Without it, raw/ becomes an undifferentiated pile and the wiki becomes bloated with abandoned topics.
2. **The Zettelkasten prevents siloing.** It forces cross-referencing. Without it, concepts stay trapped in their source-of-origin and synthesis never emerges.
3. **The LLM bridges the gap.** The human decides what to ingest (PARA: what is active/valuable). The LLM decides how to link it (Zettelkasten: where it belongs in the graph).

## Karpathy's LLM Wiki + Our Extensions

Andrej Karpathy's LLM Wiki pattern provides the architecture: raw sources, LLM-maintained wiki, schema document. Our extensions are:

- **Explicit PARA discipline** at the raw-source layer (Karpathy leaves this open)
- **Explicit Zettelkasten philosophy** at the wiki layer (the linking model is implicit in Karpathy's pattern; we make it explicit)
- **Dual authorship**: Tiago Forte (PARA) + Niklas Luhmann (Zettelkasten) as the intellectual pillars

## Anti-Patterns to Avoid

- **Putting PARA inside the wiki.** Don't create `wiki/projects/` or `wiki/archive/`. The wiki is a graph.
- **Ignoring the Archive.** Don't leave completed projects in active rotation. Archive them.
- **Not linking.** A page with no inbound or outbound wikilinks is an orphan. The LLM should create links during ingest; if it doesn't, the page is underutilized.
- **Over-atomizing.** Our wiki pages are not single-paragraph Zettelkasten cards. They are larger synthesis documents. The atomicity is at the *page* level, not the *paragraph* level.

## Sources

- [2026-05-09: PARA — Organizing Information for Action](../sources/para-method.md) — Documents PARA's role in raw-source lifecycle management.
- [2026-05-09: Zettelkasten — Thinking by Linking](../sources/zettelkasten-method.md) — Documents Zettelkasten's role in wiki structure and linking.
- [2026-05-09: LLM Wiki — A Pattern for Building Personal Knowledge Bases Using LLMs](../sources/karpathy-llm-wiki-pattern.md) — The architectural foundation.

## Related Pages

- [[PARA]] — the actionability framework
- [[Zettelkasten]] — the linked-note philosophy
- [[LLM Wiki Pattern]] — the three-layer architecture
- [[Compounding Knowledge]] — the outcome of maintaining this system over time
