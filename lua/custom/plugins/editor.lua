return {{
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {}
}, {
    "windwp/nvim-autopairs",
    event = "InsertEnter",

    opts = {
        check_ts = true,

        fast_wrap = {
            map = "<M-e>",
            chars = {"{", "[", "(", '"', "'"}
        }
    }
}, {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {}
}, {
    "windwp/nvim-ts-autotag",

    ft = {"html", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "xml"},

    opts = {}
}}
