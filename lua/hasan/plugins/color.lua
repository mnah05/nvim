return {
	"thesimonho/kanagawa-paper.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		theme = "kanagawa-paper-ink",
		transparent = false,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = false },
			functions = {},
			variables = {},
		},
	},
	config = function(_, opts)
		require("kanagawa-paper").setup(opts)
		vim.cmd("colorscheme kanagawa-paper")
	end,
}
