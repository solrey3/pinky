---
id: cargo-cheatsheet
title: cargo Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,rust,package-manager]
---

# cargo Cheatsheet

**Category:** Rust Package Manager & Build Tool  
**Official Docs:** https://doc.rust-lang.org/cargo/

## Install
```bash
# Via rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Already installed if Rust is present
```

## Project Lifecycle

| Command | Description |
|---------|-------------|
| `cargo new myproject` | New binary project |
| `cargo new --lib mylib` | New library project |
| `cargo init` | Init in existing dir |
| `cargo build` | Compile project |
| `cargo build --release` | Optimized release build |
| `cargo run` | Build and run |
| `cargo test` | Run tests |
| `cargo check` | Fast syntax/type check (no binary) |
| `cargo clean` | Remove build artifacts |
| `cargo doc --open` | Generate and open docs |

## Dependencies (Cargo.toml)

```toml
[package]
name = "myproject"
version = "0.1.0"
edition = "2021"

[dependencies]
serde = { version = "1.0", features = ["derive"] }
tokio = { version = "1", features = ["full"] }
reqwest = "0.12"

[dev-dependencies]
mockall = "0.12"

[profile.release]
lto = true
opt-level = 3
```

## Add & Update Dependencies

```bash
cargo add serde                # Add latest
cargo add tokio --features full
cargo add --dev mockall       # Dev dependency
cargo remove serde             # Remove
cargo update                    # Update lock file
cargo update -p serde          # Update specific crate
```

## Publish & Workspace

```bash
cargo publish                   # Publish to crates.io
cargo login                     # Login with API token
cargo yank --vers 0.1.0        # Yank version (soft delete)

# Workspace (multi-crate)
cargo new --lib my-workspace
cd my-workspace
cargo new --lib crate-a
cargo new --lib crate-b
```

## Flags Reference

| Flag | Description |
|------|-------------|
| `-q` | Quiet |
| `-v` | Verbose |
| `--release` / `-r` | Release build |
| `--target` | Cross-compile target |
| `--all-features` | Enable all features |
| `--no-default-features` | Skip default features |
| `--features` | Enable specific features |
| `--locked` | Fail if lock file changes |
| `--offline` | No network access |
| `--timings` | Show build timings |

## One-Liners

```bash
# Quick compile check while coding
cargo watch -x check          # requires cargo-watch

# Check all targets (tests, benches, examples)
cargo check --all-targets --all-features

# Build for musl (static binary)
cargo build --release --target x86_64-unknown-linux-musl

# Find outdated deps
cargo outdated                # requires cargo-outdated

# Run example
cargo run --example demo

# Run specific test
cargo test my_test_name

# Check with clippy
cargo clippy -- -D warnings

# Format code
cargo fmt

# Audit dependencies
cargo audit                   # requires cargo-audit
```

## Common Errors

```bash
# "cannot find macro" → edition mismatch
cargo fix --edition           # Auto-fix edition migration

# Rebuild from scratch
rm -rf target/
cargo build

# Stale lock file
cargo update
```

## Comparison: cargo vs npm vs poetry

| Feature | cargo | npm | poetry |
|---------|-------|-----|--------|
| Language | Rust | JavaScript | Python |
| Lock file | Cargo.lock | package-lock.json | poetry.lock |
| Workspace | ✅ | ✅ | ✅ |
| Dev deps | ✅ | ✅ | ✅ |
| Features system | ✅ Granular | ❌ | ❌ |
| Build caching | ✅ Excellent | Fair | Fair |
| Cross-compilation | ✅ Native | Via tools | Limited |

> cargo is one of the best package managers in existence — fast, reliable, and the feature system is a model other tools should copy.
