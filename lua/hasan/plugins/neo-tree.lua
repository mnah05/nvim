return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
		{ "<leader>fe", "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
	},
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
			},
		},
		window = {
			width = 30,
			mappings = {
				["<space>"] = "toggle_node",
				["<cr>"] = "open",
			},
		},
	},
}
