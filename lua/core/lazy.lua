local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	if vim.fn.executable("git") ~= 1 then
		error("lazy.nvim requires Git to bootstrap. Install Git, then restart Neovim.")
	end
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Failed to bootstrap lazy.nvim. Check your Git and network configuration, then restart Neovim.")
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "plugins" })
