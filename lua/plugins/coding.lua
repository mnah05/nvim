-- Parsers to install. Kept at module scope so `build` (runs once, on install)
-- can use them. Installing from `config` would re-run on every BufReadPre.
local parsers = {
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
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter").install(parsers)
		end,
		event = { "BufReadPre", "BufNewFile" },
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
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
			keymap = { preset = "default" },
			appearance = { nerd_font_variant = "mono" },
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			signature = { enabled = true },
		},
	},

	-- mini.nvim is the single source for mini.* modules. The standalone
	-- mini.pairs / mini.surround repos ship the same `mini.pairs` module and
	-- shadow each other in 'runtimepath', so use the meta-plugin instead.
	{
		"echasnovski/mini.nvim",
		event = "InsertEnter",
		config = function()
			require("mini.pairs").setup()
			require("mini.surround").setup()
		end,
	},

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
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				bash = { "shellharden" },
				sh = { "shellharden" },
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				python = { "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				go = { "gofumpt" },
				rust = { "rustfmt" },
				sql = { "sqlfmt" },
				lua = { "stylua" },
			},
			default_format_opts = { lsp_format = "fallback" },
			format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
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
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
				end

				map("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, "Next hunk")
				map("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, "Previous hunk")
				map({ "n", "x" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
				map({ "n", "x" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
				map("n", "<leader>ghS", gitsigns.stage_buffer, "Stage buffer")
				map("n", "<leader>ghR", gitsigns.reset_buffer, "Reset buffer")
				map("n", "<leader>ghp", gitsigns.preview_hunk_inline, "Preview hunk")
				map("n", "<leader>ghb", function()
					gitsigns.blame_line({ full = true })
				end, "Blame line")
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Git hunk")
			end,
		},
	},
}
