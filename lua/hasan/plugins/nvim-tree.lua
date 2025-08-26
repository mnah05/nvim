return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false, -- neo-tree will load immediately
  opts = {
    window = {
      position = "right", -- sidebar on the left
      width = 30,        -- fixed width in columns
    },
  },
}
