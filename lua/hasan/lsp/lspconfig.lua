return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local lspconfig = require("lspconfig")

      -- blink.cmp capabilities
      local blink_cmp = require("blink.cmp")
      local capabilities =
        blink_cmp.get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

      local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", { desc = "Hover" }, bufopts))
        vim.keymap.set(
          "n",
          "<leader>gd",
          vim.lsp.buf.definition,
          vim.tbl_extend("force", { desc = "Go to Definition" }, bufopts)
        )
        vim.keymap.set(
          "n",
          "<leader>gr",
          vim.lsp.buf.references,
          vim.tbl_extend("force", { desc = "References" }, bufopts)
        )
        vim.keymap.set(
          "n",
          "<leader>ca",
          vim.lsp.buf.code_action,
          vim.tbl_extend("force", { desc = "Code Action" }, bufopts)
        )
        vim.keymap.set(
          "n",
          "<leader>rn",
          vim.lsp.buf.rename,
          vim.tbl_extend("force", { desc = "Smart Rename" }, bufopts)
        )
        vim.keymap.set("n", "<leader>gf", function()
          vim.lsp.buf.format({ async = true })
        end, vim.tbl_extend("force", { desc = "Format File" }, bufopts))
      end

      -- List of servers to setup with defaults
      local servers = {
        "ts_ls",        -- TypeScript/JavaScript
        "pyright",      -- Python
        "lua_ls",       -- Lua
        "clangd",       -- C/C++
        "gopls",        -- Go
        "rust_analyzer" -- Rust
      }

      -- Setup all servers with default config
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end

      -- Diagnostics UI
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
}
