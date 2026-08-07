return {{
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    config = function()
        require("persistence").setup()

        vim.api.nvim_create_autocmd("User", {
            pattern = "PersistenceLoadPost",
            callback = function()
                vim.cmd("Neotree show")
            end
        })
    end
}, {
    "farmergreg/vim-lastplace",
    event = "BufReadPost"
}}
