return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = {
			{ "<leader>lm", "<cmd>Mason<cr>", desc = "LSP: manage servers" },
		},
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		dependencies = "williamboman/mason.nvim",
		opts = {
			ensure_installed = { "ts_ls", "pyright", "clangd", "gopls", "sqlls" },
			automatic_enable = false,
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local caps = require("blink.cmp").get_lsp_capabilities()

			local servers = {
				ts_ls = { capabilities = caps },
				pyright = { capabilities = caps },
				clangd = { capabilities = caps },
				gopls = { capabilities = caps },
				sqlls = { capabilities = caps },
			}

			local bins = {
				ts_ls = "typescript-language-server",
				pyright = "pyright",
				clangd = "clangd",
				gopls = "gopls",
				sqlls = "sql-language-server",
			}

			for srv, opts in pairs(servers) do
				vim.lsp.config(srv, opts)
			end

			local enabled = vim.tbl_filter(function(srv)
				return vim.fn.executable(bins[srv]) == 1
			end, vim.tbl_keys(servers))
			if #enabled > 0 then
				vim.lsp.enable(enabled)
			end

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
			})
		end,
	},
}
