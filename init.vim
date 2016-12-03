"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copyright @ 2013-2014 by icersong
" Maintainer: icersong <icersong@gmail.com>
" Created: 2016-12-03
" Modified: 2016-12-03
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim runtime setting
if has('nvim') && has('mac')
  let $VIM = '/usr/local/share/nvim'
  let $VIMRUNTIME = '/usr/local/share/nvim/runtime'
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
  set runtimepath+=$VIMRUNTIME
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load vimrc
let $VIMFILES = simplify(expand($HOME.'/.vim'))
source $VIMFILES/vimrc/vimrc.vim
