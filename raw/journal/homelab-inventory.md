# Homelab Inventory
date: 2026-05-25
tags: homelab, hardware, infrastructure, nixos, kubernetes, linux, macos, networking

## Overview

19 nodes across NATO phonetic alphabet (alpha–sierra). Mix of desktops, laptops, mini PCs, SBCs, a NAS, a cloud droplet, and a gaming handheld. Core infrastructure runs on three Beelink EQR5 mini PCs (kilo/lima/mike) targeting a K8s cluster. Primary workstation is juliet (M4 Mac Mini). Primary daily driver is quebec (Framework 13).

---

## Computers

### alpha — GARAGE PC
- **Year:** 2012
- **CPU:** Intel Core i5-3570K @ 3.80 GHz (4 cores)
- **GPU:** NVIDIA GeForce GTX 660
- **RAM:** 32 GB
- **Storage:** 456.88 GB SSD
- **OS:** NixOS 24.11 (Vicuna)
- NixOS testing ground, media consumption (YouTube, web radio, Navidrome), video encoding via Handbrake (BluRay/DVD drive)
- Dual monitor via DVI; WiFi only; intermittent use (garage)

### bravo — BLUDDSHED100Z / LINUX DESKTOP SERVER
- **Year:** 2021
- **CPU:** AMD Ryzen 9 3900X 3.8 GHz (12C/24T, 70MB cache, 105W)
- **GPU:** NVIDIA GeForce RTX 3070
- **RAM:** 32 GB DDR4-3000 (4×8 GB Crucial Ballistix Sport)
- **Storage:** 1 TB PCIe NVMe + 2 TB Seagate SATA III + 8 TB HDD
- **Mobo:** ASUS TUF X570-PLUS GAMING (Wi-Fi) ATX
- **OS:** Omarchy
- Primary home server (always-on, Ethernet); AI workstation (Ollama, Open-WebUI); gaming (Steam, 5120×1440 ultrawide); virtualization (Docker, QEMU)
- Originally gaming PC, repurposed as server; running Omarchy (opinionated Arch-based dev environment)

### charlie — OLD INTEL MAC LAPTOP
- **Model:** 2017 13" MacBook Pro (Intel)
- **OS:** NixOS (experimental)
- OS testing/experimentation, potential OpenCLP setup, VM testing

### delta — FAILED DAILY DRIVER
- **Model:** 2022 13" MacBook Air (M2)
- **CPU:** Apple M2 @ 3.50 GHz (8 cores)
- **GPU:** Apple M2 (10 cores) @ 1.40 GHz
- **RAM:** 8 GB
- **Storage:** 460.43 GB SSD
- **OS:** macOS Sequoia 15.4
- **Display:** 3420×2224 @ 60 Hz (internal non-functional)
- Desktop-only due to broken internal display; external monitor required; mobile broadband for anywhere access; ~7hr battery

### echo — RASPBERRY PI 5
- **Model:** Raspberry Pi 5
- **OS:** Raspberry Pi OS
- IoT/automation projects, lightweight server apps, ARM development

### foxtrot — OLD LAPTOP
- **Model:** Early 2013 13" Retina MacBook Pro
- Backup dev machine, older macOS compat testing, spare parts

### golf — OLD LAPTOP
- **Model:** Late-2011 15" MacBook Pro
- Vintage macOS testing, emergency backup, historical reference

### hotel — DROPLET
- **Platform:** DigitalOcean Droplet
- **OS:** Ubuntu Server
- Cloud infrastructure testing

### india — GAMING CONSOLE
- **Model:** Steam Deck OLED
- **OS:** SteamOS (Arch Linux-based)
- **Storage:** Internal + 1 TB microSD
- Primary portable gaming; retro emulation; media consumption; HDMI desktop mode
- Planned: Nix home-manager, Civ V EUI, PokerStars NJ via Proton

### juliet — PRIMARY WORKSTATION
- **Model:** 2024 M4 Mac Mini
- **CPU:** Apple M4 @ 4.46 GHz (10 cores)
- **GPU:** Apple M4 (10 cores) @ 1.58 GHz
- **RAM:** 16 GB
- **Storage:** 228.27 GB internal + 4 TB Samsung T7 external
- **OS:** macOS Sequoia 15.3.2
- **Display:** Samsung C49RG9x 49" ultrawide (5120×1440 @ 120 Hz)
- Primary dev workstation (Chrome, VSCode, Neovim); Navidrome music hub; iPhone sync; gaming (Steam, emulators)

---

## Homelab Infrastructure

### kilo — K8S CONTROL PLANE
- **Model:** Beelink EQR5
- **CPU:** AMD Ryzen 7 5825U @ 4.55 GHz (16 threads)
- **RAM:** 12 GB
- **Storage:** 97.87 GB SSD
- **OS:** Fedora CoreOS (planned)
- **Network:** Ethernet (192.168.1.158/24)
- Kubernetes control plane; cluster orchestration; workload scheduling

