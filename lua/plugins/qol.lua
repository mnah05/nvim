return {
	-- Snacks: a battery of QoL features (dashboard, notifier, smooth scroll, …)
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			dashboard = {
				enabled = true,
				width = 48,
				preset = {
					header = [[
                 *
                /\\
               /\\/\\
              /      \\
             /  /\\    \\
            /__/  \\____\\
                ||||
                ||||]],
					keys = {
						{ icon = " ", key = "f", desc = "Files", action = ":lua Snacks.dashboard.pick('files')" },
						{ icon = " ", key = "g", desc = "Grep", action = ":lua Snacks.dashboard.pick('live_grep')" },
						{ icon = " ", key = "r", desc = "Recent", action = ":lua Snacks.dashboard.pick('oldfiles')" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
				sections = {
					{ section = "header", padding = 1 },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "recent_files", title = "Recent", limit = 5, indent = 2, padding = 1 },
				},
			},
			explorer = { enabled = true },
			picker = { enabled = true },
			input = { enabled = true },
			lazygit = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			scroll = { enabled = true },
			words = {
				enabled = true,
				lsp = {
					enabled = true,
					client = "ts_ls",
				},
			},
		},
		keys = {
			{
				"<leader>fe",
				function()
					Snacks.explorer()
				end,
				desc = "File explorer",
			},
			{
				"<leader>u",
				function()
					Snacks.dashboard.open()
				end,
				desc = "Dashboard",
			},
			{
				"<leader>n",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification history",
			},
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "Zen mode",
			},
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
		},
	},

	-- Auto-save/restore sessions per directory
	{
		"folke/persistence.nvim",
		event = "VimEnter",
		opts = {},
		keys = {
			{
				"<leader>ls",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "Reload last session",
			},
			{
				"<leader>lS",
				function()
					require("persistence").load()
				end,
				desc = "Reload session for dir",
			},
		},
	},

	-- Colorize hex literals in your code
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			filetypes = { "*", "!markdown" },
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = true,
			},
		},
	},

	-- Side-by-side git diff
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
		keys = {
			{
				"<leader>gd",
				function()
					require("diffview").open()
				end,
				desc = "Diffview open",
			},
			{
				"<leader>gD",
				function()
					require("diffview").close()
				end,
				desc = "Diffview close",
			},
			{
				"<leader>gh",
				function()
					require("diffview").file_history()
				end,
				desc = "Diffview file history",
			},
		},
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true,
				view = {
					default = { layout = "diff2_horizontal" },
				},
			})
		end,
	},

	-- Database explorer and query runner. Configure connections through vim.g.dbs.
	{
		"kristijanhusak/vim-dadbod-ui",
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection" },
		dependencies = { "tpope/vim-dadbod" },
		keys = {
			{ "<leader>du", "<cmd>DBUIToggle<cr>", desc = "Database UI" },
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_win_position = "left"
			vim.g.db_ui_winwidth = 40
		end,
	},
}
