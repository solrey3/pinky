# 2nd Brain — Wiki Schema

PARA + Zettelkasten + LLM Wiki. Raw sources are immutable; the wiki is LLM-maintained.

## Directory Structure

```
~/
├── raw/
│   ├── articles/       # Web articles, blog posts, newsletters
│   ├── papers/         # Academic papers, reports
│   ├── journal/        # Personal journal entries, reflections
│   ├── podcasts/       # Podcast transcripts, show notes
│   ├── books/          # Book chapters, reading notes
│   └── assets/         # Images, PDFs, downloaded attachments
└── wiki/
    ├── README.md       # This schema
    ├── index.md       # Content catalog (updated on every ingest)
    ├── log.md          # Append-only changelog
    ├── sources/        # Summaries of raw sources
    ├── entities/       # People, organizations, products, places
    ├── concepts/       # Ideas, theories, frameworks, terms
    └── synthesis/      # Comparisons, analyses, overviews
```

## Page Conventions

### Frontmatter

```yaml
---
id: <uuid>
title: <human-readable title>
type: source | entity | concept | synthesis
created: <ISO timestamp>
updated: <ISO timestamp>
tags: [<tag1>, <tag2>]
source_count: <number of raw sources this page reflects>
---
```

### Wikilinking

- Internal links: `[[page-title]]` or `[[page-title|display text]]`
- Source links: `../sources/<slug>.md`
- Cross-directory: `[[entities/person-name]]`

### Page Types

| Type | Purpose | Example |
|------|---------|---------|
| `source` | Summary of one raw document | `sources/attention-is-all-you-need.md` |
| `entity` | Profile of a person, org, product | `entities/google.md` |
| `concept` | Explanation of an idea or framework | `concepts/transformer.md` |
| `synthesis` | Cross-source analysis, comparison, overview | `synthesis/nlp-architecture-evolution.md` |

## Workflows

### Ingest

1. Drop source into `~/pinky/raw/<category>/`
2. Trigger `/skill:wiki-ingest <path>`
3. LLM reads source, discusses takeaways, updates wiki:
   - Write source summary in `wiki/sources/`
   - Update/create entity pages
   - Update/create concept pages
   - Update `wiki/index.md`
   - Append entry to `wiki/log.md`

### Query

1. User asks question
2. LLM reads `wiki/index.md` to find relevant pages
3. Reads those pages, synthesizes answer with citations
4. Optionally files answer as new `synthesis/` page

### Lint

Periodic health check:
- Contradictions between pages
- Stale claims superseded by newer sources
- Orphan pages (no inbound links)
- Missing concept pages for mentioned terms
- Gaps worth filling with web search
- Missing cross-references

## Special Files

### index.md

Content catalog. Organized by type. Updated on every ingest. LLM reads this first when answering queries.

### log.md

Append-only. Format each entry:

```markdown
## [<ISO date>] <operation> | <title>
- Source: `raw/<category>/<file>`
- Summary: <one-line>
- Pages touched: <list>
- Notes: <optional>
```

Operations: `ingest`, `query`, `lint`, `update`

```
