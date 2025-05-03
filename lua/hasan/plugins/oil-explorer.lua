return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- Optional, but adds nice icons
	},
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = false, -- Keep the UI clean by default
		},
	},
	config = function(_, opts)
		local oil = require("oil")
		oil.setup(opts)

		-- Simple keymap to open Oil
		vim.keymap.set("n", "-", oil.open, { desc = "Open Oil file explorer" })
	end,
}
