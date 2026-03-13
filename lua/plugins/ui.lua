return {
	-- Colorscheme: Everforest — soothing green-tinted dark theme
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_background = "medium"
			vim.g.everforest_better_performance = 1
			vim.g.everforest_enable_italic = 1
			vim.cmd.colorscheme("kanagawa")
		end,
	},

	-- Minimal statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				theme = "auto",
				component_separators = "",
				section_separators = "",
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},

	-- File explorer
	{
		"stevearc/oil.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = { default_file_explorer = true },
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		opts = {
			defaults = {
				prompt_prefix = "> ",
				selection_caret = "> ",
				layout_config = { width = 0.8, height = 0.8 },
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			pcall(require("telescope").load_extension, "fzf")
		end,
	},

	-- Which-key: shows pending keybindings in a popup
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			indent = { char = "│" },
			scope = { enabled = true },
		},
	},

	-- Highlight TODO/FIXME/NOTE comments
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = "nvim-lua/plenary.nvim",
		opts = {},
	},
}
