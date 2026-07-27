return {{
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
}, {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    opts = {}
}, {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true
}, {
    "mawkler/modicator.nvim",
    dependencies = {"mawkler/onedark.nvim"},
    init = function()
        vim.o.cursorline = true
        vim.o.number = true
        vim.o.termguicolors = true
    end,
    opts = {
        show_warnings = false
    }
}}
