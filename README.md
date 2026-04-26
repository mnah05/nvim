# Neovim Config

A modern, minimal Neovim configuration built with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Features

- **File Explorer**: [oil.nvim](https://github.com/stevearc/oil.nvim) — edit filesystem like a buffer
- **Fuzzy Finder**: [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) with fzf-native
- **LSP**: Native Neovim LSP with [mason](https://github.com/williamboman/mason.nvim) for easy server management
- **Completion**: [blink.cmp](https://github.com/Saghen/blink.cmp) — fast, minimal completion
- **Formatting**: [conform.nvim](https://github.com/stevearc/conform.nvim) with format-on-save
- **Syntax**: [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) highlighting and indentation
- **Git**: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) for diff signs in gutter
- **Editing**: mini.pairs, mini.surround, mini.comment for enhanced editing
- **Utilities**: which-key for keybinding hints, indent-blankline for indent guides, todo-comments for highlighting TODO/FIXME/NOTE

## Requirements

- Neovim >= 0.12
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- Optional: `ripgrep` (for telescope live_grep)

## Installation

```bash
# Backup your existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this repo
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim

# Start Neovim (plugins will auto-install)
nvim
```

## LSP Servers & Formatters

The following are auto-configured:

| Language | LSP Server | Formatter |
|----------|-----------|-----------|
| Lua | `lua_ls` | `stylua` |
| Python | `pyright` | `black` |
| JavaScript/TypeScript | `ts_ls` | `prettier` |
| C/C++ | `clangd` | `clang-format` |
| Go | `gopls` | `gofumpt` |

Install formatters via Mason or your system package manager:
```vim
:MasonInstall stylua black prettier clang-format gofumpt
```

## Keymaps

### General

| Key | Action |
|-----|--------|
| `jk` | Exit insert/visual mode |
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<Tab>` / `<S-Tab>` | Next/previous buffer |
| `<leader>bd` | Close buffer |
| `-` | Open file explorer (oil.nvim) |

### Window Navigation

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move between windows |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Show references |
| `K` | Hover documentation |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `]d` / `[d` | Next/previous diagnostic |
| `<leader>cf` | Format buffer |

### Telescope

| Key | Action |
|-----|--------|
| `<leader>f` | Find files |
| `<leader>s` | Live grep |
| `<leader>b` | List buffers |

## Structure

```
~/.config/nvim/
├── init.lua           -- Entry point
├── lua/
│   ├── core/
│   │   ├── options.lua   -- Editor options
│   │   ├── keymaps.lua   -- Key bindings
│   │   └── lazy.lua      -- Plugin manager setup
│   └── plugins/
│       ├── ui.lua        -- Colorscheme, statusline, explorer, telescope
│       ├── coding.lua    -- Treesitter, completion, formatting, git
│       └── lsp.lua       -- LSP configuration
└── lazy-lock.json     -- Plugin lockfile
```

## Customization

Edit files in `lua/` to customize:

- `lua/core/options.lua` — Editor settings
- `lua/core/keymaps.lua` — Key bindings
- `lua/plugins/*.lua` — Plugin configurations

## License

MIT
