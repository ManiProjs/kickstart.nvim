return {{
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- =================================================================
        -- Header
        -- =================================================================

        dashboard.section.header.val = {"                                                     ",
                                        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                                        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                                        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                                        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                                        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                                        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                                        "                                                     "}

        -- =================================================================
        -- Greeting
        -- =================================================================

        local hour = tonumber(os.date("%H"))

        local greeting

        if hour < 12 then
            greeting = "Good morning."
        elseif hour < 18 then
            greeting = "Good afternoon."
        else
            greeting = "Good evening."
        end

        dashboard.section.header.val = vim.list_extend(dashboard.section.header.val, {"", greeting, ""})

        -- =================================================================
        -- Buttons
        -- =================================================================

        local button = dashboard.button

        dashboard.section.buttons.val = {button("f", "󰈞  Find File", "<cmd>Telescope find_files<CR>"),
                                         button("r", "󰋚  Recent Files", "<cmd>Telescope oldfiles<CR>"),
                                         button("g", "󰱼  Live Grep", "<cmd>Telescope live_grep<CR>"),
                                         button("p", "󰉋  Projects", "<cmd>Telescope projects<CR>"),
                                         button("e", "󰙅  Explorer", "<cmd>Neotree toggle<CR>"),
                                         button("m", "󰒋  Mason", "<cmd>Mason<CR>"),
                                         button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
                                         button("c", "  Config",
            "<cmd>edit " .. vim.fn.stdpath("config") .. "/init.lua<CR>"), button("q", "󰗼  Quit", "<cmd>qa<CR>")}

        -- =================================================================
        -- Footer
        -- =================================================================

        local function footer()
            local stats = require("lazy").stats()

            local ms = math.floor(stats.startuptime * 100 + 0.5) / 100

            return {"", "󰂖  " .. stats.loaded .. " / " .. stats.count .. " plugins loaded",
                    "󰅐  " .. ms .. "ms startup"}
        end

        dashboard.section.footer.val = footer()

        -- =================================================================
        -- Layout
        -- =================================================================

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

        -- =================================================================
        -- Styling
        -- =================================================================

        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"

        -- =================================================================
        -- Hide bufferline on dashboard
        -- =================================================================

        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
                vim.opt.showtabline = 0
            end
        })

        vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            callback = function()
                if vim.bo.filetype == "alpha" then
                    vim.opt.showtabline = 2
                end
            end
        })

        -- =================================================================
        -- Start
        -- =================================================================

        alpha.setup(dashboard.config)
    end
}}
