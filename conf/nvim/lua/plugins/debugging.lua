return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap",
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

        local lldb_config = {
            {
                name = "Launch",
                type = "lldb",
                request = "launch",
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                args = function()
                    local args_string = vim.fn.input("Input arguments: ")
                    return vim.split(args_string, " ")
                end,
            }
        }

        dap.configurations.c = lldb_config
        dap.configurations.cpp = lldb_config
        dap.configurations.rust = lldb_config

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
