return {{
    "tpope/vim-fugitive",
    cmd = {"Git", "G"}
}, {
    "lewis6991/gitsigns.nvim",
    event = {"BufReadPre", "BufNewFile"},
    opts = {
        signs = {
            add = {
                text = "│"
            },
            change = {
                text = "│"
            },
            delete = {
                text = "_"
            },
            topdelete = {
                text = "‾"
            },
            changedelete = {
                text = "~"
            }
        },

        current_line_blame = false,

        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, {
                    buffer = bufnr,
                    desc = desc
                })
            end

            -- Hunk navigation
            map("n", "]h", gs.next_hunk, "Next hunk")
            map("n", "[h", gs.prev_hunk, "Previous hunk")

            -- Hunk actions
            map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
            map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
            map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

            -- Buffer actions
            map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
            map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

            -- Blame
            map("n", "<leader>hb", function()
                gs.blame_line({
                    full = true
                })
            end, "Blame line")

            -- Diff
            map("n", "<leader>hd", gs.diffthis, "Diff buffer")
            map("n", "<leader>hD", function()
                gs.diffthis("~")
            end, "Diff against HEAD")

            -- Text object
            map({"o", "x"}, "ih", gs.select_hunk, "Select hunk")
        end
    }
}, {
    "sindrets/diffview.nvim",
    cmd = {"DiffviewOpen", "DiffviewClose", "DiffviewFileHistory"},
    dependencies = {"nvim-lua/plenary.nvim"}
}}
