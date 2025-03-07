return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    -- LSP keybindings setup
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        -- Key mappings
        local mappings = {
          { "n", "gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references" },
          { "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
          { "n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions" },
          { "n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations" },
          { "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions" },
          { { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "See available code actions" },
          { "n", "<leader>rn", vim.lsp.buf.rename, "Smart rename" },
          { "n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics" },
          { "n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics" },
          { "n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic" },
          { "n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic" },
          { "n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor" },
          { "n", "<leader>rs", ":LspRestart<CR>", "Restart LSP" },
        }

        for _, mapping in ipairs(mappings) do
          local mode, lhs, rhs, desc = mapping[1], mapping[2], mapping[3], mapping[4]
          opts.desc = desc
          keymap.set(mode, lhs, rhs, opts)
        end
      end,
    })

    -- Set up capabilities for autocompletion
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Diagnostic symbols
    local signs = { Error = "✖", Warn = "⚠", Hint = "󰠠 ", Info = "ℹ" }
    for type, icon in pairs(signs) do
      vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type, numhl = "" })
    end

    -- Server-specific configurations
    local server_configs = {
      -- Default handler
      default = function(server_name)
        lspconfig[server_name].setup({ capabilities = capabilities })
      end,

      -- Custom server configs
      -- Web development
      svelte = function()
        lspconfig.svelte.setup({
          capabilities = capabilities,
          on_attach = function(client, _)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,

      graphql = function()
        lspconfig.graphql.setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,

      emmet_ls = function()
        lspconfig.emmet_ls.setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })
      end,

      -- JavaScript/Node.js
      tsserver = function()
        lspconfig.tsserver.setup({
          capabilities = capabilities,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        })
      end,

      eslint = function()
        lspconfig.eslint.setup({
          capabilities = capabilities,
          on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,
        })
      end,

      -- Python
      pyright = function()
        lspconfig.pyright.setup({
          capabilities = capabilities,
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        })
      end,

      -- C/C++
      clangd = function()
        lspconfig.clangd.setup({
          capabilities = capabilities,
          cmd = {
            "clangd",
            "--offset-encoding=utf-16",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
          },
        })
      end,

      -- Lua
      lua_ls = function()
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              completion = { callSnippet = "Replace" },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        })
      end,
    }

    -- Setup handlers
    mason_lspconfig.setup_handlers({
      -- Default handler
      function(server_name)
        (server_configs[server_name] or server_configs.default)(server_name)
      end,
    })
  end,
}
