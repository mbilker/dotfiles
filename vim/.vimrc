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

set autoindent                  " Carry over indenting from previous line
set autoread                    " Don't bother me hen a file changes
set autowrite                   " Write on :next/:prev/^Z
set backspace=indent,eol,start  " Allow backspace beyond insertion point
set cindent                     " Automatic program indenting
set cinkeys-=0#                 " Comments don't fiddle with indenting
set copyindent                  " Make autoindent use the same chars as prev line
set directory-=.                " Don't store temp files in cwd
set encoding=utf8               " UTF-8 by default
set expandtab                   " No tabs
set fileformats=unix,dos,mac    " Prefer Unix
set hidden                      " Don't prompt to save hidden windows until exit
set history=200                 " How many lines of history to save
set hlsearch                    " Hilight searching
set ignorecase                  " Case insensitive
set incsearch                   " Search as you typeh
set infercase                   " Completion recognizes capitalization
set laststatus=2                " Always show the status bar
set linebreak                   " Break long lines by word, not char
set list                        " Show whitespace as special chars - see listchars
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " Unicode characters for various things
set number                      " Show line numbers
set shiftwidth=2                " Number of spaces to shift for autoindent or >,<
set smartcase                   " Lets you search for ALL CAPS
set softtabstop=2               " Spaces 'feel' like tabs
set tabstop=2                   " The One True Tab

" Essential for filetype plugins.
filetype plugin indent on

" ----------------------------------------------------------------------------
" CUSTOM COMMANDS AND FUNCTIONS
" ----------------------------------------------------------------------------

" Trim spaces at EOL and retab. I run `:CLEAN` a lot to clean up files.
command! TEOL %s/\s\+$//
command! CLEAN retab | TEOL

" ----------------------------------------------------------------------------
" PLUGIN SETTINGS
" ----------------------------------------------------------------------------

" Turn off Rust overriding tab size
let g:rust_recommended_style = 0

" Enable ALE syntax warnings in lightline (everything else is a default)
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'right': [ [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \              [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \ },
      \ }

" ----------------------------------------------------------------------------
" COLORS
" ----------------------------------------------------------------------------

" Make sure colored syntax mode is on, and make it Just Work with 256-color terminals.
set background=dark
colorscheme base16-onedark
if !has('gui_running')
  " workaround for tmux Ctrl-Left and Ctrl-Right support
  if $TERM == "tmux-256color"
    set term=xterm-256color
  endif

  if $TERM == "tmux-256color" || $TERM == "xterm-256color" || $TERM == "screen-256color" || $TERM == "xterm-termite" || $COLORTERM == "gnome-terminal"
    let base16colorspace=256  " Access colors present in 256 colorspace
    set t_Co=256
  endif

  " Disable Background Color Erase when within tmux - https://stackoverflow.com/q/6427650/102704
  if $TMUX != ""
    set t_ut=
  endif
endif
syntax on

" Make background transparent
highlight Normal guibg=NONE ctermbg=NONE

" Make trailing spaces very visible
highlight SpecialKey ctermbg=Yellow guibg=Yellow

" The sign column slows down remote terminals
highlight clear SignColumn
highlight link SignColumn Ignore

" ----------------------------------------------------------------------------
" FILE TYPE TRIGGERS
" ----------------------------------------------------------------------------

" Reset all autocommands
augroup vimrc
autocmd!

"au BufNewFile,BufRead *.rs  setlocal ft=rust shiftwidth=2 ts=2

augroup END
