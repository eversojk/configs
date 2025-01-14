local function does_file_exists(file_path)
    local file = io.open(file_path, "r")
    local found = false

    if file ~= nil then
        found = true
        io.close(file)
    end

    return found
end

-- ubuntu & arch installs can have different executable names
local function find_lldb_exec()
    local possible_execs = { "/usr/bin/lldb-dap", "/usr/bin/lldb-vscode-14" }

    for i = 1, #possible_execs do
        if does_file_exists(possible_execs[i]) then
            return possible_execs[i]
        end
    end

    return nil
end

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

        local lldb_exec_path = find_lldb_exec()

        dap.adapters.lldb = {
            type = "executable",
            command = lldb_exec_path,
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
        dap.configurations.rust = dap.configurations.cpp

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
