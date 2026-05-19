---
title: Obsidian
category: tool
docs_url: https://help.obsidian.md
created: 2026-05-15
tags: [obsidian, notes, second-brain, zettelkasten, knowledge-management, markdown]
---

# Obsidian Cheatsheet

> A private, local-first markdown knowledge base and note-taking app with linking, graph view, and a rich plugin ecosystem.

**Official Docs:** https://help.obsidian.md  
**Version referenced:** latest (1.x)  
**Platform(s):** Linux / macOS / Windows / Android / iOS

---

## Installation

### macOS
```bash
# Homebrew
brew install --cask obsidian

# Or download .dmg from https://obsidian.md/download
```

### Linux
```bash
# AppImage (universal)
wget https://github.com/obsidianmd/obsidian-releases/releases/latest/download/Obsidian-<version>.AppImage
chmod +x Obsidian-*.AppImage
./Obsidian-*.AppImage

# Flatpak
flatpak install flathub md.obsidian.Obsidian

# Snap
sudo snap install obsidian --classic

# .deb (Debian/Ubuntu)
wget https://github.com/obsidianmd/obsidian-releases/releases/latest/download/obsidian_<version>_amd64.deb
sudo dpkg -i obsidian_*.deb
```

### Windows
```powershell
# winget
winget install Obsidian.Obsidian

# Or chocolatey
choco install obsidian

# Or scoop (extras bucket)
scoop install obsidian
```

### Verify
Launch Obsidian — no CLI binary; verify version via Help → About.

---

## Setup / Quickstart

1. **Open vault** — point Obsidian at a folder (new or existing)
2. **Create a note** — `Ctrl/Cmd + N`
3. **Link notes** — type `[[note-name]]` to create a wikilink
4. **Open graph view** — `Ctrl/Cmd + G`

### Vault structure (recommended)
```
vault/
├── 00-inbox/         ← capture everything here first
├── 10-projects/      ← active work (PARA: Projects)
├── 20-areas/         ← ongoing responsibilities (PARA: Areas)
├── 30-resources/     ← reference material (PARA: Resources)
├── 40-archive/       ← completed/inactive (PARA: Archive)
├── 50-zettelkasten/  ← atomic notes with IDs
├── _templates/       ← note templates
└── _attachments/     ← images, PDFs, etc.
```

---

## Configuration

### Config location
- **Vault config:** `<vault>/.obsidian/` (per-vault)
  - `app.json` — core settings
  - `plugins/` — community plugins
  - `themes/` — CSS themes
  - `snippets/` — custom CSS

### Key settings to configure (Settings → ...)
| Setting | Location | Recommended |
|---------|----------|-------------|
| Default location for new notes | Files & Links | Specific folder (e.g., `00-inbox`) |
| New link format | Files & Links | Shortest path when possible |
| Default view for new tabs | Editor | Source mode or Live Preview |
| Auto-pair brackets | Editor | On |
| Spellcheck | Editor | On |
| Attachment folder | Files & Links | `_attachments` |

---

## Keyboard Shortcuts

