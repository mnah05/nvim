local map = vim.keymap.set

map({ "i", "v" }, "jk", "<Esc>")
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<Tab>", "<cmd>bnext<cr>")
map("n", "<S-Tab>", "<cmd>bprev<cr>")
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })
map("n", "-", "<cmd>Oil<cr>", { desc = "File explorer" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	end,
})
map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next Diagnostic" })
map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Prev Diagnostic" })

-- Telescope
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>s", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
