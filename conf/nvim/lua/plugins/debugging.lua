return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("dapui").setup()

        dap.adapters.lldb = {
            type = "executable",
            command = "/usr/bin/lldb-dap",
            name = "lldb",
        }

        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = true,
                args = {},
            },
        }

        dap.configurations.c = dap.configurations.cpp

        local function open_dapui()
            dapui.open()
        end

        local function close_dapui()
            dapui.close()
        end

        dap.listeners.before.attach.dapui_config = open_dapui
        dap.listeners.before.launch.dapui_config = open_dapui
        dap.listeners.before.event_terminated.dapui_config = close_dapui
        dap.listeners.before.event_exited.dapui_config = close_dapui

        vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint)
        vim.keymap.set("n", "<Leader>dc", dap.continue)
        vim.keymap.set("n", "<Leader>dd", dap.disconnect)
    end,
}
