vim.cmd("let g:netrw_liststyle = 3")

vim.o.mouse = ""

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true


opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true


opt.termguicolors = true
opt.background = "dark"
opt.clipboard:append("unnamedplus")

opt.updatetime = 250

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
