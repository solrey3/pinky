---
id: nodejs-cheatsheet
title: nodejs Cheatsheet
type: cheatsheet
category: cli
created: 2026-05-11
updated: 2026-05-11
tags: [cli,javascript,runtime]
---

# nodejs Cheatsheet

**Category:** JavaScript / TypeScript Runtime  
**Official Docs:** https://nodejs.org/api/

## Install

```bash
# Via nvm (recommended)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install 24
nvm use 24
nvm alias default 24

# Via mise (your stack)
mise use nodejs@24

# macOS
brew install node

# Debian/Ubuntu
sudo apt install nodejs npm
```

## Node CLI

| Command | Description |
|---------|-------------|
| `node script.js` | Run script |
| `node -e "console.log(1+1)"` | Eval inline |
| `node -i` / `node` | REPL |
| `node --inspect script.js` | Debug with Chrome DevTools |
| `node --watch script.js` | Watch and restart (Node 18+) |
| `node -v` | Node version |
| `node --version` | Node version |

## npm Commands

| Command | Description |
|---------|-------------|
| `npm init` | Create package.json |
| `npm install` | Install deps from package.json |
| `npm install pkg` | Install and add to dependencies |
| `npm install -D pkg` | Install dev dependency |
| `npm install -g pkg` | Global install |
| `npm uninstall pkg` | Remove package |
| `npm update` | Update all packages |
| `npm outdated` | Check outdated packages |
| `npm run script` | Run package.json script |
| `npm test` | Run test script |
| `npm start` | Run start script |
| `npm publish` | Publish to npm registry |
| `npm link` | Symlink for local dev |
| `npm ci` | Clean install from lock file |
| `npm audit` | Security audit |
| `npm audit fix` | Auto-fix vulnerabilities |

## npx (Run without install)

```bash
npx create-react-app myapp
npx ts-node script.ts
npx serve ./build
npx --yes pkg@latest           # Auto-install if missing
```

## package.json Scripts

```json
{
  "scripts": {
    "start": "node dist/index.js",
    "dev": "node --watch src/index.js",
    "build": "tsc",
    "test": "vitest",
    "lint": "eslint .",
    "format": "prettier --write ."
  }
}
```

## Flags Reference

| Flag | Description |
|------|-------------|
| `--experimental-*` | Enable experimental features |
| `--no-warnings` | Suppress warnings |
| `--import` | Preload ESM module |
| `--require` | Preload CJS module |
| `--max-old-space-size=4096` | Increase heap memory |
| `--trace-deprecation` | Show deprecation stack traces |
| `--inspect=0.0.0.0:9229` | Bind debug to all interfaces |

## One-Liners

```bash
# Quick HTTP server
npx serve .
node -e "require('http').createServer((req,res)=>res.end('OK')).listen(8080)"

# JSON pretty-print
cat file.json | node -e "process.stdin.once('data',d=>console.log(JSON.stringify(JSON.parse(d),null,2)))"

# Check module resolution
node -e "console.log(require.resolve('express'))"

# Show all global modules
npm ls -g --depth=0

# Clean npm cache
npm cache clean --force

# Find duplicate packages
npm ls --all | grep " deduped"
```

## Core Modules (no install)

| Module | Use |
|--------|-----|
| `fs` | File system |
| `path` | Path manipulation |
| `os` | OS info |
| `url` | URL parsing |
| `http` / `https` | HTTP servers |
| `crypto` | Cryptography |
| `stream` | Streams |
| `events` | EventEmitter |
| `child_process` | Spawn processes |
| `util` | Utilities |

## Comparison: node vs bun vs deno

| Feature | Node 24 | Bun | Deno |
|---------|---------|-----|------|
| npm compat | ✅ Native | ✅ | Via npm:specifier |
| TypeScript | Via tsx/ts-node | Native | Native |
| Speed | Good | Fastest | Good |
| Runtime | V8 | JSCore | V8 |
| Bundler built-in | ❌ | ✅ | ✅ |
| Test runner | Built-in | Built-in | Built-in |
| ESM/CJS | Both | Both | ESM native |

> Node 24 is the stable workhorse. Bun is the speed demon. Deno is the TypeScript-native secure runtime. Your VPS uses Node 24 via mise.
