return {
    {
        'fatih/molokai',
        config = function()
            vim.g.molokai_original = 1
            vim.g.rehash256 = 1
            vim.cmd('colorscheme molokai')
        end
    },
    {
        'vim-airline/vim-airline',
    },
    {
        'vim-airline/vim-airline-themes',
        config = function()
            vim.g.airline_theme = 'google_dark'
            vim.g.airline_section_z = "%l% :%c%  %p%%"
        end
    },
}
