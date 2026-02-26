return {
    -- Mason: LSP installer
    {
        "williamboman/mason.nvim",
        opts = {},
    },

    -- Mason-lspconfig bridge
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "ts_ls",        -- JS/TS
                "pyright",      -- Python
                "lua_ls",       -- Lua
                "clangd",       -- C/C++
                "gopls",        -- Go
            },
            automatic_installation = true,
        },
    },

    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            local servers = { "ts_ls", "pyright", "lua_ls", "clangd", "gopls" }
            for _, server in ipairs(servers) do
                vim.lsp.config(server, { capabilities = capabilities })
            end
            vim.lsp.enable(servers)

            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
            })
        end,
    },
}
