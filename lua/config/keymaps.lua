local map = vim.keymap.set

local opts = {
    noremap = true,
    silent = true
}

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", {
    desc = "Clear search highlight"
})

-- Diagnostics
map("n", "<leader>xq", vim.diagnostic.setloclist, {
    desc = "Open diagnostics list"
})

map("n", "<leader>xd", vim.diagnostic.open_float, {
    desc = "Show diagnostic float"
})

map("n", "[d", vim.diagnostic.goto_prev, {
    desc = "Previous diagnostic"
})

map("n", "]d", vim.diagnostic.goto_next, {
    desc = "Next diagnostic"
})

-- Terminal escape
map("t", "<Esc><Esc>", "<C-\\><C-n>", {
    desc = "Exit terminal mode"
})

-- Window navigation
map("n", "<C-h>", "<C-w><C-h>", opts)
map("n", "<C-l>", "<C-w><C-l>", opts)
map("n", "<C-j>", "<C-w><C-j>", opts)
map("n", "<C-k>", "<C-w><C-k>", opts)

-- Neo-tree
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", {
    desc = "Toggle file explorer"
})

-- Tabs
map("n", "<leader>tn", "<cmd>tabnew<CR>", {
    desc = "New tab"
})

map("n", "<leader>tc", "<cmd>tabclose<CR>", {
    desc = "Close tab"
})

map("n", "<leader>to", "<cmd>tabonly<CR>", {
    desc = "Close other tabs"
})

-- Bufferline
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", {
    desc = "Next buffer"
})

map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", {
    desc = "Previous buffer"
})

-- LazyGit
map("n", "<leader>gg", "<cmd>LazyGit<CR>", {
    desc = "Open LazyGit"
})

map("n", "<leader>gf", "<cmd>LazyGitCurrentFile<CR>", {
    desc = "LazyGit current file"
})

map("n", "<leader>gl", "<cmd>LazyGitLog<CR>", {
    desc = "LazyGit log"
})

map("n", "<leader>gL", "<cmd>LazyGitLogCurrentFile<CR>", {
    desc = "LazyGit current file log"
})

-- Persistence
map("n", "<leader>qs", function()
    require("persistence").load()
end, {
    desc = "Restore session"
})

map("n", "<leader>qS", function()
    require("persistence").select()
end, {
    desc = "Select session"
})

map("n", "<leader>ql", function()
    require("persistence").load({
        last = true
    })
end, {
    desc = "Restore last session"
})

map("n", "<leader>qd", function()
    require("persistence").stop()
end, {
    desc = "Disable session saving"
})
