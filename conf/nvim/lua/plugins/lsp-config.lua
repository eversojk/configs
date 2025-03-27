local language_servers = {
    "clangd",
    "cmake",
    "lua_ls",
}

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = language_servers,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local lspconfig = require("lspconfig")

            for _, ls in pairs(language_servers) do
                local setup_args = { capabilities = cmp_nvim_lsp.default_capabilities() }

                -- fixes warning regarding multiple different client offset_encodings
                if ls == "clangd" then
                    setup_args.cmd = { "clangd", "--offset-encoding=utf-16" }
                end

                lspconfig[ls].setup(setup_args)
            end

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<leader>lh', vim.cmd.ClangdSwitchSourceHeader, {})
        end,
    },
}
