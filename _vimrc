set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction



""""""""""""""""""""""
" 2015-07-09 mrqyoung
""""""""""""""""""""""
set fileencodings=utf-8,gbk,ucs-bom
set fileencoding=utf-8
set termencoding=utf-8

:nmap <F2> :nohls<cr>
:nmap <F3> :set number
:imap <F3> mrqyoung-<C-R>=strftime("%Y%m%d")<CR>
autocmd FileType python nnoremap <buffer> <silent> <F5> :exec '!\%py3\%' shellescape(@%, 1)<cr>
colorscheme molokai
"colorscheme slate
"set guifont=YaHei\ Consolas\ Hybrid:h12:cANSI
set guifont=Consolas:h12
set guifontwide=Microsoft\ Yahei\ Mono:h12
"set guifont=Microsoft\ Yahei\ Mono:h12:cANSI

set go=
set nowrapscan
set softtabstop=4
set shiftwidth=4
set expandtab
"set noexpandtab
set patchmode=.bak
set number
set ignorecase smartcase

