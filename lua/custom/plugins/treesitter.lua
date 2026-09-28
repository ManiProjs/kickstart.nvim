return {{
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter").setup()

        local languages = {"bash", "c", "cpp", "css", "fish", "html", "javascript", "jsdoc", "json", "json5", "lua",
                           "markdown", "markdown_inline", "python", "query", "rust", "sql", "tsx", "typescript", "toml",
                           "vim", "vimdoc", "yaml"}

        local installed = {}

        for _, language in ipairs(languages) do
            local ok = pcall(vim.treesitter.language.add, language)

            if ok then
                table.insert(installed, language)
            end
        end

        local filetypes = {}

        for _, language in ipairs(installed) do
            local ok, types = pcall(vim.treesitter.language.get_filetypes, language)

            if ok then
                for _, ft in ipairs(types) do
                    table.insert(filetypes, ft)
                end
            end
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetypes,

            callback = function()
                pcall(vim.treesitter.start)

                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

                vim.wo.foldmethod = "expr"
            end
        })
    end
}}
