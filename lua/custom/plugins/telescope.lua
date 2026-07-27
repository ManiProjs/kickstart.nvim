return {{
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",

    dependencies = {"nvim-lua/plenary.nvim", {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
            return vim.fn.executable("make") == 1
        end
    }, "nvim-telescope/telescope-ui-select.nvim"},

    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            extensions = {
                ["ui-select"] = {require("telescope.themes").get_dropdown()}
            }
        })

        pcall(telescope.load_extension, "fzf")
        pcall(telescope.load_extension, "ui-select")

        local map = vim.keymap.set

        -- Search
        map("n", "<leader>fh", builtin.help_tags, {
            desc = "Search Help"
        })

        map("n", "<leader>fk", builtin.keymaps, {
            desc = "Search Keymaps"
        })

        map("n", "<leader>ff", builtin.find_files, {
            desc = "Search Files"
        })

        map("n", "<leader>fs", builtin.builtin, {
            desc = "Search Telescope Pickers"
        })

        map("n", "<leader>sw", builtin.grep_string, {
            desc = "Search Current Word"
        })

        map("n", "<leader>fg", builtin.live_grep, {
            desc = "Search Grep"
        })

        map("n", "<leader>fd", builtin.diagnostics, {
            desc = "Search Diagnostics"
        })

        map("n", "<leader>fr", builtin.resume, {
            desc = "Search Resume"
        })

        map("n", "<leader>f.", builtin.oldfiles, {
            desc = "Search Recent Files"
        })

        map("n", "<leader><leader>", builtin.buffers, {
            desc = "Find Existing Buffers"
        })

        -- Current buffer search
        map("n", "<leader>/", function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false
            }))
        end, {
            desc = "Search Current Buffer"
        })

        -- Search open files
        map("n", "<leader>s/", function()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files"
            })
        end, {
            desc = "Search Open Files"
        })

        -- Search Neovim config
        map("n", "<leader>fn", function()
            builtin.find_files({
                cwd = vim.fn.stdpath("config")
            })
        end, {
            desc = "Search Neovim Config"
        })

        -- Git
        map("n", "<leader>gs", builtin.git_status, {
            desc = "Git Status"
        })

        map("n", "<leader>gc", builtin.git_commits, {
            desc = "Git Commits"
        })

        map("n", "<leader>gb", builtin.git_branches, {
            desc = "Git Branches"
        })

        map("n", "<leader>gB", builtin.git_bcommits, {
            desc = "Git Buffer Commits"
        })

        map("n", "<leader>gS", builtin.git_stash, {
            desc = "Git Stash"
        })
    end
}}
