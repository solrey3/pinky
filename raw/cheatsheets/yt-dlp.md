---
id: yt-dlp-cheatsheet
title: yt-dlp Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,dj-engine,video,dowload]
---

# yt-dlp Cheatsheet

**Category:** Media Downloader (YouTube + 1000+ sites)  
**Official Docs:** https://github.com/yt-dlp/yt-dlp

## Install
```bash
# pip
pip install yt-dlp

# pipx
pipx install yt-dlp

# macOS
brew install yt-dlp

# Arch/Manjaro
sudo pacman -S yt-dlp
```

## Basic Download

| Command | Description |
|---------|-------------|
| `yt-dlp <url>` | Best quality, auto-named |
| `yt-dlp -o '%(title)s.%(ext)s' <url>` | Custom output name |
| `yt-dlp --list-formats <url>` | Show available formats |
| `yt-dlp -f 'bestvideo+bestaudio' <url>` | Merge best video+audio |

## Quality & Format Selection

```bash
# Best video + audio merged as mkv
yt-dlp -f 'bv*+ba/b' <url>

# 1080p max
yt-dlp -S 'res:1080' <url>

# Audio only (best)
yt-dlp -x --audio-format mp3 <url>

# Extract audio to specific format
yt-dlp -x --audio-format flac --audio-quality 0 <url>
```

## Playlists & Batch

```bash
# Download entire playlist
yt-dlp -o '%(playlist_index)s - %(title)s.%(ext)s' <playlist_url>

# Download range
yt-dlp --playlist-start 5 --playlist-end 10 <playlist>

# Skip downloaded (archive)
yt-dlp --download-archive archive.txt <playlist>

# Get metadata only
yt-dlp --skip-download --write-info-json <url>
```

## Advanced Features

```bash
# Embed subtitles + chapters + thumbnail
yt-dlp --embed-subs --embed-chapters --embed-thumbnail <url>

# SponsorBlock: remove sponsors
yt-dlp --sponsorblock-remove sponsor <url>

# SponsorBlock: mark but don't remove
yt-dlp --sponsorblock-mark sponsor <url>

# Write description to file
yt-dlp --write-description --skip-download <url>

# Cookies (for age-restricted / members)
yt-dlp --cookies-from-browser firefox <url>
yt-dlp --cookies cookies.txt <url>

# Thumbnail download only
yt-dlp --skip-download --write-thumbnail <url>
```

## Audio Extraction

```bash
# Extract best audio → mp3
yt-dlp -x --audio-format mp3 --audio-quality 0 <url>

# Extract → opus (best quality, smaller)
yt-dlp -x --audio-format opus --audio-quality 0 <url>

# Embed thumbnail in mp3
yt-dlp -x --audio-format mp3 --embed-thumbnail <url>
```

## Quick Snippets

```bash
# Single song, best audio, opus
yt-dlp -x --audio-format opus --audio-quality 0 -o '%(artist)s - %(title)s.%(ext)s' <url>

# Whole playlist as mp3
yt-dlp -x --audio-format mp3 --audio-quality 0 -o '%(playlist_index)02d - %(title)s.%(ext)s' <playlist>

# Dump video info (JSON)
yt-dlp -j --no-download <url> | jq .

# Legacy: youtube-dl syntax works too
yt-dlp --extract-audio --audio-format mp3 <url>
```

Essential for the DJ Engineer persona and any media archiving workflow.
