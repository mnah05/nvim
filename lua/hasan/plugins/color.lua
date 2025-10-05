return {
	"rebelot/kanagawa.nvim",
	config = function(_, opts)
		require("kanagawa").setup(opts)
		vim.cmd.colorscheme("kanagawa")
	end,
}
