return {
    {
        "vim-airline/vim-airline",
    },
    {
        "vim-airline/vim-airline-themes",
        config = function()
            vim.g.airline_theme = "google_dark"
            vim.g.airline_section_z = "%l% :%c%  %p%%"
        end,
    },
}
