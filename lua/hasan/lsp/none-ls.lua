return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- Prettier handles HTML, CSS, JavaScript, and JSON formatting.
					null_ls.builtins.formatting.prettier.with({
						filetypes = { "html", "css", "javascript", "json" },
					}),
					-- Stylua for Lua formatting.
					null_ls.builtins.formatting.stylua,
					-- Black for Python formatting.
					null_ls.builtins.formatting.black,
					-- Clang-format for C/C++ formatting with 4-space tab.
					null_ls.builtins.formatting.clang_format.with({
						extra_args = { "--style={IndentWidth: 4, UseTab: Always}" },
					}),
				},
			})

			-- Optional: Map a key to format the current buffer.
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
}
