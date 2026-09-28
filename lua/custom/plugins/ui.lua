return {{
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",

    dependencies = {"nvim-tree/nvim-web-devicons"},

    opts = {
        options = {
            theme = "auto",
            globalstatus = true,
            section_separators = "",
            component_separators = "",
            disabled_filetypes = {"alpha", "neo-tree", "oil"}
        },

        sections = {
            lualine_a = {"mode"},

            lualine_b = {"branch", "diff", "diagnostics"},

            lualine_c = {{
                "filename",
                path = 1
            }},

            lualine_x = {"encoding", "fileformat", "filetype"},

            lualine_y = {"progress"},

            lualine_z = {"location"}
        }
    }
}, {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",

    dependencies = {"nvim-tree/nvim-web-devicons"},

    opts = {
        options = {
            mode = "buffers",

            diagnostics = "nvim_lsp",

            always_show_bufferline = false,

            separator_style = "thin",

            offsets = {{
                filetype = "neo-tree",
                text = "Explorer",
                highlight = "Directory",
                text_align = "left",
                separator = true
            }},

            show_buffer_close_icons = true,
            show_close_icon = false,

            diagnostics_indicator = function(count, level)
                local icon = level:match("error") and " " or " "

                return " " .. icon .. count
            end
        }
    }
}, {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",

    opts = {
        indent = {
            char = "│"
        },

        scope = {
            enabled = true,
            show_start = false,
            show_end = false
        },

        exclude = {
            filetypes = {"help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "notify", "toggleterm"}
        }
    }
}, {
    "folke/noice.nvim",
    event = "VeryLazy",

    dependencies = {"MunifTanjim/nui.nvim"},

    opts = {
        lsp = {
            progress = {
                enabled = true
            },

            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true
            }
        },

        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = true,
            lsp_doc_border = true
        },

        views = {
            cmdline_popup = {
                border = {
                    style = "rounded"
                },

                position = {
                    row = "30%",
                    col = "50%"
                },

                size = {
                    width = 80,
                    height = "auto"
                }
            }
        }
    }
}, {
    "RRethy/vim-illuminate",
    event = {"BufReadPost", "BufNewFile"}
}, {
    "folke/todo-comments.nvim",
    event = {"BufReadPost", "BufNewFile"},

    opts = {},

    keys = {{
        "<leader>ft",
        "<cmd>TodoTelescope<CR>",
        desc = "Find TODOs"
    }}
}}
