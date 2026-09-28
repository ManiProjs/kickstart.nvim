return {{
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    opts = {
        terminal = {
            enabled = true
        },

        zen = {
            enabled = true
        },

        lazygit = {
            enabled = true
        },

        dim = {
            enabled = true
        },

        notifier = {
            enabled = true
        },

        bufdelete = {
            enabled = true
        },

        -- Explicitly keep everything else off.
        dashboard = {
            enabled = false
        },
        explorer = {
            enabled = false
        },
        picker = {
            enabled = false
        },
        indent = {
            enabled = false
        },
        scroll = {
            enabled = false
        },
        input = {
            enabled = false
        },
        scratch = {
            enabled = false
        },
        words = {
            enabled = false
        }
    }
}}
