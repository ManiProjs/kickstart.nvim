return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = {"nvim-tree/nvim-web-devicons"},

    config = function()
        local dashboard = require("dashboard")

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
        local logo = {[[                                              ]],
                      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
                      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
                      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
                      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
                      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
                      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
                      [[                                              ]], [[              ]] .. greeting,
                      [[                                              ]]}

        dashboard.setup({
            theme = "doom",

            config = {
                header = logo,

                center = {{
                    icon = "󰱼 ",
                    desc = " Find File",
                    key = "f",
                    action = "Telescope find_files"
                }, {
                    icon = "󰈚 ",
                    desc = " Recent Files",
                    key = "r",
                    action = "Telescope oldfiles"
                }, {
                    icon = "󰊄 ",
                    desc = " Live Grep",
                    key = "g",
                    action = "Telescope live_grep"
                }, {
                    icon = "󱋡 ",
                    desc = " File Browser",
                    key = "e",
                    action = "Oil"
                }, {
                    icon = "󰒲 ",
                    desc = " Lazy",
                    key = "l",
                    action = "Lazy"
                }, {
                    icon = " ",
                    desc = " Config",
                    key = "c",
                    action = "edit ~/.config/nvim/init.lua"
                }, {
                    icon = "󰩈 ",
                    desc = " Quit",
                    key = "q",
                    action = "qa"
                }},

                footer = function()
                    local stats = require("lazy").stats()

                    return {"",
                            "────────────────────────────────────────────",
                            string.format("⚡ %d plugins loaded in %.2f ms", stats.count, stats.startuptime),
                            "Happy coding ❤️"}
                end
            }
        })

        -- Colors
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
    end
}
