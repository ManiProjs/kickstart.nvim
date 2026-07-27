vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

require("config.options")
require("config.autocmds")

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

require("config.keymaps")

vim.cmd.colorscheme("tokyonight")
