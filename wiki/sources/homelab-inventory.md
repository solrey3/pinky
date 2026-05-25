---
id: a3f8c2d1-7b4e-4901-a6f2-8c3d9e0b1a5f
title: Homelab Inventory
type: source
source_type: journal
created: 2026-05-25
updated: 2026-05-25
tags: [homelab, hardware, infrastructure, nixos, kubernetes, linux, macos, networking]
source_path: raw/journal/homelab-inventory.md
---

# Homelab Inventory

**Capture Date:** 2026-05-25  
**Source:** [raw/journal/homelab-inventory.md](../raw/journal/homelab-inventory.md)

## Summary

19-node homelab spanning NATO phonetic alphabet (alpha through sierra). Mix of desktops, laptops, mini PCs, SBCs, a NAS, a cloud VPS, and a gaming handheld. Three Beelink EQR5 mini PCs (kilo/lima/mike) are the K8s cluster target. Primary workstation is juliet (M4 Mac Mini). Primary daily driver is quebec (Framework 13 AMD Ryzen AI 300).

Infrastructure spans NixOS experiments (alpha, charlie, november), Arch/Omarchy on the main home server (bravo), Pop!_OS on daily drivers (oscar, quebec), macOS on primary workstation (juliet) and broken-display laptop (delta). Three Beelinksmini PCs targeting Fedora CoreOS for Kubernetes (kilo, lima, mike). Remote node in the Philippines (papa). NAS at romeo/illmatic (Synology DS920+, running Pi-hole in Docker). Raspberry Pi 5 for IoT (echo), Raspberry Pi 1 as Pi-hole backup (sierra). Steam Deck OLED for portable gaming (india).

## Node Summary

| NATO | Hostname | Form Factor | OS | Role |
|------|----------|-------------|----|------|
| alpha | garage-pc | Desktop | NixOS 24.11 | NixOS testing, media |
| bravo | bluddshed100z | Desktop Server | Omarchy (Arch) | Primary home server, AI, gaming |
| charlie | intel-mbp-2017 | Laptop | NixOS (exp.) | OS testing |
| delta | m2-mba-2022 | Laptop (broken display) | macOS Sequoia 15.4 | Desktop backup |
| echo | rpi5 | SBC | Raspberry Pi OS | IoT, automation |
| foxtrot | mbp-2013 | Laptop | — | Backup dev, spare parts |
| golf | mbp-2011 | Laptop | — | Vintage testing, emergency |
| hotel | droplet | VPS | Ubuntu Server | Cloud infra testing |
| india | steam-deck | Handheld | SteamOS (Arch) | Portable gaming, emulation |
| juliet | mac-mini-m4 | Mini PC | macOS Sequoia 15.3.2 | Primary workstation |
| kilo | beelink-eqr5-1 | Mini PC | Fedora CoreOS (planned) | K8s control plane |
| lima | beelink-eqr5-2 | Mini PC | Fedora CoreOS (planned) | K8s worker |
| mike | beelink-eqr5-3 | Mini PC | Fedora CoreOS (planned) | K8s worker |
| november | mac-mini-a1347 | Mini PC | NixOS (target) | Legacy testing |
| oscar | thinkpad-t480s | Laptop | Pop!_OS 24.04 | Backup daily driver |
| papa | beelink-ser5 | Mini PC | — | Remote node (Philippines) |
| quebec | framework-13 | Laptop | Pop!_OS 24.04 | Primary daily driver |
| romeo | illmatic (Synology DS920+) | NAS | Synology DSM | Primary NAS, Pi-hole, Cloudflare Tunnel |
| sierra | rpi1 | SBC | — | Pi-hole backup |

## Key Specs

- **juliet (M4 Mac Mini):** Apple M4 4.46 GHz (10C), 16 GB RAM, 228 GB internal + 4 TB Samsung T7, Samsung C49RG9x 49" ultrawide (5120×1440 @ 120 Hz)
- **quebec (Framework 13):** AMD Ryzen AI 7 350 (16C) @ 5.09 GHz, 30.64 GB RAM, 906 GB SSD, 2880×1920 @ 120 Hz, COSMIC DE (Wayland)
- **bravo (bluddshed100z):** AMD Ryzen 9 3900X (12C/24T), RTX 3070, 32 GB DDR4, 1 TB NVMe + 2 TB + 8 TB HDD, 5120×1440 ultrawide, Omarchy
- **kilo/lima/mike:** Beelink EQR5, AMD Ryzen 7 5825U, targeting K8s cluster on Fedora CoreOS
- **hotel (DigitalOcean droplet):** Ubuntu Server — this VPS, Sancho's primary ops environment

## Synthesis Notes

This is the full hardware map of the homelab as of 2026-05-25. The NATO naming convention brings order to a heterogeneous fleet. Key tensions: NixOS ambitions (alpha, charlie, november, papa targets) vs. current practical reality (Pop!_OS and Omarchy for dailies). The K8s cluster (kilo/lima/mike) is still planned — Fedora CoreOS not yet installed. The Synology NAS (romeo/illmatic) is the backbone for media and DNS.

The hotel droplet is this VPS — Sancho's primary remote command center and the environment where Pi runs.

## Entities Mentioned

- [[DigitalOcean]] — cloud provider (hotel droplet)
- [[Tailscale]] — connects all nodes
- [[NixOS]] — target OS for alpha, charlie, november
- [[Omarchy]] — Arch-based opinionated dev environment on bravo
- [[Kubernetes]] — target workload for kilo/lima/mike
- [[Synology]] — NAS at romeo/illmatic

## Related

- [[cloud-and-infrastructure]]
- [[container-orchestration]]
- [[terminal-centric-workflow]]
