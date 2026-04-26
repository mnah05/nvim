return {
{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter").setup({})
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
		event = "BufWritePre",
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format()
				end,
				desc = "Format",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				go = { "gofumpt" },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
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
