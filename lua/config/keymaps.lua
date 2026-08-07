local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("n", "<leader>q", vim.diagnostic.setloclist)

map("t", "<Esc><Esc>", "<C-\\><C-n>")

map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-l>", "<C-w><C-l>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")

map("n", "<leader>e", ":Neotree toggle<CR>")

map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)

map("n", "<leader>tn", ":tabnew<CR>")
map("n", "<leader>tc", ":tabclose<CR>")
map("n", "<leader>to", ":tabonly<CR>")

map("n", "<Tab>", ":BufferLineCycleNext<CR>")
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")

-- LazyGit
map("n", "<leader>gg", "<cmd>LazyGit<CR>", {
    desc = "Open LazyGit"
})

map("n", "<leader>gf", "<cmd>LazyGitCurrentFile<CR>", {
    desc = "LazyGit Current File"
})

map("n", "<leader>gl", "<cmd>LazyGitLog<CR>", {
    desc = "LazyGit Log"
})

map("n", "<leader>gL", "<cmd>LazyGitLogCurrentFile<CR>", {
    desc = "LazyGit Log Current File"
})

-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function()
    require("persistence").load()
end)

-- select a session to load
vim.keymap.set("n", "<leader>qS", function()
    require("persistence").select()
end)

-- load the last session
vim.keymap.set("n", "<leader>ql", function()
    require("persistence").load({
        last = true
    })
end)

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function()
    require("persistence").stop()
end)

