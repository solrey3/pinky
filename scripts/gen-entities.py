#!/usr/bin/env python3
"""
Batch-generate wiki entity pages from raw/people/ and raw/movies/ files.
Skips files that already have an entity page.
"""

import os
import re
import uuid
from datetime import datetime, timezone
from pathlib import Path

WIKI_DIR = Path.home() / "pinky/wiki"
RAW_DIR  = Path.home() / "pinky/raw"
NOW      = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
TODAY    = datetime.now(timezone.utc).strftime("%Y-%m-%d")


def slugify(s):
    return re.sub(r"[^a-z0-9-]", "", s.lower().replace(" ", "-").replace("_", "-"))


def extract_title(text, slug):
    """Pull the H1 title from the raw file."""
    m = re.search(r"^#\s+(.+)$", text, re.MULTILINE)
    if m:
        title = m.group(1).strip()
        # Strip parenthetical year for movies: "The Godfather (1972)" -> "The Godfather"
        title = re.sub(r"\s*\(\d{4}\)\s*$", "", title)
        return title
    return slug.replace("-", " ").title()


def extract_section(text, heading):
    """Extract content under a markdown heading (## heading)."""
    pattern = rf"^##\s+{re.escape(heading)}\s*\n(.*?)(?=^##|\Z)"
    m = re.search(pattern, text, re.MULTILINE | re.DOTALL)
    if m:
        return m.group(1).strip()
    return ""


def first_sentence(text):
    """Return first sentence of a block of text."""
    text = text.strip()
    # Remove markdown bold/italic
    text = re.sub(r"\*+", "", text)
    m = re.search(r"^(.+?[.!?])", text)
    if m:
        return m.group(1).strip()
    return text[:200].strip()


WRITER_SIGNALS = {"journalist", "author", "sports-writer", "podcaster", "broadcaster",
                  "commentator", "analyst", "historian", "executive", "coach",
                  "statistician", "forecaster", "sabermetrics"}

def get_person_tags(text, slug):
    tags = ["person"]
    t = text.lower()
    # Wrestling (check first — highest priority)
    if any(k in t for k in ["wrestler", "wrestling", "wwe", "aew", "njpw", "ecw", "wcw", "wwf", "pro rank"]):
        tags += ["wrestling"]
    # NBA — only if NOT primarily a writer/analyst
    elif any(k in t for k in ["nba", "position:", "basketball", "ppg", "rpg"]) and \
         not any(k in t for k in ["sports-writer", "journalist", "broadcaster", "podcaster", "author"]):
        tags += ["basketball", "nba"]
    # Film / TV
    elif any(k in t for k in ["director", "filmmaker", "screenwriter", "cartoonist", "showrunner", "television writer"]):
        tags += ["film", "tv"]
    # Music
    elif any(k in t for k in ["musician", "singer", "band", "album", "discography"]):
        tags += ["music"]
    return list(dict.fromkeys(tags))  # dedupe, preserve order


def get_movie_tags(text):
    tags = ["film"]
    genre_m = re.search(r"\*\*Genre:\*\*\s*(.+)", text)
    if genre_m:
        genres = [g.strip().lower().replace(" ", "-") for g in genre_m.group(1).split(",")]
        tags += genres[:3]
    director_m = re.search(r"\*\*Director:\*\*\s*(.+)", text)
    if director_m:
        tags.append("cinema")
    return list(dict.fromkeys(tags))


def get_movie_meta(text):
    """Return dict of Director, Genre, Runtime, Country."""
    meta = {}
    for field in ["Director", "Genre", "Runtime", "Country"]:
        m = re.search(rf"\*\*{field}:\*\*\s*(.+)", text)
        if m:
            meta[field] = m.group(1).strip()
    return meta


def get_person_meta(text):
    """Return dict of key metadata fields."""
    meta = {}
    for field in ["Born", "Nationality", "Position", "Active", "Profession",
                  "Personal NBA Tier", "Personal Rank", "Real Name"]:
        m = re.search(rf"\*\*{field}:\*\*\s*(.+)", text)
        if m:
            meta[field] = m.group(1).strip()
    return meta


