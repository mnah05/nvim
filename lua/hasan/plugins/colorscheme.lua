return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false, -- Load it during startup
	priority = 1000, -- Ensure it loads before other UI-related plugins
	config = function()
		require("rose-pine").setup({
			disable_background = true, -- Enables transparency
		})
		vim.cmd.colorscheme("rose-pine") -- Alternative syntax
	end,
}
