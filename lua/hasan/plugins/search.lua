return {
  "VonHeikemen/searchbox.nvim",
  dependencies = { "MunifTanjim/nui.nvim" }, -- Required for UI elements
  config = function()
    require("searchbox").setup({
      popup = {
        relative = "win", -- Position relative to window
        position = { row = "50%", col = "50%" }, -- Centered
        size = 40, -- Adjust width
        border = {
          style = "rounded", -- Rounded borders
          text = { top = "  Search ", top_align = "center" }, -- Title with an icon
        },
        win_options = {
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder", -- Match colors with Neovim theme
        },
      },
    })

    -- Keybinding for search box
    vim.keymap.set("n", "<leader>s", "<Cmd>SearchBoxIncSearch<CR>", { noremap = true, silent = true })
  end,
}
