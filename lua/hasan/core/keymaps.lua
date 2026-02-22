vim.g.mapleader = " "

local keymap = vim.keymap

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Save and quit
keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save the file" })
keymap.set("n", "<leader>wq", "<cmd>x<cr>", { desc = "Save and quit the file" })
keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit Neovim" })
keymap.set({ "i", "v" }, "jk", "<Esc>", { noremap = true, silent = true })
-- use to open Explore [for now]
-- keymap.set("n", "<leader>ex", ":Ex<CR>", { noremap = true, silent = true })

-- Window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol (LSP)" })

keymap.set("n", "<leader>rc", "<cmd>cclose<cr>", {
	desc = "Close quickfix window",
})

-- Disable arrow keys
vim.keymap.set("n", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Right>", "<Nop>", { noremap = true, silent = true })

-- -- Toggle Neo-tree
-- vim.keymap.set("n", "<leader>nn", ":Neotree toggle<CR>", { noremap = true, silent = true })
--
-- -- Reveal current file in Neo-tree
-- vim.keymap.set("n", "<leader>n", ":Neotree reveal<CR>", { noremap = true, silent = true })
-- NOTE: Twilight plugin is not installed. Add 'folke/twilight.nvim' to use these keymaps
-- vim.keymap.set("n", "<leader>te", "<cmd>TwilightEnable<cr>", { desc = "Enable Twilight" })
-- vim.keymap.set("n", "<leader>td", "<cmd>TwilightDisable<cr>", { desc = "Disable Twilight" })
