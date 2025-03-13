vim.g.mapleader = " "

local keymap = vim.keymap

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Save and quit
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save the file" })
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Save and quit the file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit Neovim" })
keymap.set({"i","v"}, "qq","<Esc>",{noremap = true,silent = true})
-- use to open Explore [for now]
keymap.set("n","<leader>ex",":Ex<CR>", { noremap = true, silent = true })

-- Window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })

-- Disable arrow keys
vim.keymap.set("n", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Right>", "<Nop>", { noremap = true, silent = true })
