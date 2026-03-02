return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = "williamboman/mason.nvim",
		opts = {
			ensure_installed = { "lua_ls", "ts_ls", "pyright", "clangd", "gopls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local caps = require("blink.cmp").get_lsp_capabilities()
			local servers = { "lua_ls", "ts_ls", "pyright", "clangd", "gopls" }

			for _, srv in ipairs(servers) do
				local opts = { capabilities = caps }
				if srv == "lua_ls" then
					opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
				end
				vim.lsp.config(srv, opts)
			end
			vim.lsp.enable(servers)

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
			})
		end,
	},
}
