---
title: LazyVim
category: cli
docs_url: https://www.lazyvim.org/
created: "2026-07-28"
tags: [neovim, editor, vim, lazyvim, productivity]
---

# LazyVim Cheatsheet

> Neovim config built on lazy.nvim plugin manager. Modular, batteries-included IDE experience.

**Official Docs:** https://www.lazyvim.org/  
**GitHub:** https://github.com/LazyVim/LazyVim  
**Prerequisite:** Neovim >= 0.9.0

---

## Installation

### Prerequisites
```bash
# Neovim
brew install neovim        # macOS
sudo apt install neovim    # Debian/Ubuntu
sudo pacman -S neovim      # Arch

# Optional but recommended
brew install ripgrep fd    # macOS
sudo apt install ripgrep fd-find  # Debian/Ubuntu
```

### Install LazyVim
```bash
# Backup existing config
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Clone starter
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Start nvim — plugins auto-install
nvim
```

### Verify
```bash
nvim --version
# Should show 0.9+ and LazyVim loads on first run
```

---

## Configuration

### Config location
```bash
~/.config/nvim/
├── init.lua                    # Entry point
├── lazyvim.json                # LazyVim settings
├── lua/
│   ├── config/
│   │   ├── keymaps.lua         # Custom keymaps
│   │   ├── options.lua         # Vim options
│   │   ├── autocmds.lua        # Autocommands
│   │   └── lazy.lua            # Plugin loader bootstrap
│   └── plugins/
│       ├── example.lua         # Starter template
│       └── custom.lua          # Your plugin specs
```

### Example plugin spec
```lua
-- lua/plugins/custom.lua
return {
  -- Override colorscheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Add telescope extension
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = { layout_strategy = "horizontal" },
    },
  },

  -- Disable a default plugin
  { "folke/flash.nvim", enabled = false },

  -- Add new plugin
  { "tpope/vim-surround", event = "VeryLazy" },
}
```

---

## Command Reference

### Leader keys
| Key | Action |
|-----|--------|
| `<leader>` | `Space` (default) |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep (Telescope) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Find help tags |
| `<leader>e` | Toggle file explorer (Neo-tree) |
| `<leader>c` | Code actions / LSP |
| `<leader>g` | Git commands |
| `<leader>u` | UI/UX toggles |
| `<leader>x` | Diagnostics / Trouble |
| `<leader>q` | Quit |
| `<leader>w` | Save |

### File Explorer (Neo-tree)
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle explorer |
| `a` | Add file/folder |
| `d` | Delete |
| `r` | Rename |
| `m` | Move |
| `c` | Copy |
| `y` | Yank path |
| `s` / `S` | Open in split / vsplit |
| `q` | Close |

### Telescope
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fr` | Recent files |
| `<leader>fd` | Document symbols |
| `<leader>fD` | Workspace symbols |

### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References |
| `gi` | Implementation |
| `K` | Hover |
| `<leader>ca` | Code action |
| `<leader>cr` | Rename |
| `<leader>cf` | Format |
| `<leader>cd` | Line diagnostic |

### Git (gitsigns / fugitive)
| Key | Action |
|-----|--------|
| `]h` / `[h` | Next / prev hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>gd` | Diff view |
| `<leader>gg` | LazyGit float |

### Window / Buffer
| Key | Action |
|-----|--------|
| `<leader>bd` | Delete buffer |
| `<leader>bb` | Switch buffer |
| `<leader>bo` | Close other buffers |
| `<leader>-` | Horizonal split |
| `<leader>\|` | Vertical split |
| `<leader>wd` | Close window |

### UI Toggles
| Key | Action |
|-----|--------|
| `<leader>un` | Toggle line numbers |
| `<leader>ur` | Toggle relativenumber |
| `<leader>uw` | Toggle wrap |
| `<leader>us` | Toggle spell |
| `<leader>uc` | Toggle conceal |
| `<leader>uh` | Toggle inlay hints |
| `<leader>ut` | Toggle treesitter highlight |

### Lazy.nvim UI
| Key | Action |
|-----|--------|
| `:Lazy` | Plugin manager UI |
| `:Lazy sync` | Sync all plugins |
| `:Lazy update` | Update plugins |
| `:Lazy clean` | Clean unused plugins |
| `:Lazy profile` | Profile startup time |

### Mason (LSP/DAP/linters)
| Key | Action |
|-----|--------|
| `:Mason` | Open package manager |
| `:MasonInstall pkg` | Install package |
| `:MasonUninstall pkg` | Uninstall |
| `:MasonUpdate` | Update all |

### Which-key (key hints)
| Key | Action |
|-----|--------|
| `<leader>` | Wait — popup shows available keys |
| Press partial key | Which-key updates dynamically |

---

## Tips

- **First run:** LazyVim downloads ~50+ plugins automatically. Be patient.
- **Health check:** Run `:checkhealth lazy` and `:checkhealth mason` after install.
- **Updating:** `:Lazy sync` pulls latest plugin commits; `Lazy update` upgrades.
- **Extras:** LazyVim has "extras" — language-specific plugin bundles. Enable in `lua/plugins/extras.lua` or via `:LazyExtras`.
- **No init.vim:** LazyVim is pure Lua. All config in `lua/config/` and `lua/plugins/`.
- **Mason handles LSPs/linters:** Don't install `pyright`, `eslint` globally — use `:MasonInstall pyright`.

---
*Generated via cheatsheet skill on 2026-07-28*
