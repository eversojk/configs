vim.opt.autowrite = true
vim.opt.ai = true
vim.opt.clipboard = "unnamed"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.showcmd = true
vim.opt.smartcase = true
vim.opt.tabstop = 4

-- prevent typo when pressing `wq` or `q`
vim.cmd([[
    cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
    cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
    cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
    cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
    cnoreabbrev <expr> wQ ((getcmdtype() is# ':' && getcmdline() is# 'wQ')?('wq'):('wQ'))
]])
