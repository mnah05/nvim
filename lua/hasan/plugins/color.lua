return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			integrations = {
				telescope = true,
				nvimtree = true,
				which_key = true,
				dashboard = true,
				mason = true,
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
