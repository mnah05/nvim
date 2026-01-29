return {
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			-- Option is "hard", "medium" (default) or "soft"
			vim.g.everforest_background = "soft"
			vim.opt.background = "dark"
			-- For better performance
			vim.g.everforest_enable_italic = 1

			vim.cmd([[colorscheme everforest]])
		end,
	},
}
