" vi:syntax=vim

set nocompatible
set directory^=$HOME/.vim/tmp//
set encoding=utf-8
set fileformats=unix,dos,mac
" set textwidth=80
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
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smartindent
set linebreak
set breakindent
set magic
set number
set noautochdir
set cursorline
  " Only show the cursorline in the active window {{{
  augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
  augroup END
  " }}}
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

" Use in a conditional statement to check if a plugin is installed
" if PlugLoaded('plugin-name') do something endif
function PlugLoaded(name)
  return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir) &&
        \ stridx(&rtp, g:plugs[a:name].dir >= 0))
endfunction

call plug#begin('~/.vim/plugged')
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'jeffKreeftmeijer/vim-numbertoggle'
  Plug 'gcmt/taboo.vim'
    let g:taboo_modified_tab_flag="[+]"
    let g:taboo_tab_format="| %N:%P%m | "
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
    " Function for smart NERDTree toggle behavior.
    " Call on the NERDTree toggle keybinding.
    " Performs NERDTreeFind on open, toggles the buffer on close.
    function! NERDTreeFindToggle()
      if exists("g:NERDTree") && g:NERDTree.IsOpen()
	NERDTreeClose
      elseif filereadable(expand('%'))
	NERDTreeFind
      else
	NERDTree
      endif
    endfunction
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " The underscore maps to / for some reason
    map <C-_> :call NERDTreeFindToggle()<CR>
    let g:NERDTreeMapJumpParent = "h"
    let g:NERDTreeMapActivateNode = "l"
    let NERDTreeMinimalUI=1
    let g:NERDTreeWinPos = "left"
    let g:NERDTreeShowLineNumbers=1
    let g:NERDTreeDirArrows=1
    let g:NERDTreeAutoDeleteBuffer=1
    let g:NERDTreeShowHidden=1
    let g:NERDTreeSortHiddenFirst=1
    let g:NERDTreeQuitOnOpen=1
    let g:NERDTreeStatusline="| menu:m | help:? |"
    Plug 'Xuyuanp/nerdtree-git-plugin'
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
  Plug 'alvan/vim-closetag' " {{{
    " filenames like *.xml, *.html, *.xhtml, ...
    " These are the file extensions where this plugin is enabled.
    let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
    " filenames like *.xml, *.xhtml, ...
    " This will make the list of non-closing tags self-closing in the specified files.
    let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
    " filetypes like xml, html, xhtml, ...
    " These are the file types where this plugin is enabled.
    let g:closetag_filetypes = 'html,xhtml,phtml,javascript'
    " filetypes like xml, xhtml, ...
    " This will make the list of non-closing tags self-closing in the specified files.
    let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript'
    " integer value [0|1]
    " This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
    let g:closetag_emptyTags_caseSensitive = 1
    " dict
    " Disables auto-close if not in a "valid" region (based on filetype)
    let g:closetag_regions = {
	\ 'typescript.tsx': 'jsxRegion,tsxRegion',
	\ 'javascript.jsx': 'jsxRegion',
	\ }
    " Shortcut for closing tags, default is '>'
    let g:closetag_shortcut = '>'
    " Add > at current position without closing the current tag, default is ''
    let g:closetag_close_shortcut = '<leader>>' "}}}
  Plug 'dbakker/vim-projectroot' "{{{
    function! <SID>AutoProjectRootCD()
      try
        if &ft != 'help'
          ProjectRootCD
        endif
      catch
      " Silently ignore invalid buffers
      endtry
    endfunction

    autocmd BufEnter * call <SID>AutoProjectRootCD()
  "}}}
  Plug 'lifepillar/vim-colortemplate'
	Plug '~/Desktop/vim-jummiterm'
	Plug 'kamykn/dark-theme.vim'
	Plug 'smallwat3r/vim-efficient'
	Plug '~/Desktop/jummidark.vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'cakebaker/scss-syntax.vim'

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
    Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
    Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'}
    Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
    Plug 'iamcco/coc-spell-checker', {'do': 'yarn install --frozen-lockfile'}
    " }}}
    " Plug 'jcherven/vim-fromtermcolors'
    Plug '~/Desktop/vim-fromtermcolors'
  endif
call plug#end()

" Statusline Configuration {{{
" Left alignment for the below customizations
set statusline=
  set statusline+=\ 
  " Git status information if using vim-fugitive
  if PlugLoaded('vim-fugitive')
    fun! GitInfo()
      let git = fugitive#head()
      if git != ''
        return '( '.git.')'
      else
        return ''
      endif
    endfunction
    set statusline+=%{GitInfo()}
  endif
  " Current buffer's file path relative to the git project root
  set statusline+=\ %f
  " Read Only marker
  set statusline+=%{&modifiable?'':'\ '}
  " Modified marker
  set statusline+=%{&modified?'[+]':''}
" Right alignment for the below customizations
set statusline+=%=
  " Current filetype
  set statusline+=%y
  " Current line number,column number
  set statusline+=%0*\ %l,%2c\ %3p%%\ 
" End Statusline Config }}}

colorscheme jummidark
" if PlugLoaded('vim-fromtermcolors')
"   colorscheme fromtermcolors
" else
"   colorscheme default
" endif

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
  highlight CocCodeLens ctermfg=8 guifg=8
" End CoC settings }}}

" ex: set noexpandtab nolist foldmethod=marker:
