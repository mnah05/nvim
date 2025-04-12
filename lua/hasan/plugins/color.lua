return {
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local lackluster = require("lackluster")
			lackluster.setup({
				-- Gorgoroth-inspired dark aesthetic
				tweak_background = {
					normal = "#000000", -- Deep black
					telescope = "#111111", -- Slight raise for contrast
					menu = "#1a1a1a", -- Slightly lighter for visibility
					popup = "#000000", -- Stay consistent
				},
				tweak_syntax = {
					comment = "#333333", -- Dim grey for subtle comments
					string = "#9b8d7f", -- Desaturated brown-green
					keyword = "#5f8787", -- Cold steel blue-green
					function_name = "#888888", -- Faded steel
					variable = "#aaaaaa", -- Near white for clarity
					constant = "#8c7f70", -- Washed-out yellow-brown
					operator = "#999999", -- Mid grey
				},
				tweak_ui = {
					line_numbers = "#333333", -- Match brightBlack
					cursor_line = "#111111", -- Very slight highlight
					selection = "#1f1f1f", -- Soft selection background
					status_line = "#1a1a1a", -- Muted and clean
				},
				italics = true, -- Keep some flair
				contrast = "low", -- Lowered for that black metal feel
			})

			vim.cmd.colorscheme("lackluster")
		end,
	},
}
