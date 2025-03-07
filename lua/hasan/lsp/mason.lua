return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")
        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                -- Web development
                "ts_ls",
                "html",
                "cssls",
                "tailwindcss",
                "svelte",
                "graphql",
                "emmet_ls",
                "eslint",

                -- Databases
                "prismals",

                -- Python
                "pyright",

                -- C/C++
                "clangd",

                -- Lua
                "lua_ls",
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                -- Formatters
                "prettier", -- web formatter
                "stylua", -- lua formatter
                "isort", -- python import formatter
                "black", -- python formatter
                "clang-format", -- C/C++ formatter

                -- Linters
                "pylint", -- python linter
                "eslint_d", -- javascript/typescript linter
                "cpplint", -- C/C++ linter
            },
        })
    end,
}
