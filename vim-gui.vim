if !has('gui_running')
  " 解决consle输出乱码
  language messages zh_CN.utf-8
endif

if has('gui_running')
  set guioptions=
  set showtabline=2
  set lines=48 columns=128
  " set switchbuf=usetab
  " au GUIEnter * simalt ~x
endif

" if has('gui_running')
"   map <S-Left> :tabp<CR>
"   map <S-Right> :tabn<CR>
" endif

" pop menu setting
" highlight Pmenu ctermfg=DarkMagenta ctermbg=Blue guifg=#005f87 guibg=#EEE8D5
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" highlight Pmenu guifg=#005f87 guibg=#EEE8D5
" highlight PmenuSel guifg=#AFD700 guibg=#106900
