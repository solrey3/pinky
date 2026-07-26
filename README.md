# Pinky — 2nd Brain

> *Pinky is the name of the 2nd brain and is actually a genius while The Brain is the one who is insane.*

Pinky is a personal knowledge management system built on the **PARA** + **Zettelkasten** + **LLM Wiki** pattern. It operates as a three-layer architecture:

1. **`raw/`** — Immutable capture layer. Articles, books, cheatsheets, journal entries, newsletters, papers, podcasts, and assets land here and never change.
2. **`wiki/`** — LLM-maintained synthesis layer. Source summaries, entity pages, concept pages, synthesis notes, and an append-only log. Cross-referenced with `[[wiki links]]`.
3. **Schema** — Frontmatter conventions, page types (`source | entity | concept | synthesis`), and the ingest/query/lint workflow defined in `~/.pi/agent/skills/wiki-ingest/SKILL.md`.

## Directory Structure

```
pinky/
├── raw/
│   ├── articles/       # Web articles, blog posts, newsletters
│   ├── papers/         # Academic papers, reports
│   ├── journal/        # Personal journal entries, reflections
│   ├── podcasts/       # Podcast transcripts, show notes
│   ├── books/          # Book chapters, reading notes
│   ├── cheatsheets/    # CLI tool quick-reference guides
│   ├── gists/          # Captured gists and frameworks
│   ├── newsletters/    # Daily Daytime Dispatch & Evening Brief
│   └── assets/         # Images, PDFs, downloaded attachments
├── scripts/
│   └── publish-latest-newsletter.sh  # Publishes latest dispatch to GitHub Pages /news
└── wiki/
    ├── README.md       # Wiki schema
    ├── index.md        # Content catalog (updated on every ingest)
    ├── log.md          # Append-only changelog
    ├── sources/        # Summaries of raw sources
    ├── entities/       # People, organizations, products, places
    ├── concepts/       # Ideas, theories, frameworks, terms
    ├── synthesis/      # Comparisons, analyses, overviews
    └── music/
        └── albums/     # Album notes
```

## Workflows

### Ingest
1. Drop source into `~/pinky/raw/<category>/`
2. Trigger `/skill:wiki-ingest <path>`
3. LLM reads source, discusses takeaways, updates wiki pages

### Query
1. Ask a question
2. LLM reads `wiki/index.md` to find relevant pages
3. Reads those pages, synthesizes answer with citations

### Publish Latest Dispatch
The News Correspondent pipeline publishes the newest file from `raw/newsletters/` to GitHub Pages:

```bash
~/pinky/scripts/publish-latest-newsletter.sh [optional/path/to/newsletter.md]
```

This writes `~/solrey3.github.io/news/index.md`, commits it in the Pages repo, and pushes it so the latest dispatch is available at:

- https://solrey3.github.io/news

The publisher normalizes Markdown tables for Jekyll/kramdown, adds high-contrast table styling, linkifies required public sources, and enforces public-display preferences such as weather links, MarketWatch ticker links, sports source links, and clickable wrestling schedule URLs.

### Lint
Periodic health check for contradictions, stale claims, orphan pages, and missing cross-references.

## Why "Pinky"?

Because the 2nd brain does the actual thinking. The first brain (The Brain) just thinks it's in charge.

---

*Maintained by Sancho. Ingested, queried, and linted by Pi (OpenRouter).*
