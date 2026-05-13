---
id: gcc-cheatsheet
title: gcc Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,compiler,c]
---

# gcc Cheatsheet

**Category:** GNU C/C++ Compiler  
**Official Docs:** https://gcc.gnu.org/onlinedocs/

## Basic Compile

```bash
gcc hello.c -o hello           # C
gcc hello.c                    # Output: a.out
g++ hello.cpp -o hello         # C++
```

## Common Flags

| Flag | Description |
|------|-------------|
| `-o file` | Output filename |
| `-c` | Compile only (no link) |
| `-S` | Assembly output only |
| `-E` | Preprocess only |
| `-g` | Debug symbols |
| `-O0` | No optimization |
| `-O1` | Basic optimization |
| `-O2` | Standard optimization |
| `-O3` | Aggressive optimization |
| `-Os` | Optimize for size |
| `-Wall` | All warnings |
| `-Wextra` | Extra warnings |
| `-Werror` | Treat warnings as errors |
| `-std=c11` | C standard |
| `-std=c++20` | C++ standard |
| `-I dir` | Include dir |
| `-L dir` | Library dir |
| `-lname` | Link library |
| `-DNAME` | Define macro |
| `-static` | Static linking |
| `-shared` | Shared library |
| `-fPIC` | Position-independent code |
| `-pthread` | POSIX threads |
| `-march=native` | Optimize for CPU |

## Multi-File Projects

```bash
# Compile objects separately
gcc -c main.c -o main.o
gcc -c utils.c -o utils.o

# Link
gcc main.o utils.o -o program

# One-liner
gcc main.c utils.c -o program

# With headers
gcc -I./include -c src/*.c
gcc *.o -o program -L./lib -lmylib
```

## Debug & Analysis

```bash
# Debug build
gcc -g -O0 program.c -o program

# Address sanitizer
gcc -fsanitize=address program.c -o program

# Thread sanitizer
gcc -fsanitize=thread program.c -o program

# Generate dependencies
gcc -MMD -c main.c              # Creates main.d

# Assembly listing
gcc -S -fverbose-asm program.c  # program.s
```

## One-Liners

```bash
# Quick compile & run
gcc hello.c -o hello && ./hello

# Check include paths
gcc -E -Wp,-v -xc /dev/null

# Show default macros
gcc -dM -E -xc /dev/null | grep ARCH

# Link math library
gcc calc.c -o calc -lm

# Compile to static binary
gcc hello.c -o hello -static

# Optimize for current CPU
gcc -O3 -march=native -flto program.c -o program
```

## Comparison: gcc vs clang

| Feature | gcc | clang |
|---------|-----|-------|
| Speed | Good | Faster compile |
| Diagnostics | Good | Better error messages |
| Static analysis | Basic | Excellent |
| OpenMP | ✅ | ✅ |
| LTO | ✅ | ✅ |
| Modules (C++20) | Experimental | Better support |

> gcc is the GNU standard, universally available. clang is preferred for development due to superior diagnostics and faster compiles.
