vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 4 -- A tab looks like 4 spaces
vim.opt.shiftwidth = 4 -- Indentation size
vim.opt.softtabstop = 4 -- Backspace behaves like 4 spaces

require("config.options")
require("config.autocmds")

vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,terminal"

-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git",
                   lazypath})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{
    import = "custom.plugins"
}, {
    import = "kickstart.plugins"
}}, {
    ui = {
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤"
        }
    }
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"javascript", "typescript", "javascriptreact", "typescriptreact"},
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end
})

require("config.keymaps")
require("config.lsp")

vim.cmd.colorscheme("tokyonight")
