return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    -- mark current file, toggle quick menu
    vim.keymap.set("n", "<leader>mf", mark.add_file, { desc = "Harpoon: mark file" })
    vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, { desc = "Harpoon: toggle menu" })

    -- leader + numbers 1..5 -> go to harpoon file n
    for i = 1, 5 do
      vim.keymap.set("n", "<leader>" .. i, function() ui.nav_file(i) end,
        { desc = "Harpoon: go to file " .. i })
    end
  end
}
