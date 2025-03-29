return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = { char = "▏" }, -- You can change this character
		scope = { enabled = true }, -- Highlights the current scope
		exclude = { filetypes = { "help", "dashboard", "lazy", "NvimTree", "oil" } },
	},
}