### Navigation
| Shortcut | Action |
|----------|--------|
| `Ctrl/Cmd + O` | Quick switcher (open note) |
| `Ctrl/Cmd + P` | Command palette |
| `Ctrl/Cmd + G` | Open graph view |
| `Ctrl/Cmd + E` | Toggle edit/preview |
| `Ctrl/Cmd + \` | Split pane |
| `Ctrl/Cmd + W` | Close tab |
| `Ctrl/Cmd + Tab` | Cycle tabs |
| `Alt + ←/→` | Navigate back/forward |

### Editing
| Shortcut | Action |
|----------|--------|
| `Ctrl/Cmd + N` | New note |
| `Ctrl/Cmd + B` | Bold |
| `Ctrl/Cmd + I` | Italic |
| `Ctrl/Cmd + K` | Insert markdown link |
| `Ctrl/Cmd + L` | Toggle checklist |
| `[[` | Start wikilink |
| `#` | Add tag (inline) |
| `Ctrl/Cmd + /` | Toggle comment |
| `Ctrl/Cmd + Z` | Undo |

### Search
| Shortcut | Action |
|----------|--------|
| `Ctrl/Cmd + F` | Search in current note |
| `Ctrl/Cmd + Shift + F` | Search vault |
| `Ctrl/Cmd + Shift + E` | Show file explorer |
| `Ctrl/Cmd + Shift + G` | Open global graph |

---

## Markdown Reference

### Core syntax
```markdown
# H1  ## H2  ### H3  #### H4

**bold**   *italic*   ~~strikethrough~~   ==highlight==

- bullet list
1. numbered list
- [ ] task (unchecked)
- [x] task (checked)

> blockquote

`inline code`

```code block```

---   (horizontal rule)

[link text](https://url.com)
![[embedded-note]]          ← embed another note
![[image.png]]              ← embed image
```

### Wikilinks
```markdown
[[Note Name]]                     ← link to note
[[Note Name|Display Text]]        ← link with alias
[[Note Name#Heading]]             ← link to heading
[[Note Name^block-id]]            ← link to block
![[Note Name]]                    ← embed note inline
```

### Tags
```markdown
#tag
#nested/tag
#multi-word-tag
```

### Frontmatter (YAML)
```yaml
---
title: My Note
created: 2026-05-15
tags: [topic, project]
aliases: [alt-name]
status: draft
---
```

### Callouts
```markdown
> [!NOTE] Title
> Content here

> [!WARNING]
> This is a warning

> [!TIP] Tip
> Useful tip here
```
Available types: `NOTE`, `TIP`, `IMPORTANT`, `WARNING`, `CAUTION`, `INFO`, `TODO`, `ABSTRACT`, `SUCCESS`, `QUESTION`, `FAILURE`, `BUG`, `EXAMPLE`, `QUOTE`

---

## Core Plugins (built-in)

| Plugin | Use |
|--------|-----|
| **Daily notes** | One note per day with template |
| **Templates** | Insert reusable note templates |
| **Backlinks** | See what links to current note |
| **Outgoing links** | See all links from current note |
| **Graph view** | Visual map of all note connections |
| **Canvas** | Infinite whiteboard for visual thinking |
| **Search** | Full-text vault search |
| **File recovery** | Snapshots / version history |
| **Sync** | Obsidian's paid sync service |
| **Tag pane** | Browse all tags |
| **Starred** / Bookmarks | Pin important notes |
| **Outline** | TOC of headings in current note |
| **Word count** | Live word/char count |

---

## Community Plugins (essential)

Install via Settings → Community plugins → Browse

| Plugin | Purpose |
|--------|---------|
| **Dataview** | SQL-like queries over your vault |
| **Templater** | Advanced templates with JS scripting |
| **Calendar** | Daily notes calendar sidebar |
| **Periodic Notes** | Daily/weekly/monthly/yearly notes |
| **QuickAdd** | Fast capture + macro automation |
| **Excalidraw** | Embedded hand-drawn diagrams |
| **Kanban** | Kanban boards in markdown |
| **Advanced Tables** | Table editor with tab navigation |
| **Obsidian Git** | Auto-commit vault to Git |
| **Tasks** | Task management with due dates, filters |
| **Omnisearch** | Faster full-text search |
| **Style Settings** | Configure theme variables |
| **Linter** | Auto-format notes on save |

---

## Dataview Examples

```dataview
// List all notes tagged #project created this year
LIST
FROM #project
WHERE file.cday >= date(2026-01-01)
SORT file.cday DESC
```

```dataview
// Table of tasks not done
TABLE task, file.link AS Note
FROM ""
FLATTEN file.tasks AS task
WHERE !task.completed
```

---

## Templater Examples

```javascript
// In a template file (_templates/daily.md)
---
created: <% tp.date.now("YYYY-MM-DD") %>
week: <% tp.date.now("WW") %>
---

# <% tp.date.now("dddd, MMMM D YYYY") %>

## Today's Focus
- 

## Notes

<% tp.file.cursor() %>
```

---

## Obsidian Sync & Backup

### Obsidian Sync (paid, $10/mo)
Settings → Sync → Connect → select vault

### Git backup (free, via Obsidian Git plugin)
```bash
cd <vault-dir>
git init
git remote add origin git@github.com:user/vault.git
# Plugin handles auto-commit on save/interval
```

### Manual rsync backup
```bash
rsync -av --delete ~/vault/ user@server:~/vault-backup/
```

---

## URI Scheme (automation / deep links)

```
obsidian://open?vault=<vault-name>&file=<note-name>
obsidian://new?vault=<vault>&name=<name>&content=<content>
obsidian://search?vault=<vault>&query=<query>
obsidian://hook-get-address   ← Hook integration
```

---

## Tips & Gotchas

- **`.obsidian/` is vault-specific** — copy it between machines for consistent settings.
- **`obsidian://` URI** requires vault name, not path — use exact name from vault picker.
- **Sync conflicts** — Obsidian Sync handles gracefully; Git can create merge conflicts in `.obsidian/workspace`.
- **Large vaults** — disable "Files & Links → Detect all file extensions" for speed.
- **Wikilinks vs markdown links** — wikilinks break if note is renamed without vault tracking; use Obsidian's rename to auto-update.
- **Graph performance** — disable display of attachments and orphan files in graph settings for large vaults.
- **Mobile sync** — use Obsidian Sync or iCloud/Syncthing; avoid Dropbox conflicts on mobile.
- **Community plugins on mobile** — supported but may lag desktop in updates.

---

## See Also

- [Official Docs](https://help.obsidian.md)
- [Obsidian Forum](https://forum.obsidian.md)
- [Plugin List](https://obsidian.md/plugins)
- [GitHub](https://github.com/obsidianmd/obsidian-releases)
- Related cheatsheets: [[neovim]], [[just]], [[git]]

---
*Generated via cheatsheet skill on 2026-05-15*
