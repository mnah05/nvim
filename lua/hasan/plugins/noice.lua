return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				view = "cmdline_popup", -- Opens a floating popup for command line
			},
		})
	end,
}
