return {
	"folke/tokyonight.nvim",
	name = "tokyonight",
	config = function()
		require("tokyonight").setup({
			-- transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
