" vi:syntax=vim

set nocompatible
set directory^=$HOME/.vim/tmp//
set encoding=utf-8
set fileformats=unix,dos,mac
set t_Co=256
set lazyredraw
set clipboard=unnamed
set backspace=indent,eol,start
set showtabline=2
set noshowmode
set autoread
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set linebreak
set breakindent
set magic
set number
set autochdir
set cursorline
set scrolloff=8
set splitbelow
set splitright
map <SPACE> <leader>
nnoremap <C-J> <C-w><C-J>
nnoremap <C-K> <C-w><C-K>
nnoremap <C-L> <C-w><C-L>
nnoremap <C-H> <C-w><C-H>
nnoremap <space> :
set mouse=a
set signcolumn=no

call plug#begin('~/.vim/plugged')
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'jeffKreeftmeijer/vim-numbertoggle'
  Plug 'mkitt/tabline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdtree'
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    map <C-n> :NERDTreeToggle<CR>
    let NERDTreeMinimalUI=1
    let g:NERDTreeWinPos = "left"
    let g:NERDTreeShowLineNumbers=1
    let g:NERDTreeDirArrows=1
    let g:NERDTreeAutoDeleteBuffer=1
    let g:NERDTreeShowHidden=1
    let g:NERDTreeMapJumpParent = "h"
    let g:NERDTreeMapActivateNode = "l"
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'mortonfox/nerdtree-clip'
  Plug 'sickill/vim-pasta'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'easymotion/vim-easymotion'
  Plug 'wesq3/vim-windowswap'
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'djoshea/vim-autoread'
  Plug 'jiangmiao/auto-pairs'
call plug#end()

" Jummiterm colors from terminal
" Neovim terminal colours
if has("nvim")
  let g:terminal_color_0 =  "#1f2022"
  let g:terminal_color_1 =  "#f2241f"
  let g:terminal_color_2 =  "#67b11d"
  let g:terminal_color_3 =  "#b1951d"
  let g:terminal_color_4 =  "#4f97d7"
  let g:terminal_color_5 =  "#a31db1"
  let g:terminal_color_6 =  "#2d9574"
  let g:terminal_color_7 =  "#a3a3a3"
  let g:terminal_color_8 =  "#585858"
  let g:terminal_color_9 =  "#f2241f"
  let g:terminal_color_10 = "#67b11d"
  let g:terminal_color_11 = "#b1951d"
  let g:terminal_color_12 = "#4f97d7"
  let g:terminal_color_13 = "#a31db1"
  let g:terminal_color_14 = "#2d9574"
  let g:terminal_color_15 = "#f8f8f8"
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_5
  if &background == "light"
    let g:terminal_color_background = g:terminal_color_7
    let g:terminal_color_foreground = g:terminal_color_2
  endif
elseif has('terminal')
  let g:terminal_ansi_colors = [
        \ "#1f2022",
        \ "#f2241f",
        \ "#67b11d",
        \ "#b1951d",
        \ "#4f97d7",
        \ "#a31db1",
        \ "#2d9574",
        \ "#a3a3a3",
        \ "#585858",
        \ "#f2241f",
        \ "#67b11d",
        \ "#b1951d",
        \ "#4f97d7",
        \ "#a31db1",
        \ "#2d9574",
        \ "#f8f8f8",
        \ ]
endif

