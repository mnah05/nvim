return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "lua", "python", "go", "javascript", "typescript", "c", "cpp", "rust" },
		highlight = { enable = true },
		auto_install = true,
	},
	config = function(_, opts)
		require("nvim-treesitter.config").setup(opts)
	end,
}
