return {
	-- Must load eagerly (not on `cmd = "Mason"`): Mason.setup() is what prepends
	-- Mason's bin/ to $PATH, and the nvim-lspconfig spec below gates on
	-- vim.fn.executable() at BufReadPre time. Lazy-loading Mason on the command
	-- means the check runs first and vim.lsp.enable() is never called.
	{
		"williamboman/mason.nvim",
		lazy = false,
		priority = 1000,
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
			ensure_installed = {
				"ts_ls",
				"pyright",
				"clangd",
				"gopls",
				"rust_analyzer",
				"sqlls",
				"lua_ls",
				"jsonls",
				"yamlls",
				"bashls",
				"marksman",
			},
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
				"shellharden",
				{
					"black",
					condition = function()
						return vim.fn.executable("python3") == 1 or vim.fn.executable("python") == 1
					end,
				},
				{
					"gofumpt",
					condition = function()
						return vim.fn.executable("go") == 1
					end,
				},
				{
					"sqlfmt",
					condition = function()
						return vim.fn.executable("python3") == 1 or vim.fn.executable("python") == 1
					end,
				},
			},
			start_delay = 3000,
			debounce_hours = 5,
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
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
				lua_ls = {
					capabilities = caps,
					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
							workspace = { checkThirdParty = false },
						},
					},
				},
				jsonls = { capabilities = caps },
				yamlls = { capabilities = caps },
				bashls = { capabilities = caps },
				marksman = { capabilities = caps },
			}

			local bins = {
				ts_ls = "typescript-language-server",
				pyright = "pyright",
				clangd = "clangd",
				gopls = "gopls",
				rust_analyzer = "rust-analyzer",
				sqlls = "sql-language-server",
				lua_ls = "lua-language-server",
				jsonls = "vscode-json-language-server",
				yamlls = "yaml-language-server",
				bashls = "bash-language-server",
				marksman = "marksman",
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
