-- in your plugin list (e.g. plugins.lua)
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false, -- or true + proper event if you want lazy-loading
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "python", "go" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
