return {{
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {}
}, {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
        check_ts = true,
        map_cr = true,
        fast_wrap = {
            map = '<M-e>',
            chars = {'{', '[', '(', '"', "'"}
        }
    },
    config = function(_, opts)
        require('nvim-autopairs').setup(opts)

        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'python',
            callback = function()
                vim.opt_local.indentkeys:append('0}')
                vim.opt_local.indentkeys:append('0]')
                vim.opt_local.indentkeys:append('0)')
            end
        })
    end
}, {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    opts = {}
}, {
    'windwp/nvim-ts-autotag',

    ft = {'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'xml'},

    opts = {}
}}
