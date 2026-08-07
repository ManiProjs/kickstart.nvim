return {{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,

    dependencies = {"nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons"},

    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                follow_current_file = {
                    enabled = true
                }
            }
        })

        vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>")
    end
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
