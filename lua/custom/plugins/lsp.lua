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
}, {
    "hrsh7th/nvim-cmp",
    dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "L3MON4D3/LuaSnip"},
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<CR>"] = cmp.mapping.confirm()
            }),
            sources = {{
                name = "nvim_lsp"
            }, {
                name = "buffer"
            }, {
                name = "path"
            }}
        })
    end
}}
