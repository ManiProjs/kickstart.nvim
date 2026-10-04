return {{
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter").setup()

        local languages = {"bash", "c", "cpp", "css", "fish", "html", "javascript", "jsdoc", "json", "json5", "lua",
                           "markdown", "markdown_inline", "python", "query", "rust", "sql", "tsx", "typescript", "toml",
                           "vim", "vimdoc", "yaml"}

        for _, language in ipairs(languages) do
            pcall(vim.treesitter.language.add, language)
        end

        local filetypes = {}

        for _, language in ipairs(languages) do
            local ok, types = pcall(vim.treesitter.language.get_filetypes, language)

            if ok then
                vim.list_extend(filetypes, types)
            end
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetypes,

            callback = function()
                pcall(vim.treesitter.start)

                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo.foldmethod = "expr"
            end
        })
    end
}}
