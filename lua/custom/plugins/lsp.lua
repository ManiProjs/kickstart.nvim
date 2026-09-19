return {
  {
    'hrsh7th/nvim-cmp',

    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
    },

    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require 'lspkind'

      require('luasnip.loaders.from_vscode').lazy_load()

      luasnip.config.setup {
        history = true,
        updateevents = 'TextChanged,TextChangedI',
      }

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered {
            border = 'rounded',
          },

          documentation = cmp.config.window.bordered {
            border = 'rounded',
          },
        },

        formatting = {
          format = lspkind.cmp_format {
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
          },
        },

        mapping = cmp.mapping.preset.insert {
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_locally_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<CR>'] = cmp.mapping.confirm {
            select = true,
          },
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' },
        },
      }
    end,
  },

  {
    'stevearc/conform.nvim',

    event = { 'BufWritePre' },

    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_format' },
        rust = { 'rustfmt' },
        c = { 'clang_format' },
        cpp = { 'clang_format' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        json = { 'prettier' },
        markdown = { 'prettier' },
      },

      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
      },
    },
  },

  {
    'folke/trouble.nvim',

    opts = {},

    cmd = 'Trouble',
  },
}
