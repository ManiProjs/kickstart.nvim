return {{
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            direction = "float",
            float_opts = {
                border = "rounded"
            },
            size = 20
        })

        vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", {
            desc = "Toggle floating terminal"
        })

        vim.keymap.set("t", "<Esc>", "<C-\\><C-n><cmd>ToggleTerm<CR>", {
            desc = "Close terminal"
        })
    end
}}
