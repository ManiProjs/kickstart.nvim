vim.lsp.config("ruff", {
    init_options = {
        settings = {}
    }
})

vim.lsp.enable("ruff")
vim.lsp.enable("sorbet")
vim.lsp.enable("ts_ls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("html")
vim.lsp.enable("ruff")
vim.lsp.enable("pyright")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local buf = args.buf

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
            buffer = buf
        })

        vim.keymap.set("n", "gr", vim.lsp.buf.references, {
            buffer = buf
        })

        vim.keymap.set("n", "K", vim.lsp.buf.hover, {
            buffer = buf
        })

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
            buffer = buf
        })
    end
})
