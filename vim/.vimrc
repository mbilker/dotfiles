"        _
"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"

" ----------------------------------------------------------------------------
" OPTIONS
" ----------------------------------------------------------------------------

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
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " Unicode characters for various things
set number
set shiftwidth=2
set smartcase
set softtabstop=2
set tabstop=2

" Essential for filetype plugins.
filetype plugin indent on

" ----------------------------------------------------------------------------
" CUSTOM COMMANDS AND FUNCTIONS
" ----------------------------------------------------------------------------

command! TEOL %s/\s\+$//

" ----------------------------------------------------------------------------
" PLUGIN SETTINGS
" ----------------------------------------------------------------------------

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" ----------------------------------------------------------------------------
" COLORS
" ----------------------------------------------------------------------------

" Make sure colored syntax mode is on, and make it Just Work with 256-color terminals.
set background=dark
colorscheme base16-onedark
if !has('gui_running')
  let base16colorspace=256  " Access colors present in 256 colorspace
  if $TERM == "xterm-256color" || $TERM == "screen-256color" || $TERM == "xterm-termite" || $COLORTERM == "gnome-terminal"
    set t_Co=256
  endif
endif
syntax on

" Make trailing spaces very visible
highlight SpecialKey ctermbg=Yellow guibg=Yellow

" The sign column slows down remote terminals
highlight clear SignColumn
highlight link SignColumn Ignore

