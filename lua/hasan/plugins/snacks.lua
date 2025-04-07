return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	init = function()
		opts = {
			bigfile = { enabled = true },
			indent = { enabled = true },
		}
	end,
}
