return {{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {"nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons"}
}, {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
        default_file_explorer = false
    },
    dependencies = {{
        "nvim-mini/mini.icons",
        opts = {}
    }}
}}
