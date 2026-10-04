return {{
    "mfussenegger/nvim-dap",
    dependencies = {"rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio", "jay-babu/mason-nvim-dap.nvim"},

    keys = {{
        "<leader>db",
        function()
            require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint"
    }, {
        "<leader>dB",
        function()
            require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Conditional breakpoint"
    }, {
        "<leader>dc",
        function()
            require("dap").continue()
        end,
        desc = "Continue"
    }, {
        "<leader>di",
        function()
            require("dap").step_into()
        end,
        desc = "Step into"
    }, {
        "<leader>do",
        function()
            require("dap").step_over()
        end,
        desc = "Step over"
    }, {
        "<leader>dO",
        function()
            require("dap").step_out()
        end,
        desc = "Step out"
    }, {
        "<leader>dr",
        function()
            require("dap").repl.open()
        end,
        desc = "Open REPL"
    }, {
        "<leader>du",
        function()
            require("dapui").toggle()
        end,
        desc = "Toggle debug UI"
    }, {
        "<leader>dq",
        function()
            require("dap").terminate()
        end,
        desc = "Terminate debugger"
    }},

    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end
}}
