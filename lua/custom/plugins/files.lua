return {{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,

    dependencies = {"nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons"},

    opts = {
        close_if_last_window = true,

        filesystem = {
            follow_current_file = {
                enabled = true
            },

            use_libuv_file_watcher = true,

            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false
            }
        },

        window = {
            width = 32,

            mappings = {
                ["<space>"] = "none"
            }
        },

        buffers = {
            follow_current_file = {
                enabled = true
            }
        }
    },

    keys = {{
        "<leader>e",
        "<cmd>Neotree toggle<CR>",
        desc = "Explorer"
    }, {
        "<leader>E",
        "<cmd>Neotree reveal<CR>",
        desc = "Reveal Current File"
    }}
}, {
    "stevearc/oil.nvim",
    cmd = "Oil",

    dependencies = {{
        "nvim-mini/mini.icons",
        opts = {}
    }},

    opts = {
        default_file_explorer = false,

        columns = {"icon", "permissions", "size", "mtime"},

        delete_to_trash = true,

        skip_confirm_for_simple_edits = true,

        view_options = {
            show_hidden = true
        },

        float = {
            padding = 2,
            max_width = 100,
            max_height = 30,
            border = "rounded"
        }
    },

    keys = {{
        "-",
        "<cmd>Oil<CR>",
        desc = "Open Parent Directory"
    }, {
        "<leader>o",
        "<cmd>Oil<CR>",
        desc = "Oil"
    }}
}}
