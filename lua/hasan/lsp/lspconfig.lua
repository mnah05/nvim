return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

			local on_attach = function(_, bufnr)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end
				map("K", vim.lsp.buf.hover, "Hover")
				map("<leader>gd", vim.lsp.buf.definition, "Go to Definition")
				map("<leader>gr", vim.lsp.buf.references, "References")
				map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
				map("<leader>rn", vim.lsp.buf.rename, "Rename")
				map("<leader>gf", function()
					vim.lsp.buf.format({ async = true })
				end, "Format File")
			end

			local servers = { "ts_ls", "pyright", "lua_ls", "clangd", "gopls", "rust_analyzer" }

			for _, server in ipairs(servers) do
				vim.lsp.config(server, { capabilities = capabilities, on_attach = on_attach })
			end
			vim.lsp.enable(servers)

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})
		end,
	},
}
