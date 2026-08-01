return {{
    "mason-org/mason.nvim",
    config = function()
        require("mason").setup()
    end
}, {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {"neovim/nvim-lspconfig"},

    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {"lua_ls", "pyright", "rust_analyzer", "ts_ls", "clangd", "gopls"}
        })
    end
}, {
    "neovim/nvim-lspconfig",
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.lsp.config("lua_ls", {
            capabilities = capabilities
        })

        vim.lsp.config("pyright", {
            capabilities = capabilities
        })

        vim.lsp.config("rust_analyzer", {
            capabilities = capabilities
        })

        vim.lsp.config("ts_ls", {
            capabilities = capabilities
        })

        vim.lsp.config("clangd", {
            capabilities = capabilities
        })

        vim.lsp.config("gopls", {
            capabilities = capabilities
        })

        vim.lsp.enable({"lua_ls", "pyright", "rust_analyzer", "ts_ls", "clangd", "gopls"})

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local opts = {
                    buffer = args.buf,
                    silent = true
                }

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end
        })
    end
}}
