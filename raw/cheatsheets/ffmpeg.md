---
id: ffmpeg-cheatsheet
title: ffmpeg Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-10
updated: 2026-05-10
tags: [cli,dj-engine,video,audio,media]
---

# ffmpeg Cheatsheet

**Category:** Multimedia Swiss Army Knife  
**Official Docs:** https://ffmpeg.org/documentation.html

## Install
```bash
# macOS
brew install ffmpeg

# Debian/Ubuntu
sudo apt install ffmpeg

# Fedora
sudo dnf install ffmpeg
```

## Basic Operations

| Command | Description |
|---------|-------------|
| `ffmpeg -i input.mp4 output.avi` | Convert format |
| `ffmpeg -i input.mp4 -vn -acodec copy output.aac` | Extract audio |
| `ffmpeg -i input.mp4 -an -vcodec copy output.mp4` | Remove audio |
| `ffmpeg -f lavfi -i anullsrc=r=44100:cl=stereo -t 10 -acodec aac output.aac` | Generate silent audio |

## Audio Manipulation

```bash
# Extract audio to mp3 (128k)
ffmpeg -i input.mp4 -vn -ar 44100 -ac 2 -b:a 128k output.mp3

# Extract audio to flac (lossless)
ffmpeg -i input.wav output.flac

# Trim audio (start at 30s, duration 60s)
ffmpeg -i input.mp3 -ss 00:00:30 -t 60 -c copy output.mp3

# Join audio files
ffmpeg -i "concat:file1.mp3|file2.mp3" -acodec copy output.mp3

# Normalize audio
ffmpeg -i input.mp3 -af "loudnorm" output.mp3

# Speed up 2x (audio only)
ffmpeg -i input.mp3 -af "atempo=2.0" output.mp3

# Convert sample rate
ffmpeg -i input.wav -ar 48000 output.wav
```

## Video Manipulation

```bash
# Trim video (ss=start, t=duration)
ffmpeg -i input.mp4 -ss 00:01:00 -t 30 -c copy output.mp4

# Resize video
ffmpeg -i input.mp4 -vf "scale=1920:1080" output.mp4
ffmpeg -i input.mp4 -vf "scale=1280:-2" output.mp4  # auto height

# Change frame rate
ffmpeg -i input.mp4 -r 30 output.mp4

# Hardcode subtitles
ffmpeg -i input.mp4 -vf "subtitles=subtitle.srt" output.mp4

# Create video from images
ffmpeg -framerate 1/5 -i img%03d.png -c:v libx264 -r 30 output.mp4
```

## Conversion & Codecs

```bash
# H.265 / HEVC (smaller file)
ffmpeg -i input.mp4 -c:v libx265 -crf 28 output.mp4

# VP9 for web
ffmpeg -i input.mp4 -c:v libvpx-vp9 -b:v 1M output.webm

# GIF from video segment
ffmpeg -i input.mp4 -ss 5 -t 3 -vf "fps=10,scale=480:-1:flags=lanczos" output.gif

# Still frame at 5 seconds
ffmpeg -i input.mp4 -ss 00:00:05 -vframes 1 thumb.jpg
```

## Streaming & Network

```bash
# Stream to RTMP (e.g. Twitch, YouTube)
ffmpeg -i input.mp4 -c:v libx264 -preset fast -b:v 3000k -maxrate 3000k -bufsize 6000k -c:a aac -b:a 160k -ar 44100 -f flv rtmp://server/key

# HTTP live streaming (HLS)
ffmpeg -i input.mp4 -c:v copy -c:a copy -f hls -hls_time 10 -hls_list_size 0 playlist.m3u8

# Capture webcam
ffmpeg -f v4l2 -i /dev/video0 -c:v libx264 -preset ultrafast output.mkv

# Capture screen (Linux X11)
ffmpeg -f x11grab -i :0.0 -c:v libx264 -preset ultrafast output.mkv

# Capture screen (macOS)
ffmpeg -f avfoundation -i "1:0" -c:v libx264 -preset ultrafast output.mkv
```

## Quick Snippets

```bash
# Check media info
ffmpeg -i input.mp4 2>&1 | grep -E "Stream|Duration"

# Fast copy (no re-encode)
ffmpeg -i input.mp4 -c copy -ss 30 -t 60 output.mp4

# Mute video
ffmpeg -i input.mp4 -c:v copy -an output.mp4

# Add audio track to video
ffmpeg -i video.mp4 -i audio.mp3 -c:v copy -c:a aac -shortest output.mp4

# Batch convert all mp4 to mp3
for f in *.mp4; do ffmpeg -i "$f" -vn -ar 44100 -ac 2 -b:a 192k "${f%.mp4}.mp3"; done
```

## Important Flags

| Flag | Meaning |
|------|---------|
| `-i` | Input file |
| `-c:v` | Video codec (`copy`, `libx264`, `libx265`) |
| `-c:a` | Audio codec (`copy`, `aac`, `mp3`, `flac`) |
| `-vn` | No video |
| `-an` | No audio |
| `-ss` | Start time |
| `-t` | Duration |
| `-to` | End time |
| `-crf` | Constant rate factor (quality, lower=better) |
| `-preset` | Encoding speed (`ultrafast` to `veryslow`) |
| `-vf` | Video filter |
| `-af` | Audio filter |
| `-f` | Force format |
| `-y` | Overwrite output |

Indispensable for the DJ Engineer, media librarian, and anyone doing video/audio processing at the command line.
