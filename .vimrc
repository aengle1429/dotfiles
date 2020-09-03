""""""Pugins
call plug#begin()
" shorthand notation is to just write 'jalvesaq/Nvim-R'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot' " Better Syntax Support
Plug 'scrooloose/NERDTree' " File Explorer
Plug 'jiangmiao/auto-pairs' " Auto pairs for '(' '[' '{'
Plug 'vim-airline/vim-airline'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'https://github.com/jalvesaq/Nvim-R'
call plug#end()
" Nvim-R
let R_assign = 0
let R_console_width=1000 " used so the R console is split horizontally
let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1

let g:mapleader = "\<Space>"
" Tabs
map <Leader>1 1gt
map <Leader>2 2gt
map <Leader>3 3gt
map <Leader>4 4gt
map <Leader>5 5gt
map <Leader>6 6gt
"this clears, redraws screen, and mutes search highlighting until new or repeated search command
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" Better tabbing
vnoremap < <gv
vnoremap > >gv
" Make cursor move as expected with wrapped lines:
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
" Terminal Mode in NeoVim
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
  " Terminal mode:
  tnoremap <C-h> <c-\><C-n><C-w>h
  tnoremap <C-j> <c-\><C-n><C-w>j
  tnoremap <C-k> <c-\><C-n><C-w>k
  tnoremap <C-l> <c-\><C-n><C-w>l
  " Insert mode:
  inoremap <C-h> <Esc><C-w>h
  inoremap <C-j> <Esc><C-w>j
  inoremap <C-k> <Esc><C-w>k
  inoremap <C-l> <Esc><C-w>l
  " Visual mode:
  vnoremap <C-h> <Esc><C-w>h
  vnoremap <C-j> <Esc><C-w>j
  vnoremap <C-k> <Esc><C-w>k
  vnoremap <C-l> <Esc><C-w>l
  " Normal mode:
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
  " Paste
  tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
endif

colorscheme desert
syntax on
filetype plugin on
scriptencoding utf-8

" set cursorline
" set cursorcolumn
" set tabstop=4  " show existing tab with 4 spaces width
set bs=2
set showtabline=2 "Always show vim tabs
set history=200 " set vim to record last 20 ex commands
set encoding=utf-8
set wildmode=longest,list
set nocompatible "" Necesary  for lots of cool vim things
set showcmd "" Show (partial) command in status line.
set foldmethod=marker
set rnu  " set relative numbering
set number " the combination of number, rnu means the current line is not 0
set mouse
set shiftwidth=4 " when indentifying with '>', use 4 space width
set softtabstop=4
set smarttab " spaces over tab chars, messes me up in Sublimetext
set expandtab " on pressing tab, insert 4 spaces
set incsearch " Jump to matched search
set hlsearch " highlight search, see above for command to erase the highlighting afterwards
set ruler                     " show the line number on the bar
set noerrorbells              " No error bells please
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hidden              " Hide buffers when they are abandoned

