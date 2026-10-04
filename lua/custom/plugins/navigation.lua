return { -- ============================================================
  -- Telescope
  -- ============================================================
  {
    'nvim-telescope/telescope.nvim',

    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },

    opts = function()
      local actions = require 'telescope.actions'
      local trouble = require 'trouble.sources.telescope'

      return {
        defaults = {
          prompt_prefix = '  ',
          selection_caret = '  ',

          sorting_strategy = 'descending',

          layout_config = {
            horizontal = {
              preview_width = 0.55,
            },
          },

          mappings = {
            i = {
              ['<C-t>'] = trouble.open,

              ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
            },

            n = {
              ['<C-t>'] = trouble.open,

              ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
            },
          },
        },

        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
        },
      }
    end,

    config = function(_, opts)
      local telescope = require 'telescope'

      telescope.setup(opts)

      pcall(telescope.load_extension, 'fzf')
      pcall(telescope.load_extension, 'projects')
      pcall(telescope.load_extension, 'aerial')
    end,
  }, -- ============================================================
  -- Trouble
  -- ============================================================
  {
    'folke/trouble.nvim',

    cmd = 'Trouble',

    opts = {
      auto_preview = false,

      modes = {
        diagnostics = {
          win = {
            position = 'right',
          },
        },

        symbols = {
          win = {
            position = 'right',
          },
        },

        lsp = {
          win = {
            position = 'right',
          },
        },
      },
    },

    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<CR>',
        desc = 'Diagnostics',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
        desc = 'Buffer Diagnostics',
      },
      {
        '<leader>xs',
        '<cmd>Trouble symbols toggle focus=false<CR>',
        desc = 'Symbols',
      },
      {
        '<leader>xl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<CR>',
        desc = 'LSP',
      },
    },
  }, -- ============================================================
  -- Flash
  -- ============================================================
  {
    'folke/flash.nvim',

    event = 'VeryLazy',

    opts = {},
  }, -- ============================================================
  -- Harpoon
  -- ============================================================
  {
    'ThePrimeagen/harpoon',

    branch = 'harpoon2',

    dependencies = { 'nvim-lua/plenary.nvim' },

    opts = {},
  }, -- ============================================================
  -- Aerial
  -- ============================================================
  {
    'stevearc/aerial.nvim',

    opts = {
      backends = { 'lsp', 'treesitter', 'markdown', 'man' },

      layout = {
        default_direction = 'left',
        placement = 'edge',
        width = 30,
      },
    },
  }, -- ============================================================
  -- Text Objects
  -- ============================================================
  {
    'chrisgrieser/nvim-various-textobjs',

    event = 'VeryLazy',

    opts = {
      keymaps = {
        useDefaults = true,
      },
    },
  }, -- ============================================================
  -- Quickfix
  -- ============================================================
  {
    'kevinhwang91/nvim-bqf',

    ft = 'qf',
  },
}
