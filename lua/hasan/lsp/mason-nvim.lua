return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"ts_ls", -- TypeScript/JavaScript
				"pyright", -- Python
				"lua_ls", -- Lua
				"clangd", -- C/C++
				"gopls", -- Go
				"rust_analyzer", -- Rust
			},
			automatic_installation = true,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				-- Formatters
				"prettier", -- JS/TS
				"black", -- Python
				"stylua", -- Lua
				"clang-format", -- C/C++
				"gofumpt", -- Go
				-- "rustfmt",  -- Rust
			},
			run_on_start = true,
		},
	},
}
