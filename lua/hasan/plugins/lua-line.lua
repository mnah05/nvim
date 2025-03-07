return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto", -- Uses the current colorscheme
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_x = {
          { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = { fg = "#ff9e64" } },
          "encoding",
          "fileformat",
          "filetype",
        },
      },
    })
  end,
}
