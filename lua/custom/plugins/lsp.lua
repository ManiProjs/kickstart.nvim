return {{
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            python = {"flake8"},
            javascript = {"eslint_d"},
            typescript = {"eslint_d"}
        }

        vim.api.nvim_create_autocmd({"BufWritePost"}, {
            callback = function()
                lint.try_lint()
            end
        })
    end
}, {
    "stevearc/conform.nvim",
    event = {"BufReadPre", "BufNewFile", "BufWritePre"},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = {"stylua"},
                javascript = {"prettier"},
                typescript = {"prettier"},
                python = {"black"}
            },

            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true
            }
        })
    end
}, {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},

    keys = {{
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)"
    }, {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)"
    }, {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)"
    }, {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)"
    }, {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)"
    }, {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)"
    }}
}}
