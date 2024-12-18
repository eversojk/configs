return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        --require('nvim-treesitter.install').compilers = { "clang" }

        configs.setup({
            ensure_installed = { "lua", "vim", "cpp", "python" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
