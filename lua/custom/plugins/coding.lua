return {{
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {}
}, {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
}, {
    "kylechui/nvim-surround",
    opts = {}
}, {
    "windwp/nvim-ts-autotag",
    opts = {}
}, {
    "mattn/emmet-vim",
    ft = {"html", "css", "javascriptreact", "typescriptreact"}
}, {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter"
}}
