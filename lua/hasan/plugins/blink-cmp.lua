return {
  {
    'L3MON4D3/LuaSnip',
    build = 'make', -- optional, improves performance
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },

  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'L3MON4D3/LuaSnip',
    },
    version = '1.*',

    opts = {
      keymap = {
        preset = 'default',
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = { auto_show = false },
      },

      fuzzy = {
        implementation = 'prefer_rust_with_warning',
      },

      -- This sets up LuaSnip as the snippet engine for `nvim-cmp`
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
    },

    opts_extend = {
      sources = {
        { name = 'nvim-lsp' },
        { name = 'luasnip' },
        -- You can add more sources here, like:
        -- { name = 'buffer' },
        -- { name = 'path' },
      },
    },
  }
}
