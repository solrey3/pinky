---
title: Tails OS
category: platform
docs_url: https://tails.net/doc/
created: "2026-05-10"
tags: [privacy, anonymity, security, tor, live-os]
---

# Tails OS Cheatsheet

> The Amnesic Incognito Live System. A portable operating system that leaves no trace on your computer, routing all traffic through Tor for anonymity.

**Official Docs:** https://tails.net/doc/  
**Platform(s):** x86_64, USB boot, DVD boot, Virtual Machine (not recommended)

---

## Installation

### USB (Recommended)
```bash
# Download from https://tails.net/install/
# Verify ISO signature:
gpg --verify tails-amd64-6.0.iso.sig tails-amd64-6.0.iso

# Write to USB (4GB minimum)
dd if=tails-amd64-6.0.iso of=/dev/sdX bs=4M status=progress

# Or use Tails Verification extension + Tails Installer
```

### Tails Cloner
Use the built-in Tails Cloner when already running Tails to clone to another USB.

### Virtual Machine (not anonymous)
```bash
# For testing only — VM traffic may leak
docker ...  # Not supported officially
```

### Verify
```bash
# Boot from USB, check version
live@tails:~$ cat /etc/os-release
```

---

## Setup & First Boot

1. **Boot from USB** — Set BIOS/UEFI to boot from USB
2. **Welcome Screen** — Choose language, keyboard, network
3. **Use Persistence?** — Create encrypted persistent storage (optional but recommended)
4. **Connect to Tor** — Automatic via Wi-Fi or Ethernet

### Persistent Storage Setup
1. Applications > Tails > Configure persistent volume
2. Set passphrase
3. Select features:
   - Personal Data
   - Bookmarks
   - Network Connections
   - Browser Bookmarks
   - Electrum Bitcoin Wallet
   - Thunderbird Emails
   - GnuPG
   - SSH Client
   - additional software

---

## Key Features

### Built-in Tools
| Tool | Purpose | Launch |
|------|---------|--------|
| Tor Browser | Anonymous web browsing | Applications > Internet > Tor Browser |
| Thunderbird | Email client with Enigmail | Applications > Internet > Thunderbird |
| Pidgin | Encrypted chat (OTR, OMEMO) | Applications > Internet > Pidgin |
| KeePassXC | Password manager | Applications > Accessories > KeePassXC |
| Electrum | Bitcoin wallet | Applications > Internet > Electrum |
| GIMP | Image editing | Applications > Graphics > GIMP |
| LibreOffice | Office suite | Applications > Office |
| OnionShare | Share files/host sites over Tor | Applications > Internet > OnionShare |
| Metadata Cleaner | Strip file metadata | Applications > Accessories > Metadata Cleaner |
| Whonix | Integrated with Whonix gateway |
| VeraCrypt | Disk encryption mount | Applications > Accessories > VeraCrypt |
| Tor Connection | Configure Tor bridges/censorship | System Tools > Tor Connection |

### MAC Address Spoofing
Enabled by default on Wi-Fi. Disable in Settings if it causes issues.

### Unsafe Browser
Applications > Internet > Unsafe Browser — for captive portals (not routed through Tor).

---

## Command Reference

### Tail-specific commands
```bash
# Check Tor status
tails-check-upgrades

# Upgrade Tails
tails-upgrade-frontend-wrapper

# Configure persistent volume
tails-persistent-storage

# Check if persistent volume is mounted
ls /home/amnesia/Persistent/

# Open root terminal (disabled by default)
sudo -i

# Install additional software (persistent only)
sudo apt update && sudo apt install <package>
# Or use Synaptic: Applications > System Tools > Synaptic
```

### Tor control
```bash
# Test Tor connection
curl --socks5-hostname 127.0.0.1:9050 https://check.torproject.org

# Check Tor circuit
nyx  # Tor monitor (if installed)
```

### Disk/Forensics
```bash
# Wipe free space on a volume
scrub -X /media/amnesia/Volume

# Secure erase USB
dd if=/dev/urandom of=/dev/sdX bs=4M status=progress
# or
shred -vfz -n 3 /dev/sdX
```

---

## Tips

- **Amnesiac by design:** Nothing is saved unless explicitly saved to persistent storage.
- **Shutdown:** Pull USB or power off — RAM is wiped. Emergency shutdown removes keys from RAM.
- **No virtual machines:** VMs can deanonymize via host OS leaks.
- **Persistent storage:** Encrypted LUKS volume on the USB. Passphrase-protected.
- **Bridge/Pluggable transports:** If Tor is blocked, use obfs4 or meek bridges in Tor Connection settings.
- **MAC spoofing:** Automatically randomizes MAC addresses. Some networks block this.
- **Unsafe Browser:** Only for captive portals. Never for sensitive browsing.
- **Printer support:** Disabled by default. Enable in Settings if needed (can be fingerprinted).
- **Bitcoin:** Electrum + hardware wallet support if needed.
- **GnuPG:** Full GPG suite for encryption/signing.

---
*Generated via cheatsheet skill on 2026-05-10*