def build_person_entity(slug, raw_text):
    title = extract_title(raw_text, slug)
    meta  = get_person_meta(raw_text)
    tags  = get_person_tags(raw_text, slug)
    summary = extract_section(raw_text, "Summary")
    highlights = extract_section(raw_text, "Career Highlights") or \
                 extract_section(raw_text, "Key Works / Highlights") or \
                 extract_section(raw_text, "Why They Matter")
    desc = first_sentence(summary) if summary else ""

    # Metadata line
    meta_lines = []
    for k in ["Real Name", "Born", "Nationality", "Position", "Active", "Profession",
              "Personal NBA Tier", "Personal Rank"]:
        if k in meta:
            meta_lines.append(f"**{k}:** {meta[k]}")

    # Build body
    body_parts = []
    if desc:
        body_parts.append(desc)
    if meta_lines:
        body_parts.append("\n".join(meta_lines))
    if summary:
        body_parts.append(f"## Summary\n\n{summary}")
    if highlights:
        body_parts.append(f"## Highlights\n\n{highlights}")

    body_parts.append(
        f"## Sources\n\n"
        f"- [{TODAY}: Raw notes](../../raw/people/{slug}.md)"
    )
    body_parts.append("## Related\n\n")

    uid = str(uuid.uuid4())
    frontmatter = f"""---
id: {uid}
title: {title}
type: entity
entity_type: person
created: {NOW}
updated: {NOW}
tags: [{", ".join(tags)}]
source_count: 1
---"""

    return f"{frontmatter}\n\n# {title}\n\n" + "\n\n".join(body_parts) + "\n"


def build_movie_entity(slug, raw_text):
    title = extract_title(raw_text, slug)
    meta  = get_movie_meta(raw_text)
    tags  = get_movie_tags(raw_text)
    summary = extract_section(raw_text, "Summary")
    themes  = extract_section(raw_text, "Key Themes")
    matters = extract_section(raw_text, "Why It Matters")
    desc = first_sentence(summary) if summary else ""

    meta_lines = []
    for k in ["Director", "Genre", "Runtime", "Country"]:
        if k in meta:
            meta_lines.append(f"**{k}:** {meta[k]}")

    body_parts = []
    if meta_lines:
        body_parts.append("\n".join(meta_lines))
    if summary:
        body_parts.append(f"## Summary\n\n{summary}")
    if themes:
        body_parts.append(f"## Key Themes\n\n{themes}")
    if matters:
        body_parts.append(f"## Why It Matters\n\n{matters}")

    body_parts.append(
        f"## Sources\n\n"
        f"- [{TODAY}: Raw notes](../../raw/movies/{slug}.md)"
    )

    # Try to link director entity
    related = []
    if "Director" in meta:
        dir_slug = slugify(meta["Director"])
        related.append(f"[[{meta['Director']}]]")
    body_parts.append("## Related\n\n" + ("\n".join(f"- {r}" for r in related) if related else ""))

    uid = str(uuid.uuid4())
    frontmatter = f"""---
id: {uid}
title: {title}
type: entity
entity_type: film
created: {NOW}
updated: {NOW}
tags: [{", ".join(tags)}]
source_count: 1
---"""

    return f"{frontmatter}\n\n# {title}\n\n" + "\n\n".join(body_parts) + "\n"


def process_category(raw_subdir, entity_builder, label):
    raw_path    = RAW_DIR / raw_subdir
    entity_path = WIKI_DIR / "entities"
    created = []
    skipped = []

    for raw_file in sorted(raw_path.glob("*.md")):
        slug = raw_file.stem
        out  = entity_path / f"{slug}.md"
        if out.exists():
            skipped.append(slug)
            continue
        raw_text = raw_file.read_text(encoding="utf-8")
        content  = entity_builder(slug, raw_text)
        out.write_text(content, encoding="utf-8")
        created.append(slug)

    print(f"\n{label}: {len(created)} created, {len(skipped)} skipped")
    for s in created:
        print(f"  + {s}")
    return created


if __name__ == "__main__":
    created_people = process_category("people", build_person_entity, "PEOPLE")
    created_movies = process_category("movies", build_movie_entity,  "MOVIES")
    print(f"\nTotal new entity pages: {len(created_people) + len(created_movies)}")
