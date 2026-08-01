return {{
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",

    branch = "v3.x",
    lazy = false,
    dependencies = {"nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons"}
}, {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
        default_file_explorer = false,
        close_if_last_window = true
    },
    dependencies = {{
        "nvim-mini/mini.icons",
        opts = {}
    }}
}}
