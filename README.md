# Neovim Config

A minimal, cross-platform Neovim setup for TypeScript/JavaScript, Go, Python, C/C++, Rust, SQL, and Lua. It uses native LSP, Mason, Treesitter, Blink completion, Conform formatting, and lazy.nvim.

## Automatic setup

On first start, lazy.nvim installs plugins. Mason then installs the configured language servers and formatter tools it can manage. Use `:MasonToolsInstall` to retry immediately or `:Mason` to inspect status.

The configuration deliberately does not install operating-system dependencies: language runtimes, compilers, database drivers, Git, `fd`, or `ripgrep` must be installed once on each machine.

## Requirements

- Neovim 0.12+
- Git
- `fd` for Snacks Explorer
- `ripgrep` for live grep
- A Nerd Font is recommended for icons

Install the language runtime only for languages you use:

| Language | Runtime/toolchain | LSP | Formatter |
|---|---|---|---|
| TypeScript / JavaScript | Node.js LTS | `ts_ls` | Prettier |
| Python | Python 3 | Pyright | Black |
| Go | Go | gopls | gofumpt |
| C / C++ | LLVM/clangd | clangd | clang-format |
| Rust | Rustup | rust-analyzer | rustfmt |
| SQL | Database CLI/driver only when using Dadbod | sqlls | sqlfmt |
| Lua | — | — | Stylua |

For Rust, also run `rustup component add rustfmt`.

### Example prerequisite installs

macOS (Homebrew):

```sh
brew install neovim git fd ripgrep node python go rustup llvm
rustup default stable
rustup component add rustfmt
```

Ubuntu/Debian:

```sh
sudo apt install neovim git fd-find ripgrep nodejs npm python3 golang rustup clangd clang-format
rustup default stable
rustup component add rustfmt
```

Windows (PowerShell with winget):

```powershell
winget install Neovim.Neovim Git.Git sharkdp.fd BurntSushi.ripgrep.MSVC OpenJS.NodeJS.LTS Python.Python.3.13 GoLang.Go Rustlang.Rustup LLVM.LLVM
rustup default stable
rustup component add rustfmt
```

Ensure these programs are on `PATH`. Debian-based systems commonly expose `fd` as `fdfind`; make it available as `fd` before using Snacks Explorer.

## Installation

Clone this repository to Neovim's standard configuration directory, then start Neovim.

| Platform | Configuration directory |
|---|---|
| Linux / macOS | `~/.config/nvim` |
| Windows | `%LOCALAPPDATA%\nvim` |

```sh
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
nvim
```

On Windows, use `$env:LOCALAPPDATA\nvim` as the clone target from PowerShell. The first launch may take a few minutes while plugins and Mason tools install.

## Features

- LSP completion, hover, rename, definitions, implementations, symbols, code actions, and diagnostics.
- Format-on-save with an explicitly selected formatter per filetype.
- Treesitter highlighting and indentation.
- Project explorer, editable filesystem browser, file finder, and project grep.
- Git signs, Lazygit, Diffview, sessions, Markdown rendering, comments, pairs, surrounds, and Flash motions.
- Dadbod UI for database connections and interactive SQL queries.
- An ASCII-tree dashboard with quick actions and recent files.

## Keybindings

`<leader>` is <kbd>Space</kbd>. which-key shows available leader mappings as you type.

### General

| Key | Mode | Action |
|---|---|---|
| `jk` | insert, visual | Escape to normal mode |
| `<leader>w` | normal | Save |
| `<leader>q` | normal | Quit current window |
| `<leader>bd` | normal | Delete current buffer |
| `<Tab>` / `<S-Tab>` | normal | Next / previous buffer |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | normal | Focus left, down, up, right window |

### Files, search, and dashboard

| Key | Mode | Action |
|---|---|---|
| `-` | normal | Open Oil filesystem browser |
| `<leader>fe` | normal | Open Snacks project explorer |
| `<leader>f` | normal | Find files |
| `<leader>s` | normal | Live grep |
| `<leader>b` | normal | List buffers |
| `<leader>u` | normal | Open dashboard |

In Snacks Explorer: `<CR>`/`l` opens, `h` closes a directory, `a` adds, `r` renames, `d` deletes, `u` refreshes, `H` toggles hidden files, and `I` toggles ignored files.

### LSP and diagnostics

These buffer-local mappings appear when an LSP attaches.

| Key | Action |
|---|---|
| `gd` / `gD` | Definition / declaration |
| `gi` / `gr` | Implementation / references |
| `K` | Hover documentation |
| `<leader>ca` / `<leader>rn` | Code action / rename symbol |
| `<leader>ds` / `<leader>ws` | Document / workspace symbols |
| `<leader>lm` | Mason UI |
| `]d` / `[d` | Next / previous diagnostic |
| `<leader>e` | Diagnostic popup under cursor |
| `<leader>dl` | Put diagnostics in location list |

### Formatting, Git, SQL, and sessions

| Key | Action |
|---|---|
| `<leader>cf` | Format current buffer |
| `<leader>gg` | Open Lazygit |
| `<leader>gd` / `<leader>gD` | Open / close Diffview |
| `<leader>gh` | File history in Diffview |
| `<leader>du` | Toggle Dadbod database UI |
| `<leader>ls` / `<leader>lS` | Restore last / directory session |
| `<leader>n` | Notification history |
| `<leader>z` | Zen mode |

Use `:DBUIAddConnection` to add a connection. Keep credentials outside this repository; Dadbod accepts environment-variable based connection URLs.

### Editing motions

| Key | Mode | Action |
|---|---|---|
| `s` | normal, visual, operator-pending | Flash jump |
| `S` | normal, visual, operator-pending | Flash Treesitter jump |
| `r` | operator-pending | Remote Flash |
| `R` | operator-pending, visual | Flash Treesitter search |
| `<C-s>` | command line | Toggle Flash search |
| `gcc`, `gc{motion}` | normal, visual | Toggle comments |

## Maintenance

- `:Lazy` manages plugins; `:Lazy update` updates them and changes `lazy-lock.json`.
- `:Mason` manages language servers and tools.
- `:MasonToolsInstall` installs missing formatter tools now.
- `:checkhealth` diagnoses Neovim and external-tool issues.
- `:ConformInfo` shows the formatter selected for the current buffer.

On Unix, `make check` verifies startup and runs Stylua when available. On every platform, `nvim --headless -i NONE '+qa'` runs a basic startup check.
