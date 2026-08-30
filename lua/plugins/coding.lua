return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
					"typescript",
					"tsx",
					"javascript",
					"python",
					"c",
					"cpp",
					"go",
					"rust",
					"sql",
					"markdown",
					"markdown_inline",
					"json",
					"yaml",
					"bash",
					"comment",
				},
			})
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					if pcall(vim.treesitter.start, args.buf) then
						vim.bo[args.buf].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
					end
				end,
			})
		end,
	},

	-- Completion
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = "InsertEnter",
		opts = {
			keymap = { preset = "default" },
			appearance = { nerd_font_variant = "mono" },
			sources = { default = { "lsp", "path", "buffer" } },
			signature = { enabled = true },
		},
	},

	{ "echasnovski/mini.pairs", event = "InsertEnter", opts = {} },
	{ "echasnovski/mini.surround", opts = {} },
	{ "echasnovski/mini.comment", opts = {} },

	-- Formatting
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format()
				end,
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				python = { "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				go = { "gofumpt" },
				rust = { "rustfmt" },
				sql = { "sqlfmt" },
				lua = { "stylua" },
			},
			default_format_opts = { lsp_format = "never" },
			format_on_save = { timeout_ms = 1000, lsp_format = "never" },
			notify_on_error = true,
		},
	},

	-- Git signs
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
			},
		},
	},
}
