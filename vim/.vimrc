"        _                    
"       (_)                   
" __   ___ _ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"                             

set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set cindent
set cinkeys-=0#
set copyindent
set directory-=.
set encoding=utf8
set expandtab
set fileformats=unix,dos,mac
set hidden
set history=200
set hlsearch
set ignorecase
set incsearch
set infercase
set laststatus=2
set linebreak
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " Unicode characters for various things
set shiftwidth=2
set smartcase
set softtabstop=2
set tabstop=2

filetype plugin indent on

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

set background=dark
colorscheme base16-onedark
set t_Co=256 " 256 color mode

syntax on

" Make trailing spaces very visible
highlight SpecialKey ctermbg=Yellow guibg=Yellow

" The sign column slows down remote terminals
highlight clear SignColumn
highlight link SignColumn Ignore

