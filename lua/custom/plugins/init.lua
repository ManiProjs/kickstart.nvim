-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {{
    'ibhagwan/fzf-lua',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {}
}, {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {}
}, {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    event = 'VeryLazy',
    config = function()
        require('lualine').setup()
    end
}, {
    'karb94/neoscroll.nvim',
    opts = {}
}, {
    'mawkler/modicator.nvim',
    dependencies = {'mawkler/onedark.nvim'},
    init = function()
        vim.o.cursorline = true
        vim.o.number = true
        vim.o.termguicolors = true
    end,
    opts = {
        show_warnings = false
    }
}, {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {},
    dependencies = {'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify'}
}, {
    'ahmedkhalf/project.nvim',
    event = 'VeryLazy',
    opts = {
        manual_mode = true
    },
    config = function(_, opts)
        require('project_nvim').setup(opts)

        local history = require 'project_nvim.utils.history'
        history.delete_project = function(project)
            for k, v in pairs(history.recent_projects) do
                if v == project.value then
                    history.recent_projects[k] = nil
                    return
                end
            end
        end

        local ok, telescope = pcall(require, 'telescope')
        if ok then
            telescope.load_extension 'projects'
        end
    end
}, {'nvim-lua/plenary.nvim'}, {'tpope/vim-fugitive'}, {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        require('dashboard').setup {}
    end
}, {'justinmk/vim-sneak'}, {
    'windwp/nvim-ts-autotag',
    config = function()
        require('nvim-ts-autotag').setup()
    end
}, {
    'mfussenegger/nvim-lint',
    config = function()
        local lint = require 'lint'

        lint.linters_by_ft = {
            python = {'flake8'},
            javascript = {'eslint_d'},
            typescript = {'eslint_d'}
        }

        vim.api.nvim_create_autocmd({'BufWritePost'}, {
            callback = function()
                lint.try_lint()
            end
        })
    end
}, {
    'mattn/emmet-vim',
    ft = {'html', 'css', 'javascriptreact', 'typescriptreact'}
}, {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true
}, {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim', 'nvim-tree/nvim-web-devicons'},
    lazy = false
}, {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000
}, {
    'akinsho/bufferline.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    version = '*',
    event = 'VeryLazy',
    config = function()
        require('bufferline').setup {
            options = {
                mode = 'buffers',
                diagnostics = 'nvim_lsp',
                always_show_bufferline = false,
                offsets = {{
                    filetype = 'neo-tree',
                    text = 'Neo-tree',
                    highlight = 'Directory',
                    text_align = 'left'
                }}
            }
        }
    end
}, {
    'stevearc/oil.nvim',
    opts = {
        default_file_explorer = false
    },
    dependencies = {{
        'nvim-mini/mini.icons',
        opts = {}
    }},
    lazy = false
}, {
    'tpope/vim-sleuth',
    event = {'BufReadPost', 'BufNewFile'}
}, {
    'farmergreg/vim-lastplace',
    event = 'BufReadPost'
}, {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    config = function()
        require('ibl').setup()
    end
}, {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup()
    end
}, {
    'stevearc/conform.nvim',
    event = {'BufReadPre', 'BufNewFile', 'BufWritePre'},
    config = function()
        require('conform').setup {
            formatters_by_ft = {
                lua = {'stylua'},
                javascript = {'prettier'},
                typescript = {'prettier'},
                python = {'black'}
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true
            }
        }
    end
}, {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {{
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)'
    }, {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)'
    }, {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)'
    }, {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)'
    }, {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)'
    }, {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)'
    }}
}, {
    'AckslD/nvim-neoclip.lua',
    config = function()
        require('neoclip').setup()
    end
}, {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {}
}, {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {}
}, {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = true
}, {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {}
}, {
    "sindrets/diffview.nvim",
    cmd = {"DiffviewOpen", "DiffviewClose"}
}, {"mfussenegger/nvim-dap"}, {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap"}
}, {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter"
}}
