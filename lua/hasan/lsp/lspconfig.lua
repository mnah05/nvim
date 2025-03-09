return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()
			local lspconfig = require("lspconfig")

			-- Define an on_attach function to map keys after the language server attaches to the buffer
			local on_attach = function(client, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set(
					"n",
					"<leader>rn",
					vim.lsp.buf.rename,
					vim.tbl_extend("force", { desc = "Smart Rename" }, bufopts)
				)
			end

			-- Common configuration for servers
			local servers = {
				ts_ls = {},
				html = {},
				lua_ls = {},
				pyright = {},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				config.on_attach = on_attach
				lspconfig[server].setup(config)
			end

			-- Improved C/C++ configuration with clangd
			lspconfig.clangd.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--completion-style=detailed",
					"--header-insertion=never",
				},
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
				},
			})
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = true,
	},
}
