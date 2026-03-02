local map = vim.keymap.set

map({ "i", "v" }, "jj", "<Esc>")
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

-- LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "References" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })

-- Telescope
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>s", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
