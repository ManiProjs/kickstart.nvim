return {{
    "hrsh7th/nvim-cmp",
    dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "L3MON4D3/LuaSnip",
                    "rafamadriz/friendly-snippets", "onsails/lspkind.nvim"},

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },

            window = {
                completion = cmp.config.window.bordered({
                    border = "rounded"
                }),

                documentation = cmp.config.window.bordered({
                    border = "rounded"
                })
            },

            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "..."
                })
            },

            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, {"i", "s"}),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {"i", "s"}),

                ["<CR>"] = cmp.mapping.confirm({
                    select = true
                })
            }),

            sources = cmp.config.sources({{
                name = "nvim_lsp"
            }, {
                name = "luasnip"
            }, {
                name = "path"
            }}, {{
                name = "buffer"
            }})
        })
    end
}, {
    "neovim/nvim-lspconfig",
    dependencies = {"hrsh7th/cmp-nvim-lsp"},

    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.lsp.config("lua_ls", {
            capabilities = capabilities
        })

        vim.lsp.config("pyright", {
            capabilities = capabilities
        })

        vim.lsp.config("ts_ls", {
            capabilities = capabilities
        })

        vim.lsp.enable({"lua_ls", "pyright", "ts_ls"})
    end
}, {{
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
        require("mason").setup()
    end
}, {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp"},

    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {"lua_ls", "pyright", "ts_ls"}
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.lsp.config("*", {
            capabilities = capabilities
        })

        vim.lsp.enable({"lua_ls", "pyright", "ts_ls"})
    end
}, {
    "hrsh7th/nvim-cmp",

    dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "L3MON4D3/LuaSnip",
                    "rafamadriz/friendly-snippets", "onsails/lspkind.nvim"},

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },

            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50
                })
            },

            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),

                ["<CR>"] = cmp.mapping.confirm({
                    select = true
                })
            }),

            sources = {{
                name = "nvim_lsp"
            }, {
                name = "luasnip"
            }, {
                name = "path"
            }, {
                name = "buffer"
            }}
        })
    end
}, {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
        require("mason-tool-installer").setup({
            ensure_installed = {"stylua", "black", "prettier", "flake8"}
        })
    end
}}}
