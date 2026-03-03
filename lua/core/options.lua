local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.updatetime = 250
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.splitbelow = true
opt.splitright = true
opt.pumheight = 10
opt.completeopt = "menu,menuone,noselect"
opt.swapfile = false

vim.g.mapleader = " "

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
