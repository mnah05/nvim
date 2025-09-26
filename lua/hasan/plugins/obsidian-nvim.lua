
-- Set conceallevel before plugin setup
vim.opt.conceallevel = 1

return {
  "epwalsh/obsidian.nvim",
  version = "*", -- use latest release
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/learn",
      },
    },
    -- leave UI enabled (needs conceallevel=1 or 2)
    ui = { enable = true },
  },
}
