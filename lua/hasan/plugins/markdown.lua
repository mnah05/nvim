return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "echasnovski/mini.nvim", -- Change this based on your setup
    },
    config = function()
        require("render-markdown").setup({
            -- Adjust settings as per your preference
            theme = "light", -- 'dark' or 'light'
            auto_enable = true, -- Auto-enable rendering for markdown buffers
            conceal = true, -- Use conceal feature to hide markdown syntax
            filetypes = { "markdown", "md" }, -- Ensure it works for both .md & markdown files
            -- More settings can be added as needed
        })
    end,
}
