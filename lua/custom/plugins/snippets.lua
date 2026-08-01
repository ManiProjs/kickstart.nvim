return {{
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {"rafamadriz/friendly-snippets"},
    config = function()
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()

        luasnip.config.setup({
            history = true,
            updateevents = "TextChanged,TextChangedI"
        })

        vim.keymap.set({"i", "s"}, "<Tab>", function()
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                return "<Tab>"
            end
        end, {
            expr = true,
            silent = true
        })

        vim.keymap.set({"i", "s"}, "<S-Tab>", function()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                return "<S-Tab>"
            end
        end, {
            expr = true,
            silent = true
        })
    end
}}
