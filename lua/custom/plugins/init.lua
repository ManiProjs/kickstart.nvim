-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostics disable: missing-fields
    opts = {}
    ---@diagnostics enable: missing-fields
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "karb94/neoscroll.nvim",
    opts = {},
  },
  {
    'mawkler/modicator.nvim',
    dependencies = 'mawkler/onedark.nvim', -- Add your colorscheme plugin here
    init = function()
      -- These are required for Modicator to work
      vim.o.cursorline = true
      vim.o.number = true
      vim.o.termguicolors = true
    end,
    opts = {
      -- Warn if any required option above is missing. May emit false positives
      -- if some other plugin modifies them, which in that case you can just
      -- ignore. Feel free to remove this line after you've gotten Modicator to
      -- work properly.
      show_warnings = false,
    }
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    opts = {
      manual_mode = true,
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)

      -- Override delete_project behavior
      local history = require("project_nvim.utils.history")
      history.delete_project = function(project)
        for k, v in pairs(history.recent_projects) do
          if v == project.value then
            history.recent_projects[k] = nil
            return
          end
        end
      end

      -- Load Telescope extension safely
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.load_extension("projects")
      end
    end,
  },
  {'nvim-lua/plenary.nvim'},
  {'tpope/vim-fugitive'},
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {'justinmk/vim-sneak'},
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
      }
    end,
  },
  {
    'mikew/nvim-drawer',
    opts = {},
    config = function(_, opts)
      local drawer = require('nvim-drawer')
      drawer.setup(opts)

      drawer.create_drawer({
        -- This is needed for nvim-tree.
        nvim_tree_hack = true,

        -- Position on the right size of the screen.
        position = 'right',
        size = 90,

        -- Alternatively, you can have it floating.
        -- size = 90,
        -- position = 'float',
        -- win_config = {
        --   margin = 2,
        --   border = 'rounded',
        --   anchor = 'CE',
        --   width = 40,
        --   height = '80%',
        -- },

        on_vim_enter = function(event)
          --- Open the drawer on startup.
          event.instance.open({
            focus = false,
          })

          --- Example mapping to toggle.
          vim.keymap.set('n', '<leader>e', function()
            event.instance.focus_or_toggle()
          end)
        end,

        --- Ideally, we would just call this here and be done with it, but
        --- mappings in nvim-tree don't seem to apply when re-using a buffer in
        --- a new tab / window.
        on_did_create_buffer = function()
          local nvim_tree_api = require('nvim-tree.api')
          nvim_tree_api.tree.open({ current_window = true })
        end,

        --- This gets the tree to sync when changing tabs.
        on_did_open = function()
          local nvim_tree_api = require('nvim-tree.api')
          nvim_tree_api.tree.reload()

          vim.opt_local.number = false
          vim.opt_local.signcolumn = 'no'
          vim.opt_local.statuscolumn = ''
        end,

        --- Cleans up some things when closing the drawer.
        on_did_close = function()
          local nvim_tree_api = require('nvim-tree.api')
          nvim_tree_api.tree.close()
        end,
      })
    end
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}

-- nvim-tree.view.float = true

-- {
--   "nvim-neo-tree/neo-tree.nvim",
--   branch = "v3.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     "nvim-tree/nvim-web-devicons", -- optional, but recommended
--   },
--   lazy = false, -- neo-tree will lazily load itself
-- },
