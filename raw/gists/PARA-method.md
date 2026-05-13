# PARA — Organizing Information for Action

## What is PARA?

PARA is a universal system for organizing digital information, developed by Tiago Forte. The acronym stands for four top-level categories applied to every folder, label, or project in your digital workspace:

| Category | Definition | Time Horizon |
|----------|-----------|--------------|
| **P**rojects | Discrete outcomes with deadlines or end dates — e.g., "Deploy blog redesign", "Write Q2 report", "Plan trip to Kyoto" | Weeks to months |
| **A**reas | Ongoing responsibilities without a fixed end — e.g., "Health", "Finances", "Career", "House Maintenance" | Indefinite |
| **R**esources | Reference material by topic — things you might want to reference later — e.g., "Photography", "Python", "Cognitive Biases", "Recipes" | No expiration |
| **A**rchives | Inactive items from the other three categories — completed projects, abandoned areas, outdated resources | Closed |

The core insight: **classify by actionability, not by subject matter.** A "project" is anything with a concrete outcome and a deadline; an "area" is a responsibility you maintain forever.

## Why PARA Works

- **Actionability beats ontology.** Sorting by type (books, links, notes) buries urgency. PARA surfaces what matters *now*.
- **Mirrors how we actually work.** We think in projects. We reference topics. We maintain domains. We close loops.
- **Portable.** Apply the same four folders everywhere: notes app, file system, task manager, email.
- **Scales down.** Even a minimal setup with four folders is usable.

## PARA in Our 2nd Brain System

Our system applies PARA to the **workspace/lifecycle** of raw sources, not to the wiki itself:

```
# Raw source lifecycle (PARA applied)

ACTIVE         →  raw/ articles, papers, podcasts, journal entries you are
                  currently processing or referencing
                  These are "Projects" — time-bound, actionable

ONGOING        →  Permanent raw categories (articles, books, papers, etc.)
                  These are "Areas" — always relevant, no end date

TREATED        →  Once ingested, sources become reference material in the wiki
                  Resources →  wiki/concepts/, wiki/entities/, wiki/sources/
                  These are "Resources" — retrievable, cross-referenced

ARCHIVED       →  Sources that are stale, superseded, or no longer relevant.
                  Kept in raw/ but marked/ignored.
                  These are "Archives" — retained but out of active rotation
```

### Where PARA lives in our system

| PARA Level | Where it lives | How it's used |
|------------|---------------|---------------|
| **Projects** | `raw/` per-ingest batches, or your task manager | A reading sprint, a research phase, a month of journal entries |
| **Areas** | The fixed `raw/` subdirectories (`articles/`, `papers/`, `journal/`, etc.) | Ongoing streams you never stop adding to |
| **Resources** | `wiki/` — concepts, entities, sources, synthesis | The compiled, cross-linked knowledge base |
| **Archives** | Stale entries in `wiki/log.md`, ignored `raw/` files | Closed topics, completed research, deprecated notes |

### Key principle

The wiki itself is **not** organized by PARA. The wiki is organized by the Zettelkasten + LLM Wiki pattern (see [[Zettelkasten]]). PARA governs what is *active now*; the Zettelkasten governs how knowledge is *connected over time*.

## Origins and References

- **Tiago Forte**, *Building a Second Brain* (2022)
- [Forte Labs — PARA Method](https://fortelabs.com/blog/para/)
- Related concepts: GTD, Johnny Decimal, fleeting vs. permanent notes
