return {
	-- Colorscheme: Catppuccin Mocha - warm, easy on eyes, great contrast
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				integrations = {
					telescope = true,
					gitsigns = true,
					nvimtree = false,
					mason = true,
					which_key = true,
					blink_cmp = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = { theme = "catppuccin", icons_enabled = true },
			})
		end,
	},

	-- File explorer
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({ default_file_explorer = true })
			vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open Oil" })
		end,
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					prompt_prefix = " ",
					selection_caret = "> ",
					layout_config = { width = 0.9, height = 0.8 },
				},
			})
			pcall(telescope.load_extension, "fzf")

			local keymap = vim.keymap
			keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
			keymap.set("n", "<leader>ss", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
			keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
		end,
	},
}
