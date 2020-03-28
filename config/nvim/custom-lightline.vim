function! FileNameWithIcon() abort
  let fileNerdSymbol = WebDevIconsGetFileTypeSymbol()
  return winwidth(0) > 30  ?  fileNerdSymbol . ' ' . expand('%f') : fileNerdSymbol . ' ' . expand('%t')
endfunction

function! FileNameWithParent(f) abort
  if expand('%:t') ==# ''
    return expand('%:p:h:t')
  else
    return expand('%:p:h:t') . "/" . expand("%:t")
  endif
endfunction

function! Git_branch() abort
  if fugitive#head() !=# ''
    return  " " . fugitive#head()
  else
    return "\e0a0"
  endif
endfunction

function! LightlineReadonly()
  " return &readonly && &filetype !=# 'help' ? '' : ''
  return &modifiable ? '' : ''
endfunction

let g:lightline = {
  \ 'mode_map': {
    \ 'n' : 'n',
    \ 'i' : 'i',
    \ 'R' : 'R',
    \ 'v' : 'v',
    \ 'V' : 'V',
    \ "\<C-v>": 'VB',
    \ 'c' : 'c',
    \ 's' : 's',
    \ 'S' : 'S',
    \ "\<C-s>": 'SB',
    \ 't': 't',
  \ },
\ }
let g:lightline.component = {
  \ 'filename_with_icon': '%{FileNameWithIcon()}',
  \ 'vim_logo': "\ue7c5 ",
  \ 'git_branch': '%{Git_branch()}',
  \ 'filename_with_parent': '%t',
  \ 'readonly': '%{LightlineReadonly()}',
\ }
" let g:lightline.active = {
"   \ 'left': [ ['mode'], ['filename_with_icon', 'readonly']],
"   \ 'right': [['lineinfo']]
"   \ }

let g:lightline.tabline = {
  \ 'left': [ [ 'vim_logo'], [ 'tabs' ] ],
  \ 'right': [ [ 'git_branch' ]]
  \ }
let g:lightline.tab = {
  \ 'active': ['filename_with_parent'],
  \ 'inactive': ['filename']
  \ }

let g:lightline.tab_component = {}
let g:lightline.tab_component_function = {
  \ 'artify_filename': 'lightline_tab_filename',
  \ 'filename': 'lightline#tab#filename',
  \ 'modified': 'lightline#tab#modified',
  \ 'readonly': 'lightline#tab#readonly',
  \ 'tabnum': 'lightline#tab#tabnum',
  \ 'filename_with_parent': 'FileNameWithParent'
  \ }

