local formatters_to_install = {
    "clang_format",
    "cmakelang",
    "jq",
    "stylua",
}

return {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
    },
    config = function()
        local none_ls = require("null-ls")
        local mason_none_ls = require("mason-null-ls")

        none_ls.setup()

        mason_none_ls.setup({
            automatic_installation = true,
            ensure_installed = formatters_to_install,
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
