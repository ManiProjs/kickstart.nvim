return { -- Mason: LSP installer
  {
    'mason-org/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  }, -- Mason LSP bridge
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = { 'mason-org/mason.nvim', 'neovim/nvim-lspconfig' },

    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls', 'pyright', 'ruff', 'ts_ls', 'html', 'sorbet' },
      }
    end,
  }, -- LSP configuration (Neovim 0.12 style)
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },

    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
      })

      vim.lsp.config('pyright', {
        capabilities = capabilities,
      })

      vim.lsp.config('ruff', {
        capabilities = capabilities,

        init_options = {
          settings = {},
        },
      })

      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
      })

      vim.lsp.config('html', {
        capabilities = capabilities,
      })

      vim.lsp.config('sorbet', {
        capabilities = capabilities,
      })

      vim.lsp.enable { 'lua_ls', 'pyright', 'ruff', 'ts_ls', 'html', 'sorbet' }

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local buf = args.buf

          local opts = {
            buffer = buf,
            silent = true,
          }

          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        end,
      })

      vim.diagnostic.config {
        virtual_text = true,
        signs = true,
        underline = true,
        severity_sort = true,
      }
    end,
  }, -- Completion
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
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<CR>'] = cmp.mapping.confirm {
            select = true,
          },
        },

        sources = {
          {
            name = 'nvim_lsp',
          },
          {
            name = 'luasnip',
          },
          {
            name = 'path',
          },
          {
            name = 'buffer',
          },
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
    {
      'folke/trouble.nvim',
      opts = {},
      cmd = 'Trouble',
    },
  },
}
