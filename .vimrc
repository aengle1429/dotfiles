"
"From practical vim:
scriptencoding utf-8
set encoding=utf-8
set wildmode=longest,list
"{{{Misc Settings
"
"" Necesary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.  I love this!
"" Show (partial) command in status line.
set showcmd
"
" Folding Stuffs
set foldmethod=marker
syntax on
" line numbers
set number
" mouse support
set mouse
" i like these colors
colorscheme desert
" tab spacing
" set tabstop=4  " show existing tab with 4 spaces width
set shiftwidth=4 " when indentifying with '>', use 4 space width
set softtabstop=4
" spaces over tab chars, messes me up in Sublimetext
set smarttab
set expandtab " on pressing tab, insert 4 spaces
" This is totally awesome - remap jj to escape in insert mode.  You'll never
" type jj anyway, so it's great!
inoremap jj <Esc>
" think about these below. they help with pasting code from somewhere.
" set paste
" set pastetoggle=<F4>
set incsearch
"
" Highlight things that we find with the search
set hlsearch
set ruler                     " show the line number on the bar
set noerrorbells              " No error bells please
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hidden              " Hide buffers when they are abandoned



" Make cursor move as expected with wrapped lines:
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" " All this is LaTeX stuff
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
