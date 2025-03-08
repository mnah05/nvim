return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "hrsh7th/cmp-nvim-lsp" }, -- Ensure cmp-nvim-lsp is installed
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp") -- Ensure it loads properly
			local capabilities = cmp_nvim_lsp.default_capabilities()
			local lspconfig = require("lspconfig")

			-- TypeScript & JavaScript (Node.js)
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			-- C/C++
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			-- HTML
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			-- Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- Python
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			-- Keybindings for LSP
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart Rename" })
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp", -- Add cmp-nvim-lsp to ensure it's available
		lazy = true,
	},
}
