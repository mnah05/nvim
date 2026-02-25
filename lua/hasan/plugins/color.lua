return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night", -- "night", "storm", "day", "moon"
			transparent = false,
			terminal_colors = true,
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
