---
id: cowsay-cheatsheet
title: cowsay Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,ascii,fun]
---

# cowsay Cheatsheet

**Category:** ASCII Cow Speech Bubble  
**Official Docs:** `man cowsay`

## Install
```bash
# Debian/Ubuntu
sudo apt install cowsay
# macOS
brew install cowsay
# Fedora
sudo dnf install cowsay
```

## Basic Usage

```bash
cowsay "Hello world"
#  _____________
# < Hello world >
#  -------------
#         \   ^__^
#          \  (oo)\_______
#             (__)\       )\/\
#                 ||----w |
#                 ||     ||

cowthink "Hmm..."
#  ___________
# ( Hmm... )
#  ---------
#         o   ^__^
#          o  (oo)\_______
#             (__)\       )\/\
#                 ||----w |
#                 ||     ||
```

## Modes

```bash
cowsay -b "borg"           # Borg mode (glasses)
cowsay -d "dead"           # Dead (X eyes)
cowsay -g "greedy"         # Dollar-sign eyes
cowsay -p "paranoid"       # @@ eyes
cowsay -s "stoned"         # ** eyes
cowsay -t "tired"          # -- eyes
cowsay -w "wired"          # OOO eyes
cowsay -y "youthful"       # .. eyes
```

## Custom Cows

```bash
cowsay -f tux "Linux!"     # Tux penguin
cowsay -f dragon "Rawr"    # Dragon
cowsay -f kitty "Meow"     # Cat
cowsay -f stegosaurus "Old"
cowsay -f ghostbusters "Who ya gonna call?"
cowsay -f cheese "I am the cheese"
cowsay -f elephant "Never forget"
cowsay -f moose "Canada!"

# List all cows
cowsay -l
```

## Width & Wrap

```bash
cowsay -W 20 "This wraps at 20 chars wide"
cowsay -n "No\nwrap\nat\nall"   # Disable wrapping
```

## Pipeline Usage

```bash
# Pipe any output
cat file.txt | cowsay
ls | cowsay
fortune | cowsay -f tux

cal | cowthink -f small       # Small cow for dense input
```

## Custom Cow Files

```bash
# Write .cow file (~/.cows/)
$cow = <<'EOC'
   $thoughts
    $thoughts
      ___
     (o o)
    (  V  )
    /--m--
EOC

# Use it
cowsay -f ~/.cows/bird.caw "Tweet"
```

## One-Liners

```bash
# MOTD
echo "$(fortune | cowsay -f tux)"

# Error handler
command || cowsay -d "It failed"

# Birthday
cowsay -f stegosaurus "Happy Birthday!"

# Centered in terminal
figlet "HI" | cowsay -n -f eyes

# Random cow mode
cowsay -f $(cowsay -l | tail -n +2 | tr ' ' '\n' | shuf -n 1) "Random!"
```

## One-Up: ponysay

```bash
# ponies instead of cows
ponysay "Friendship is magic!"
# Much larger character library (MLP + non-MLP)
```

> cowsay is the original ASCII messenger. Essential for MOTDs, commit messages, and making terminal output less depressing.
