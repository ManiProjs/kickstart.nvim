local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("ruff", {
    capabilities = capabilities,

    init_options = {
        settings = {}
    }
})

vim.lsp.config("pyright", {
    capabilities = capabilities
})

vim.lsp.config("lua_ls", {
    capabilities = capabilities
})

vim.lsp.config("ts_ls", {
    capabilities = capabilities
})

vim.lsp.config("html", {
    capabilities = capabilities
})

vim.lsp.config("sorbet", {
    capabilities = capabilities
})

vim.lsp.enable({"ruff", "sorbet", "ts_ls", "lua_ls", "html", "pyright"})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local buf = args.buf

        local opts = {
            buffer = buf,
            silent = true
        }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end
})
