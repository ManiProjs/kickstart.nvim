local map = vim.keymap.set

local opts = {
    noremap = true,
    silent = true
}

-- ============================================================================
-- General
-- ============================================================================

map("n", "<Esc>", "<cmd>nohlsearch<CR>", {
    desc = "Clear search highlight"
})

-- ============================================================================
-- Diagnostics / Trouble
-- ============================================================================

map("n", "[d", vim.diagnostic.goto_prev, {
    desc = "Previous diagnostic"
})

map("n", "]d", vim.diagnostic.goto_next, {
    desc = "Next diagnostic"
})

map("n", "<leader>xd", vim.diagnostic.open_float, {
    desc = "Diagnostic float"
})

map("n", "<leader>xq", "<cmd>Trouble diagnostics toggle<CR>", {
    desc = "Diagnostics"
})

map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", {
    desc = "Buffer diagnostics"
})

-- ============================================================================
-- Window navigation
-- ============================================================================

map("n", "<C-h>", "<C-w><C-h>", opts)
map("n", "<C-j>", "<C-w><C-j>", opts)
map("n", "<C-k>", "<C-w><C-k>", opts)
map("n", "<C-l>", "<C-w><C-l>", opts)

-- ============================================================================
-- File explorer
-- ============================================================================

map("n", "<leader>e", "<cmd>Neotree toggle<CR>", {
    desc = "Toggle explorer"
})

map("n", "<leader>E", "<cmd>Neotree reveal<CR>", {
    desc = "Reveal current file"
})

-- ============================================================================
-- Buffers
-- ============================================================================

map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", {
    desc = "Next buffer"
})

map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", {
    desc = "Previous buffer"
})

map("n", "<leader>bd", function()
    Snacks.bufdelete()
end, {
    desc = "Delete buffer"
})

-- ============================================================================
-- Tabs
-- ============================================================================

map("n", "<leader>tn", "<cmd>tabnew<CR>", {
    desc = "New tab"
})

map("n", "<leader>tc", "<cmd>tabclose<CR>", {
    desc = "Close tab"
})

map("n", "<leader>to", "<cmd>tabonly<CR>", {
    desc = "Close other tabs"
})

map("n", "<leader>tl", "<cmd>tabnext<CR>", {
    desc = "Next tab"
})

map("n", "<leader>th", "<cmd>tabprevious<CR>", {
    desc = "Previous tab"
})

-- ============================================================================
-- Sessions
-- ============================================================================

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

-- ============================================================================
-- Snacks
-- ============================================================================

map("n", "<leader>tt", function()
    Snacks.terminal.toggle()
end, {
    desc = "Toggle terminal"
})

map("n", "<leader>z", function()
    Snacks.zen()
end, {
    desc = "Zen mode"
})

map("n", "<leader>ud", function()
    Snacks.dim()
end, {
    desc = "Toggle dim"
})

map("n", "<leader>gg", function()
    Snacks.lazygit()
end, {
    desc = "LazyGit"
})

map("n", "<leader>nh", function()
    Snacks.notifier.show_history()
end, {
    desc = "Notification history"
})

map("n", "<leader>nd", function()
    Snacks.notifier.hide()
end, {
    desc = "Dismiss notifications"
})

-- ============================================================================
-- Terminal
-- ============================================================================

map("t", "<Esc><Esc>", "<C-\\><C-n>", {
    desc = "Exit terminal mode"
})

-- ============================================================================
-- Quickfix
-- ============================================================================

map("n", "<leader>qo", "<cmd>copen<CR>", {
    desc = "Open quickfix"
})

map("n", "<leader>qc", "<cmd>cclose<CR>", {
    desc = "Close quickfix"
})

map("n", "<leader>qj", "<cmd>cnext<CR>", {
    desc = "Next quickfix item"
})

map("n", "<leader>qk", "<cmd>cprevious<CR>", {
    desc = "Previous quickfix item"
})

-- ============================================================================
-- Git
-- ============================================================================

map("n", "<leader>gs", "<cmd>Git<CR>", {
    desc = "Git status"
})

map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", {
    desc = "Diff view"
})

map("n", "<leader>gD", "<cmd>DiffviewClose<CR>", {
    desc = "Close diff view"
})

map("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", {
    desc = "File history"
})

map("n", "<leader>gH", "<cmd>DiffviewFileHistory %<CR>", {
    desc = "Current file history"
})

-- ============================================================================
-- Code outline
-- ============================================================================

map("n", "<leader>co", "<cmd>AerialToggle!<CR>", {
    desc = "Code outline"
})
