"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copyright @ 2013-2014 by icersong
" Maintainer: icersong <icersong@gmail.com>
" Created: 2016-12-03
" Modified: 2019-05-16
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim runtime setting
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" if has('nvim') && $MACOS
"   set shell=/bin/bash
"   let g:python_host_skip_check = 1
"   let g:python_host_prog = simplify(expand('~/.virtualenvs/py2.7/bin/python'))
"   let g:python3_host_prog = '/usr/local/bin/python3'
"   let g:loaded_python_provider = 1
"   let g:loaded_python3_provider = 1
" endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python3 support
let g:python3_host_prog = '/usr/local/bin/python3.7'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load main.vim
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
