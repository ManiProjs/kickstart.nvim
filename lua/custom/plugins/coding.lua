return { -- ============================================================
-- Blink Completion
-- ============================================================
{
    "saghen/blink.cmp",
    version = "1.*",

    dependencies = {"rafamadriz/friendly-snippets"},

    opts = {
        keymap = {
            preset = "default",

            ["<C-space>"] = {"show", "show_documentation", "hide_documentation"},

            ["<C-e>"] = {"hide"},

            ["<CR>"] = {"accept", "fallback"},

            ["<Tab>"] = {"select_next", "snippet_forward", "fallback"},

            ["<S-Tab>"] = {"select_prev", "snippet_backward", "fallback"},

            ["<C-n>"] = {"select_next", "fallback"},

            ["<C-p>"] = {"select_prev", "fallback"},

            ["<C-b>"] = {"scroll_documentation_up", "fallback"},

            ["<C-f>"] = {"scroll_documentation_down", "fallback"}
        },

        appearance = {
            nerd_font_variant = "mono"
        },

        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,

                window = {
                    border = "rounded"
                }
            },

            menu = {
                border = "rounded",

                draw = {
                    columns = {{
                        "kind_icon",
                        "label",
                        "label_description",
                        gap = 1
                    }, {"kind"}}
                }
            },

            ghost_text = {
                enabled = true
            }
        },

        sources = {
            default = {"lsp", "path", "snippets", "buffer"}
        },

        snippets = {
            preset = "default"
        },

        signature = {
            enabled = true,

            window = {
                border = "rounded"
            }
        }
    }
}, -- ============================================================
-- Formatting
-- ============================================================
{
    "stevearc/conform.nvim",

    event = {"BufWritePre"},

    opts = {
        formatters_by_ft = {
            lua = {"stylua"},

            python = {"ruff_format"},

            javascript = {"prettier"},

            javascriptreact = {"prettier"},

            typescript = {"prettier"},

            typescriptreact = {"prettier"},

            json = {"prettier"},

            jsonc = {"prettier"},

            css = {"prettier"},

            scss = {"prettier"},

            html = {"prettier"},

            markdown = {"prettier"},

            yaml = {"prettier"},

            rust = {"rustfmt"},

            go = {"gofmt"},

            c = {"clang_format"},

            cpp = {"clang_format"},

            sh = {"shfmt"},

            bash = {"shfmt"},

            nix = {"nixfmt"},

            qml = {"qmlformat"}
        },

        format_on_save = {
            timeout_ms = 3000,
            lsp_format = "fallback"
        },

        formatters = {
            prettier = {
                prepend_args = {"--single-quote", "--trailing-comma", "all"}
            }
        }
    }
}}
