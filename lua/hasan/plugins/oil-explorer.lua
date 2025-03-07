return {
  "stevearc/oil.nvim",
  dependencies = { 
    { "echasnovski/mini.icons", opts = {} },
    "nvim-tree/nvim-web-devicons", -- if you prefer nvim-web-devicons
  },
  lazy = false, -- Ensure it loads immediately
  config = function()
    local oil = require("oil")
    oil.setup()
    vim.keymap.set("n", "-", oil.open, { desc = "Open Oil file explorer" })
  end,
}
