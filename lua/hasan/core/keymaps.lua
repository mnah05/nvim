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

-- Flash - Enhanced search/jump
keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash jump" })
keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash treesitter" })

-- Todo-comments
keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", { desc = "Search TODOs" })
keymap.set("n", "<leader>tq", "<cmd>TodoQuickFix<cr>", { desc = "TODOs to quickfix" })

-- Bufferline
keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })
keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { desc = "Pick buffer" })

-- Harpoon
keymap.set("n", "<leader>ha", function()
	require("harpoon"):list():add()
end, { desc = "Add file to harpoon" })
keymap.set("n", "<leader>hl", function()
	require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Toggle harpoon menu" })
keymap.set("n", "<leader>h1", function()
	require("harpoon"):list():select(1)
end, { desc = "Harpoon file 1" })
keymap.set("n", "<leader>h2", function()
	require("harpoon"):list():select(2)
end, { desc = "Harpoon file 2" })
keymap.set("n", "<leader>h3", function()
	require("harpoon"):list():select(3)
end, { desc = "Harpoon file 3" })
keymap.set("n", "<leader>h4", function()
	require("harpoon"):list():select(4)
end, { desc = "Harpoon file 4" })