### lima — K8S WORKER NODE
- **Model:** Beelink EQR5
- **OS:** Fedora CoreOS (planned)
- K8s worker node; container workload execution

### mike — K8S WORKER NODE
- **Model:** Beelink EQR5
- **OS:** Fedora CoreOS (planned)
- Container workload execution; distributed compute; load balancing; cluster scaling

### november — OLD MAC MINI
- **Model:** Mac Mini A1347
- **Status:** EFI boot loader requires repair
- **Target OS:** NixOS
- NixOS testing, legacy hardware experimentation, potential IoT hub or media server

### oscar — BACKUP DAILY DRIVER
- **Model:** ThinkPad T480s
- **CPU:** Intel Core i5-8350U @ 1.70 GHz (4C/8T)
- **RAM:** 16 GB
- **Storage:** 475 GB (35 GB / 8% used)
- **OS:** Pop!_OS 24.04 LTS / Linux 6.16
- **Virt:** VT-x enabled
- Mobile workstation / daily driver; dev + productivity; Claude Code ops; notes repo management

### papa — MINI PC (Philippines)
- **Model:** Beelink SER5 Max
- **CPU:** AMD Ryzen 7 5825U
- **RAM:** 16 GB
- **Storage:** 512 GB SSD
- Remote node located in the Philippines

### quebec — PRIMARY DAILY DRIVER
- **Model:** Framework Laptop 13 (AMD Ryzen AI 300)
- **CPU:** AMD Ryzen AI 7 350 (16 cores) @ 5.09 GHz
- **GPU:** AMD Radeon 860M (integrated)
- **RAM:** 30.64 GB
- **Storage:** 906.94 GB SSD
- **OS:** Pop!_OS 24.04 LTS / Linux 6.17.9-76061709-generic
- **Display:** 2880×1920 @ 120 Hz, 14" (NE135A1M-NY1)
- **Network:** 192.168.1.207 (WiFi)
- **DE:** COSMIC 1.0.0 (Wayland) / alacritty + JetBrainsMono Nerd Font
- Primary daily driver; dev + productivity; Claude Code ops; notes repo management

### romeo / illmatic — NAS
- **Model:** Synology DS920+
- **Hostname:** illmatic (NATO: romeo)
- Primary NAS; multimedia backup (TV, movies, music); Pi-hole DNS ad-blocking (Docker); Cloudflare Tunnel

### sierra — PI-HOLE BACKUP
- **Model:** Raspberry Pi 1
- Backup Pi-hole DNS server; network-level ad-blocking redundancy

---

## Node Summary Table

| NATO    | Hostname       | Form Factor     | OS                    | Role                        |
|---------|----------------|-----------------|------------------------|-----------------------------|
| alpha   | garage-pc      | Desktop         | NixOS 24.11            | NixOS testing, media        |
| bravo   | bluddshed100z  | Desktop Server  | Omarchy                | Primary home server, AI     |
| charlie | intel-mbp-2017 | Laptop          | NixOS (exp)            | OS testing                  |
| delta   | m2-mba-2022    | Laptop (broken) | macOS Sequoia 15.4     | Desktop backup              |
| echo    | rpi5           | SBC             | Raspberry Pi OS        | IoT, automation             |
| foxtrot | mbp-2013       | Laptop          | —                      | Backup dev, spare parts     |
| golf    | mbp-2011       | Laptop          | —                      | Vintage testing, emergency  |
| hotel   | droplet        | VPS             | Ubuntu Server          | Cloud infra testing         |
| india   | steam-deck     | Handheld        | SteamOS (Arch)         | Portable gaming, emulation  |
| juliet  | mac-mini-m4    | Mini PC         | macOS Sequoia 15.3.2   | Primary workstation         |
| kilo    | beelink-eqr5-1 | Mini PC         | Fedora CoreOS (planned)| K8s control plane           |
| lima    | beelink-eqr5-2 | Mini PC         | Fedora CoreOS (planned)| K8s worker node             |
| mike    | beelink-eqr5-3 | Mini PC         | Fedora CoreOS (planned)| K8s worker node             |
| november| mac-mini-a1347 | Mini PC         | NixOS (target)         | Legacy testing, NAS cand.   |
| oscar   | thinkpad-t480s | Laptop          | Pop!_OS 24.04          | Backup daily driver         |
| papa    | beelink-ser5   | Mini PC         | —                      | Remote node (Philippines)   |
| quebec  | framework-13   | Laptop          | Pop!_OS 24.04          | Primary daily driver        |
| romeo   | illmatic       | NAS             | Synology DSM           | Primary NAS, Pi-hole        |
| sierra  | rpi1           | SBC             | —                      | Pi-hole backup              |
