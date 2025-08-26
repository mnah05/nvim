return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("blink.cmp")
			local capabilities = cmp_nvim_lsp.get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

			local on_attach = function(_, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", { desc = "Hover" }, bufopts))
				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition,
					vim.tbl_extend("force", { desc = "Go to Definition" }, bufopts))
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references,
					vim.tbl_extend("force", { desc = "References" }, bufopts))
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
					vim.tbl_extend("force", { desc = "Code Action" }, bufopts))
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
					vim.tbl_extend("force", { desc = "Smart Rename" }, bufopts))
				vim.keymap.set("n", "<leader>gf", function()
					vim.lsp.buf.format({ async = true })
				end, vim.tbl_extend("force", { desc = "Format File" }, bufopts))
			end

			local servers = {
				pyright = {},
				ts_ls = {},
				lua_ls = {},
				clangd = {},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				config.on_attach = on_attach
				lspconfig[server].setup(config)
			end
		end,
	},
}
