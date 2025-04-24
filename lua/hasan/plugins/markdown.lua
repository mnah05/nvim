return {
    "MeanderingProgrammer/render-markdown.nvim",
    config = function()
        require("render-markdown").setup({
            render_modes = true,
            theme = "light", -- 'dark' or 'light'
            auto_enable = true, -- Auto-enable rendering for markdown buffers
            conceal = true, -- Use conceal feature to hide markdown syntax
            filetypes = { "markdown", "md" }, -- Ensure it works for both .md & markdown files
            -- More settings can be added as needed
        })
    end,
}
