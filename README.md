# Neovim Config

A minimal, production-ready Neovim configuration built with [lazy.nvim](https://github.com/folke/lazy.nvim)

## Target Languages

| Language | LSP Server | Formatter | Treesitter Parser |
|----------|-----------|-----------|-------------------|
| TypeScript / TSX | `ts_ls` | `prettier` | `typescript`, `tsx`, `javascript` |
| Python | `pyright` | `black` | `python` |
| C / C++ | `clangd` | `clang-format` | `c`, `cpp` |
| Go | `gopls` | `gofumpt` | `go` |
| SQL | `sqlls` | `sqlfmt` | `sql` |
| Lua | — | `stylua` | `lua` |

Only enabled LSP servers whose binary is on `PATH` (installed via Mason or system) are started —
no error spam for missing servers.

Install servers and formatters with Mason:

```
:MasonInstall ts_ls pyright clangd gopls sqlls
:MasonInstall prettier black clang-format gofumpt sqlfmt stylua
```

## Features

- **File Explorer**: [oil.nvim](https://github.com/stevearc/oil.nvim) — edit the filesystem like a buffer
- **Fuzzy Finder**: [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) with fzf-native
- **LSP**: Native Neovim LSP with [mason.nvim](https://github.com/williamboman/mason.nvim)
- **Completion**: [blink.cmp](https://github.com/Saghen/blink.cmp)
- **Formatting**: [conform.nvim](https://github.com/stevearc/conform.nvim) with format-on-save
- **Syntax**: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) highlighting + indentation
- **Git**: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- **Editing**: mini.pairs / mini.surround / mini.comment
- **Utilities**: which-key, indent-blankline, todo-comments, flash.nvim, render-markdown

## Requirements

- Neovim >= 0.12
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- Optional: `ripgrep` (for Telescope live_grep)

## Installation

```bash
mv ~/.config/nvim ~/.config/nvim.backup
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
nvim   # plugins auto-install; LSP servers boot on first idle
```

## Structure

```
~/.config/nvim/
├── init.lua
├── lazy-lock.json        -- pinned plugin versions
├── lua/
│   ├── core/
│   │   ├── options.lua    -- editor options
│   │   ├── keymaps.lua    -- core keybindings
│   │   └── lazy.lua       -- lazy.nvim bootstrap
│   └── plugins/
│       ├── lsp.lua        -- LSP, Mason, language servers
│       ├── coding.lua     -- treesitter, completion, formatting, git
│       └── ui.lua         -- colorscheme, statusline, explorer, telescope
```

## Keybindings

`<leader>` is <kbd>Space</kbd>.

### General

| Key | Mode | Action |
|-----|------|--------|
| `jk` | insert / visual | Exit to normal mode |
| `<leader>w` | normal | Save file |
| `<leader>q` | normal | Quit current Neovim instance |
| `<leader>bd` | normal | Close current buffer |
| `<Tab>` | normal | Next buffer |
| `<S-Tab>` | normal | Previous buffer |

### Window Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<C-h>` | normal | Focus window left |
| `<C-l>` | normal | Focus window right |
| `<C-j>` | normal | Focus window below |
| `<C-k>` | normal | Focus window above |

### File Explorer (oil.nvim)

| Key | Mode | Action |
|-----|------|--------|
| `-` | normal | Open file explorer (outside current file) |

Within an oil explorer buffer use `o` / `Enter` to open the directory/file you want.

### Telescope

| Key | Mode | Action |
|-----|------|--------|
| `<leader>f` | normal | Find files |
| `<leader>s` | normal | Live grep (requires `rg`) |
| `<leader>b` | normal | List open buffers |

### LSP *buffer-local, active when a language server attaches

| Key | Mode | Action |
|-----|------|--------|
| `gd` | normal | Go to definition |
| `gr` | normal | Show references |
| `K` | normal | Hover documentation |
| `<leader>ca` | normal | Code action |
| `<leader>rn` | normal | Incremental rename |
| `<leader>lm` | normal | Mason — manage language servers |
| `]d` | normal | Next diagnostic |
| `[d` | normal | Previous diagnostic |

### Formatting

| Key | Mode | Action |
|-----|------|--------|
| `<leader>cf` | normal | Format current buffer |

Format-on-save is enabled (`{ timeout_ms = 500, lsp_fallback = true }`).

### Diagnostics

| Key | Mode | Action |
|-----|------|--------|
| `]d` | normal | Jump to next diagnostic |
| `[d` | normal | Jump to previous diagnostic |

### Flash (motion)

| Key | Mode | Action |
|-----|------|--------|
| `s` | normal / visual / operator | Flash jump |
| `S` | normal / visual / operator | Flash to Treesitter node |
| `r` | operator | Remote flash |
| `R` | operator / visual | Treesitter search |
| `<C-s>` | command-line | Toggle flash search |

### Comment (mini.comment)

`mini.comment` provides `gcc` to (un)comment a line, `gc` motions, and operator-pending `gc`.