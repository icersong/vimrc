"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copyright @ 2013-2014 by icersong
" Maintainer: icersong <icersong@gmail.com>
" Created: 2016-12-03
" Modified: 2020-07-23
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python3 support
" let g:python_host_skip_check = 1
" let g:loaded_python_provider = 1
" let g:loaded_python3_provider = 1
" python3:
" $ pip install pynvim jedi flake8 pycodestyle pyflakes sqlparse entrypoints
let PYTHON3HOME = simplify(expand($HOME.'/.pyenv/versions/nvim-py3'))
let g:python3_host_prog = PYTHON3HOME.'/bin/python'
let PYTHON2HOME = simplify(expand($HOME.'/.pyenv/versions/nvim-py2'))
let g:python_host_prog = PYTHON2HOME.'/bin/python'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load main.vim
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
