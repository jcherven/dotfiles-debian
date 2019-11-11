" vi:syntax=vim

set nocompatible
set directory^=$HOME/.vim/tmp//
set encoding=utf-8
set fileformats=unix,dos,mac
"set t_Co=256
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
  " Only show the cursorline in the active window
  augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
  augroup END
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
set background=dark


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
  " Plugins which only work with nvim are called in here
  if has('nvim')
    Plug 'jcherven/vim-fromtermcolors'
    " Plug '~/Desktop/vim-fromtermcolors'
  endif
call plug#end()

function PlugLoaded(name)
  return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir) &&
        \ stridx(&rtp, g:plugs[a:name].dir >= 0))
endfunction

if PlugLoaded('vim-fromtermcolors')
  colorscheme fromtermcolors
endif

" ex: set noexpandtab nolist foldmethod=marker:
