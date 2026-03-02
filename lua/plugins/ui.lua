return {
	-- Lush-based colorscheme: zenbones (dark, minimal, easy on eyes)
	{
		"mcchrish/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.zenbones_darken_comments = 45
			vim.cmd.colorscheme("zenbones")
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
}
