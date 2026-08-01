return {
    "goolord/alpha-nvim",
    event = "VimEnter",

    dependencies = {"nvim-tree/nvim-web-devicons"},

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Greeting
        local hour = tonumber(os.date("%H"))
        local greeting

        if hour < 12 then
            greeting = "🌅 Good morning!"
        elseif hour < 18 then
            greeting = "☀️ Good afternoon!"
        else
            greeting = "🌙 Good evening!"
        end

        -- Header
        dashboard.section.header.val = {"                                              ",
                                        "        ███╗   ██╗███████╗ ██████╗ ██╗   ██╗    ",
                                        "        ████╗  ██║██╔════╝██╔═══██╗██║   ██║    ",
                                        "        ██╔██╗ ██║█████╗  ██║   ██║██║   ██║    ",
                                        "        ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝    ",
                                        "        ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝     ",
                                        "        ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝      ",
                                        "                                              ",
                                        "          ⚡ CODE • CREATE • CUSTOMIZE ⚡       ",
                                        "                                              ", "              " .. greeting,
                                        "                                              "}

        dashboard.section.header.opts.hl = "DashboardHeader"

        -- Buttons
        dashboard.section.buttons.val = {dashboard.button("f", "󰱼  Find File", "<cmd>Telescope find_files<CR>"),
                                         dashboard.button("r", "󰈚  Recent Files", "<cmd>Telescope oldfiles<CR>"),
                                         dashboard.button("g", "󰊄  Live Grep", "<cmd>Telescope live_grep<CR>"),
                                         dashboard.button("e", "󰙅  Explorer",
            "<cmd>Neotree filesystem reveal left toggle<CR>"), dashboard.button("m", "󰒲  Mason", "<cmd>Mason<CR>"),
                                         dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
                                         dashboard.button("c", "  Config", "<cmd>edit ~/.config/nvim/init.lua<CR>"),
                                         dashboard.button("q", "󰩈  Quit", "<cmd>qa<CR>")}

        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "DashboardCenter"
            button.opts.hl_shortcut = "DashboardShortcut"
        end

        -- Footer
        dashboard.section.footer.val = {"",
                                        "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
                                        "Loading plugins...", "󰄛 Happy coding!"}
        dashboard.section.footer.opts.hl = "DashboardFooter"

        -- Layout
        dashboard.config.layout = {{
            type = "padding",
            val = 2
        }, dashboard.section.header, {
            type = "padding",
            val = 2
        }, dashboard.section.buttons, {
            type = "padding",
            val = 2
        }, dashboard.section.footer}

        -- Highlights
        vim.api.nvim_set_hl(0, "DashboardHeader", {
            fg = "#89b4fa",
            bold = true
        })

        vim.api.nvim_set_hl(0, "DashboardCenter", {
            fg = "#cba6f7"
        })

        vim.api.nvim_set_hl(0, "DashboardFooter", {
            fg = "#a6adc8",
            italic = true
        })

        vim.api.nvim_set_hl(0, "DashboardShortcut", {
            fg = "#f9e2af",
            bold = true
        })

        alpha.setup(dashboard.config)

        -- Update footer once Lazy has finished loading
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local ok, lazy = pcall(require, "lazy")
                if not ok then
                    return
                end

                local stats = lazy.stats()

                dashboard.section.footer.val = {"",
                                                "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
                                                string.format("⚡ %d plugins loaded in %.2f ms", stats.count,
                    stats.startuptime), "󰄛 Happy coding!"}

                pcall(vim.cmd.AlphaRedraw)
            end
        })

        -- Hide tabline while Alpha is open
        local old_showtabline = vim.o.showtabline

        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
                vim.o.showtabline = 0
            end
        })

        vim.api.nvim_create_autocmd("BufUnload", {
            callback = function(args)
                if vim.bo[args.buf].filetype == "alpha" then
                    vim.o.showtabline = old_showtabline
                end
            end
        })
    end
}
