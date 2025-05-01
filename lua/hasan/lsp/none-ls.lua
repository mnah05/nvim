return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "html", "css", "javascript", "json" },
				}),
				null_ls.builtins.formatting.stylua.with({
					extra_args = { "--style={IndentWidth: 4, UseTab: Always}" },
				}),
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "--style=LLVM" },
				}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
