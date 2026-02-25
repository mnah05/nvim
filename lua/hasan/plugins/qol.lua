return {
	-- Which-key: shows keybinding hints as you type
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup({
				delay = 500,
			})
		end,
	},

	-- Gitsigns: git decorations (added/removed lines, blame, etc.)
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
		end,
	},

	-- Indent-blankline: show indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		main = "ibl",
		config = function()
			require("ibl").setup({
				indent = { char = "│" },
				scope = { enabled = true },
			})
		end,
	},

	-- Todo-comments: highlight TODO, FIXME, etc.
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("todo-comments").setup()
		end,
	},

	-- Bufferline: nice tab-like buffer line
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					diagnostics = "nvim_lsp",
					always_show_bufferline = false,
				},
			})
		end,
	},

	-- Mini.pairs: smarter auto-pairs (alternative to nvim-autopairs)
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function()
			require("mini.pairs").setup()
		end,
	},

	-- Mini.surround: surround text objects (ys, ds, cs)
	{
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup()
		end,
	},

	-- Mini.comment: smarter commenting (gc motion)
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		config = function()
			require("mini.comment").setup()
		end,
	},

	-- Flash: enhanced search and jump
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		config = function()
			require("flash").setup()
		end,
	},

	-- Smooth cursor
	{
		"gen740/SmoothCursor.nvim",
		event = "VeryLazy",
		config = function()
			require("smoothcursor").setup()
		end,
	},

	-- Colorizer: highlight hex/rgb colors
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("colorizer").setup({
				"*",
			}, {
				RGB = true,
				RRGGBB = true,
				names = false,
				RRGGBBAA = true,
			})
		end,
	},

	-- Noice: better UI for cmdline, notifications, etc.
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
					},
				},
				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
				},
			})
		end,
	},

	-- Nvim-notify: better notification UI
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				timeout = 3000,
				max_height = function()
					return math.floor(vim.o.lines * 0.75)
				end,
				max_width = function()
					return math.floor(vim.o.columns * 0.75)
				end,
			})
			vim.notify = require("notify")
		end,
	},

	-- Harpoon: quick file navigation
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()
		end,
	},
}
