return {
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local lackluster = require("lackluster")
			lackluster.setup({
				-- Customize backgrounds with dark tones
				tweak_background = {
					normal = "#1a1b26", -- Dark background with slight blue tint
					telescope = "#16161e", -- Slightly darker for contrast
					menu = "#1f2335", -- Darker blue shade
					popup = "#1a1b26", -- Match editor background
				},
				-- Enhanced syntax highlighting
				tweak_syntax = {
					comment = "#565f89", -- Muted blue for comments
					string = "#9ece6a", -- Vibrant green for strings
					keyword = "#bb9af7", -- Purple for keywords
					function_name = "#7aa2f7", -- Bright blue for functions
					variable = "#c0caf5", -- Light blue for variables
					constant = "#ff9e64", -- Orange for constants
					operator = "#89ddff", -- Light blue for operators
				},
				-- UI elements styling
				tweak_ui = {
					line_numbers = "#3b4261", -- Subdued color for line numbers
					cursor_line = "#292e42", -- Subtle highlight for current line
					selection = "#2e3c64", -- Blue-tinted selection
					status_line = "#1f2335", -- Dark status line
				},
				-- Enhance with italics for certain elements
				italics = true,
				-- Medium contrast for balance
				contrast = "medium",
			})

			-- Apply the colorscheme
			vim.cmd.colorscheme("lackluster")
		end,
	},
}
