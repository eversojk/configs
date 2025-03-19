return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local mason_nvim_dap = require("mason-nvim-dap")

        dap.set_exception_breakpoints()

        mason_nvim_dap.setup({
            ensure_installed = { "codelldb" },
            handlers = {
                codelldb = function(config)
                    config.adapters = {
                        type = "executable",
                        command = "/usr/bin/lldb-dap",
                        name = "codelldb",
                    }

                    config.configurations[1].args = function()
                        local args_string = vim.fn.input("RIGHT ON!!! Input arguments: ")
                        return vim.split(args_string, " ")
                    end

                    mason_nvim_dap.default_setup(config)
                end,
            },
        })

        require("dapui").setup()

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
