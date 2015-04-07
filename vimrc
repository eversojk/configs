set background=dark
set encoding=utf-8
set showcmd

syn on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start

autocmd FileType python set autoindent
autocmd FileType mustache set filetype=html
au BufNewFile,BufRead *.as set filetype=java

set hlsearch
set incsearch
set ignorecase
set smartcase

set tags=tags;/

map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

set paste
set ruler
set nu

"switch between header/source with F4"
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Vs vs
:command VS vs

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,python,haskell autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()