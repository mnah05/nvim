return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup{
			ensure_installed = {  "html","css","c", "cpp", "javascript", "typescript", "python", "lua", "java" },
			auto_install = true,
			highlight = {
				enable = true
			}
		}
	end
}
