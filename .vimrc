set bs=2

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
"this clears, redraws screen, and mutes search highlighting until new or repeated search command

" Nvim-R
let R_assign = 0
let R_console_width=1000 " used so the R console is split horizontally
let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1

call plug#begin('~/.vim/plugged')
" shorthand notation is to just write 'jalvesaq/Nvim-R'
Plug 'https://github.com/jalvesaq/Nvim-R'
call plug#end()

" Tabs
map <Leader>1 1gt
map <Leader>2 2gt
map <Leader>3 3gt
map <Leader>4 4gt
map <Leader>5 5gt
map <Leader>6 6gt

" Only works in gvim
" for firefox/chrome like swapping
map <D-S-]> gt
map <D-S-[> gT
map <D-0> :tablast<CR>

" move windows around
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l

" adjust window size quickly
nnoremap <Leader><UP> <C-w>+
nnoremap <Leader><DOWN> <C-w>-
nnoremap <Leader><LEFT> <C-w><
nnoremap <Leader><RIGHT> <C-w>>

" set cursorline
" set cursorcolumn

"
"From practical vim:
scriptencoding utf-8
set history=200 " set vim to record last 20 ex commands
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
set foldmethod=marker
syntax on
set number
set mouse
colorscheme desert
" tab spacing
" set tabstop=4  " show existing tab with 4 spaces width
set shiftwidth=4 " when indentifying with '>', use 4 space width
set softtabstop=4
" spaces over tab chars, messes me up in Sublimetext
set smarttab
set expandtab " on pressing tab, insert 4 spaces

set incsearch
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
