---
title: NeoVim
category: cli
docs_url: https://neovim.io/doc/user/
created: "2026-07-28"
tags: [neovim, editor, vim, lua, productivity]
---

# NeoVim Cheatsheet

> Hyperextensible Vim-based text editor. Lua configuration, built-in LSP, treesitter, async I/O.

**Official Docs:** https://neovim.io/doc/user/  
**GitHub:** https://github.com/neovim/neovim  
**Version:** 0.10.x (stable)

---

## Installation

### macOS
```bash
brew install neovim
```

### Linux (AppImage)
```bash
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
```

### Linux (package managers)
```bash
# Debian/Ubuntu
sudo apt install neovim

# Fedora
sudo dnf install neovim

# Arch
sudo pacman -S neovim

# Alpine
apk add neovim
```

### Windows
```powershell
scoop install neovim
# or
choco install neovim
```

### From source
```bash
git clone https://github.com/neovim/neovim.git
cd neovim && make CMAKE_BUILD_TYPE=Release && sudo make install
```

---

## Setup

### Config location
```bash
~/.config/nvim/
├── init.lua          # Main config file (Lua)
├── lua/
│   └── plugins/      # Plugin specs (lazy.nvim / packer)
├── after/
│   └── ftplugin/     # Filetype-specific
└── lazy-lock.json    # Lockfile (lazy.nvim)
```

Legacy: `~/.vimrc` / `~/.config/nvim/init.vim` (Vimscript) still works.

### Quick init.lua
```lua
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.termguicolors = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Add plugins here
  { "folke/tokyonight.nvim", config = function() vim.cmd.colorscheme("tokyonight") end },
})
```

---

## Command Reference

### Starting / Exiting
| Command | Action |
|---------|--------|
| `nvim file` | Open file |
| `nvim -d file1 file2` | Diff mode |
| `:q` / `:q!` | Quit / quit without saving |
| `:w` | Save |
| `:wq` / `ZZ` | Save and quit |
| `:x` | Save and quit (only if changed) |
| `:enew` | New buffer |
| `:e file` | Edit file |

### Navigation (Vim basics)
| Command | Action |
|---------|--------|
| `h j k l` | Left / down / up / right |
| `w / b / e` | Word forward / back / end |
| `0 / ^ / $` | Start of line / first non-blank / end |
| `gg / G` | Top / bottom of file |
| `ngg / nG` | Go to line n |
| `Ctrl+d / Ctrl+u` | Half page down / up |
| `Ctrl+f / Ctrl+b` | Full page down / up |
| `%` | Matching bracket |
| `* / #` | Search word under cursor forward / back |
| `n / N` | Next / prev search result |

### Modes
| Command | Action |
|---------|--------|
| `i / a` | Insert before / after cursor |
| `I / A` | Insert at start / end of line |
| `o / O` | Open line below / above |
| `v / V` | Visual char / line mode |
| `Ctrl+v` | Visual block mode |
| `Esc / Ctrl+[` | Normal mode |
| `:` | Command-line mode |

### Editing
| Command | Action |
|---------|--------|
| `x / dd` | Delete char / line |
| `yy / p / P` | Yank / paste after / before |
| `ciw / ci" / ci(` | Change inside word / quotes / parens |
| `diw / di" / di(` | Delete inside word / quotes / parens |
| `u / Ctrl+r` | Undo / redo |
| `.` | Repeat last action |
| `>> / <<` | Indent / unindent |
| `=G` | Auto-indent to end of file |

### Buffers / Windows / Tabs
| Command | Action |
|---------|--------|
| `:ls` | List buffers |
| `:b n` | Switch to buffer n |
| `:bn / :bp` | Next / prev buffer |
| `:bd` | Delete buffer |
| `:sp file` | Horizontal split |
| `:vsp file` | Vertical split |
| `Ctrl+w h/j/k/l` | Navigate splits |
| `Ctrl+w c` | Close split |
| `Ctrl+w o` | Only this split |
| `:tabnew file` | New tab |
| `gt / gT` | Next / prev tab |
| `ngt` | Go to tab n |

### Search & Replace
| Command | Action |
|---------|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `:s/old/new/` | Replace first on line |
| `:s/old/new/g` | Replace all on line |
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace all with confirm |

### LSP (built-in)
| Command | Action |
|---------|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `Ctrl+o` | Jump back |
| `Ctrl+i` | Jump forward |
| `:lua vim.lsp.buf.code_action()` | Code action |
| `:lua vim.lsp.buf.rename()` | Rename symbol |
| `:lua vim.diagnostic.goto_next()` | Next diagnostic |
| `:lua vim.diagnostic.open_float()` | Show diagnostic |

### Treesitter (built-in)
| Command | Action |
|---------|--------|
| `:TSInstall lang` | Install parser |
| `:TSUpdate` | Update parsers |
| `:TSUninstall lang` | Remove parser |

### Terminal
| Command | Action |
|---------|--------|
| `:term` | Open terminal in split |
| `Ctrl+\ Ctrl+n` | Normal mode in terminal |
| `:lua vim.cmd.term()` | Programmatic terminal |

---

## Configuration (Lua)

### Options
```lua
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"
```

### Keymaps
```lua
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)           -- Open netrw
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")            -- Move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")            -- Move line up
```

### Autocommands
```lua
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 }) end,
})
```

---

## Tips

- Use `nvim --clean` to start without config/plugins for debugging.
- `:checkhealth` — diagnose config, providers, LSP, treesitter status.
- Built-in `:help` is comprehensive — `:h lua-guide`, `:h lsp`, `:h treesitter`.
- `vim.fn.stdpath("config")` returns config directory path in Lua.
- Neovim ships with `vim.lsp` and `vim.treesitter` — no plugins required for basics.
- For a full featured setup, consider [LazyVim](https://www.lazyvim.org/) or [NvChad](https://nvchad.com/).

---
*Generated via cheatsheet skill on 2026-07-28*
