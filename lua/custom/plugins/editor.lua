return {
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',

    opts = {
      check_ts = true,

      fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
      },
    },

    config = function(_, opts)
      local npairs = require 'nvim-autopairs'
      npairs.setup(opts)

      vim.keymap.set('i', '<CR>', function()
        local col = vim.fn.col '.'
        local line = vim.fn.getline '.'
        local before = line:sub(1, col - 1)
        local after = line:sub(col)

        if before:match '{%s*$' and after:match '^%s*}' then
          return '<CR><Esc>O'
        end

        return '<CR>'
      end, { expr = true, buffer = true })
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'windwp/nvim-ts-autotag',

    ft = { 'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'xml' },

    opts = {},
  },
}
