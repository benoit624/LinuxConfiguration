"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing setings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on
filetype indent on

" LATEX need vim-latexsuite to work
set grepprg=grep\ -nH\ $*
let g:tex_flavor ="latex"

" General behaviour
set autochdir      " CWD is always same as current file
set ai             " Autoident
set si             " Smartident
set nocompatible   " ViM settings instead of Vi
set smartcase      " Smart casing when searching
set hlsearch       " Highlight matches
set incsearch      " Modern (wrapping) search
set cin            " C indent
highlight OverLength ctermbg=blue ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set expandtab
set shiftwidth=2
set textwidth=79

"set so=0         " number of screen lines to show around the cursor
set wrap          " wrap long lines
set co=80         " width of the display
function! NumberToggle()
  if(&rnu)
    set nornu
  else
    set rnu
  endif
endfunc
nnoremap <tab> :call NumberToggle()<cr>

"set nuw=4         " number of columns to use for the line number


set sh=/bin/bash

" LANGUAGE
set spell         "spelling mistake
set spl=en,fr
set sps=best
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface setings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme desert
let &colorcolumn="80,".join(range(999,999),",")
set showmatch                        " Show matching braces when over one
set ruler                            " Always show current position
set number                           " Always show line-numbers
set mousehide                        " Do not show mouse while typing
set background=dark                  " Dark background variation of theme
set guifont=Georgia\ 10              " Monospaced small font
set guipty
"set gfn=DejaVu

set list
" Show < or > when characters are not displayed on the left or right.
" Also show tabs and trailing spaces.
set list listchars=nbsp:¬,tab:>-,trail:.,precedes:<,extends:>
set cb=unnamed

" copy paste with extern program
nnoremap <C-c> "+y
