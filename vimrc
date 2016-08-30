" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
filetype off

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'plasticboy/vim-markdown'

Bundle 'blerins/flattown'

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on
syn on

set background=dark
set backspace=indent,eol,start
set encoding=utf-8
set hlsearch    "highlight search results
set ignorecase  "ignore case for search results
set incsearch   "incremental search results
set nocompatible
set number      "line numbers
set paste       "enable pasting from clipboard
set ruler       "enable ruler
set rulerformat+=%f:%c "show file and column number
set showcmd
set smartcase
set tags=tags;/
set title
set ai
set cursorline
set t_Co=256
set clipboard+=unnamedplus

colorscheme flattown

autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufNewFile,BufRead .jshintrc set filetype=javascript

map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"switch between header/source with F4"
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Vs vs
:command VS vs

" 2 spaces for tabs
set expandtab
set tabstop=2
set shiftwidth=2

let g:ycm_global_ycm_extra_conf = '~/.config/ycm/ycm.py'
let g:vim_markdown_folding_disabled = 1
