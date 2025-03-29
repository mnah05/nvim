return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional for file icons
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30, -- Set tree width
				side = "left", -- Open on the left
			},
			git = { enable = true }, -- Show Git status
			renderer = {
				highlight_git = true,
				icons = { show = { git = true } },
			},
			update_focused_file = { enable = true }, -- Focus file in tree when opened
		})
	end,
}
