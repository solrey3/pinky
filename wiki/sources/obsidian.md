---
id: 4897af53-7996-4afd-895a-8efd86a9d31b
title: Obsidian Cheatsheet
type: source
source_type: cheatsheet
created: 2026-05-19
updated: 2026-05-19
tags: [obsidian, notes, second-brain, zettelkasten, knowledge-management, markdown, tools]
source_path: raw/cheatsheets/obsidian.md
---

# Obsidian Cheatsheet

**Author:** Sancho (cheatsheet skill)  
**Date:** 2026-05-15  
**Source:** [raw/cheatsheets/obsidian.md](../../raw/cheatsheets/obsidian.md)

## Summary

Obsidian is a local-first, markdown-based knowledge base and note-taking app with bidirectional linking, graph view, and a rich plugin ecosystem. It runs as a desktop/mobile app (no CLI binary), stores everything in a plain-text vault folder, and keeps config per-vault under `.obsidian/`. It is the recommended viewer/browser layer in the [[LLM Wiki pattern]] — the LLM does the writes, Obsidian does the navigation and visualization.

The cheatsheet covers installation across macOS/Linux/Windows, vault structure recommendations (PARA-aligned folder naming), keyboard shortcuts, the full markdown and wikilink syntax, core and community plugins, Dataview query examples, Templater scripting, sync/backup options, and the `obsidian://` deep link URI scheme.

Key tension: Obsidian is not a server or CLI tool — it is a GUI app that must be launched on a machine where the vault is accessible. On a headless VPS like this one, it runs only via the vault files themselves being synced (e.g., `~/pinky/`) and viewed on a client machine (macOS, iOS) with Obsidian installed there.

## Key Claims

1. **Local-first, vault = folder** — the vault is just a directory of `.md` files; no proprietary format lock-in.
2. **Wikilink graph is the core value** — `[[note-name]]` links build a knowledge graph that makes connections visible.
3. **PARA-compatible structure** — recommended folder layout maps directly to PARA (Projects / Areas / Resources / Archive) with Zettelkasten as a fifth layer.
4. **Dataview enables SQL-like queries** — community plugin that lets you query frontmatter and file metadata across the vault (e.g., "list all notes tagged #project created this year").
5. **Templater replaces core Templates** — community plugin with JS scripting for dynamic templates (dates, cursors, prompts).
6. **Sync options: paid Obsidian Sync ($10/mo), Git (Obsidian Git plugin), rsync, iCloud, Syncthing** — multiple strategies; avoid Dropbox on mobile.
7. **obsidian:// URI scheme** — supports deep linking to open vault, create note, search — useful for automation.
8. **`.obsidian/` is per-vault config** — copy it between machines to replicate settings; workspace state can conflict with Git.

## Entities Mentioned

- [[Obsidian]]
- [[Dataview]] *(community plugin)*
- [[Templater]] *(community plugin)*
- [[Obsidian Git]] *(community plugin)*

## Concepts Introduced

- [[LLM Wiki pattern]] — Obsidian as viewer layer
- [[Zettelkasten method]] — Obsidian is a primary implementation tool
- [[PARA method]] — recommended vault folder structure mirrors PARA
- [[Digital Gardens]] — Obsidian vaults as cultivated knowledge spaces

## Synthesis Notes

The Obsidian entity page already existed from the Karpathy LLM Wiki ingest — that source described Obsidian's role as the *viewing layer* in an AI-maintained wiki. This cheatsheet fills in the full operational picture: how to install it, configure it, use keyboard shortcuts, write wikilinks, and hook in the community plugins (Dataview, Templater, Obsidian Git) that make it production-grade.

The key synthesis insight: Obsidian is the front-end of this wiki. The raw files in `~/pinky/` are the vault. Any machine with Obsidian pointed at the synced vault directory gets full graph view, backlinks, and search. The LLM (this agent) is the write layer; Obsidian is the read/navigate layer. They are complementary, not overlapping.

Connects to: [[karpathy-llm-wiki-pattern]], [[para-method]], [[zettelkasten-method]]
