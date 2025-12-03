return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			char = "│",
			highlight = "IblIndent",
		},
		scope = {
			enabled = true, -- this highlights the current indent scope (the “shining” line)
			show_start = true,
			show_end = false,
			highlight = "IblScope",
		},
	},
}
