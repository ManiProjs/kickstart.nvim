return {{
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter").setup()

        local languages = {"bash", "c", "cpp", "fish", "html", "java", "javascript", "lua", "markdown",
                           "markdown_inline", "python", "sql", "vimscript", "vimdoc"}

        local filetypes = {}

        for _, lang in ipairs(languages) do
            for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
                table.insert(filetypes, ft)
            end
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetypes,

            callback = function()
                vim.treesitter.start()

                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo.foldmethod = "expr"
            end
        })
    end
}}
