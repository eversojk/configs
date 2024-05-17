-- C:\Users\...\AppData\Local\nvim\init.lua

vim.cmd("language en_US")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'fatih/molokai',
    'vim-airline/vim-airline',
    'vim-airline/vim-airline-themes'
})

vim.opt.autowrite = true
vim.opt.ai = true
vim.opt.clipboard = "unnamed"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.showcmd = true
vim.opt.smartcase = true
vim.opt.tabstop = 4

-- prevent typo when pressing `wq` or `q`
vim.cmd [[
    cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
    cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
    cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
    cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
    cnoreabbrev <expr> wQ ((getcmdtype() is# ':' && getcmdline() is# 'wQ')?('wq'):('wQ'))
]]

vim.g.molokai_original = 1
vim.g.rehash256 = 1
vim.cmd('colorscheme molokai')

-- airline
vim.g.airline_theme = 'google_dark'
vim.g.airline_section_z = "%l% :%c%  %p%%"
