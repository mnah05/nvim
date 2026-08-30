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
			ensure_installed = { "ts_ls", "pyright", "clangd", "gopls", "rust_analyzer", "sqlls" },
			automatic_enable = false,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = "VeryLazy",
		dependencies = "williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"prettier",
				"clang-format",
				"stylua",
				{ "black", condition = function() return vim.fn.executable("python3") == 1 or vim.fn.executable("python") == 1 end },
				{ "gofumpt", condition = function() return vim.fn.executable("go") == 1 end },
				{ "sqlfmt", condition = function() return vim.fn.executable("python3") == 1 or vim.fn.executable("python") == 1 end },
			},
			start_delay = 3000,
			debounce_hours = 5,
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
				clangd = { capabilities = caps, cmd = { "clangd", "--background-index" } },
				gopls = {
					capabilities = caps,
					settings = {
						gopls = {
							analyses = { shadow = true, unusedparams = true, unusedwrite = true },
							gofumpt = true,
							staticcheck = true,
						},
					},
				},
				rust_analyzer = { capabilities = caps },
				sqlls = { capabilities = caps },
			}

			local bins = {
				ts_ls = "typescript-language-server",
				pyright = "pyright",
				clangd = "clangd",
				gopls = "gopls",
				rust_analyzer = "rust-analyzer",
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
				virtual_text = { prefix = "●", source = "if_many", spacing = 2 },
				signs = true,
				underline = true,
				severity_sort = true,
				update_in_insert = false,
			})
		end,
	},
}
