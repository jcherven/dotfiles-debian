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
"set background=dark

" General Keybindings
map <SPACE> <leader>
nnoremap <C-J> <C-w><C-J>
nnoremap <C-K> <C-w><C-K>
nnoremap <C-L> <C-w><C-L>
nnoremap <C-H> <C-w><C-H>
nnoremap <space> :
set mouse=a

call plug#begin('~/.vim/plugged')
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'jeffKreeftmeijer/vim-numbertoggle'
  Plug 'mkitt/tabline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'dense-analysis/ale' "{{{
    let g:ale_fix_on_save=1
    let g:ale_linters_explicit=1
    let g:ale_javascript_prettier_options='--single-quote'
    let g:ale_linters={
          \ 'vim': ['prettier'],
          \ 'javascript': ['prettier'],
          \ 'css': ['prettier'],
          \ 'sass': ['prettier'],
          \ 'html': ['prettier'],
          \ 'json': ['prettier'],
          \ 'markdown': ['prettier']
    \}
    let g:ale_fixers={
	  \ 'vim': ['prettier'],
          \ 'javascript': ['prettier'],
          \ 'css': ['prettier'],
          \ 'sass': ['prettier'],
          \ 'html': ['prettier'],
          \ 'json': ['prettier'],
          \ 'markdown': ['prettier']
    \}
    "}}}
  Plug 'scrooloose/nerdtree' "{{{
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    map <C-n> :NERDTreeToggle<CR>
    let NERDTreeMinimalUI=1
    let g:NERDTreeWinPos = "left"
    let g:NERDTreeShowLineNumbers=1
    let g:NERDTreeDirArrows=1
    let g:NERDTreeAutoDeleteBuffer=1
    let g:NERDTreeShowHidden=1
    let g:NERDTreeSortHiddenFirst=1
    let g:NERDTreeMapJumpParent = "h"
    let g:NERDTreeMapActivateNode = "l"
    let g:NERDTreeQuitOnOpen=1
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'mortonfox/nerdtree-clip'
  "}}}
  Plug 'sickill/vim-pasta'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'easymotion/vim-easymotion'
    map m <plug>(easymotion-prefix)
  Plug 'wesq3/vim-windowswap'
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'djoshea/vim-autoread'
  Plug 'jiangmiao/auto-pairs'
  Plug 'sheerun/vim-polyglot'
  Plug 'mattn/emmet-vim'
    let g:user_emmet_leader_key=','
  " Plugins which only work with neovim are called in here
  if has('nvim')
    " Code completion. See github.com/neoclide/coc.nvim/wiki/ for usage help {{{
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
    Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'}
    Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
    Plug 'iamcco/coc-spell-checker', {'do': 'yarn install --frozen-lockfile'}
    " }}}
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

" Settings needed for the CoC code completion plugin {{{
  set hidden
  set nobackup
  set nowritebackup
  set updatetime=300
  " These are optional
  set cmdheight=2
  set shortmess+=c
  set signcolumn=no
  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
" End CoC settings }}}

if PlugLoaded('vim-fromtermcolors')
  colorscheme fromtermcolors
else
  colorscheme default
endif

" ex: set noexpandtab nolist foldmethod=marker:
