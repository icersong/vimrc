"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置光标显示样式
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:set_gui_cursor_style()
  highlight CursorColumn guibg=NONE guifg=yellow
  highlight CursorLine gui=underline guibg=NONE guifg=NONE
  highlight Cursor guifg=Red guibg=Yellow
  highlight nCursor guifg=Red guibg=Yellow
  highlight iCursor guifg=Red guibg=Yellow
  highlight vCursor guifg=Red guibg=Yellow
  set guicursor=n-v-c:block-nCursor-blinkon0
  " set guicursor+=v:ver20-vCursor-blinkwait300-blinkon200-blinkoff100
  set guicursor+=r:block-nCursor-blinkwait300-blinkon200-blinkoff100
  set guicursor+=i:ver20-iCursor-blinkwait300-blinkon200-blinkoff100
endfunction


function! s:set_term_cursor_style()
  highlight CursorLine cterm=underline ctermbg=NONE ctermfg=NONE
  if &term =~ '^xterm' || &term == 'xterm-256color' || &term == 'screen-256color' || &term == 'nvim'
    " 1 or 0 -> blinking block
    " 2 -> solid block
    " 3 -> blinking underscore
    " 4 -> solid underscore
    " 5 -> blinking vertical bar
    " 6 -> solid vertical bar
    if exists('$TMUX')
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    else
      let &t_SI = "\<Esc>[6 q"
      let &t_EI = "\<Esc>[2 q"
    endif
  else
    echomsg 'Warning! Can not set cursor style on unknown term "' . &term . '"'
  endif
endfunction


function! cursorstyle#set_cursor_style() abort
  if has('gui_running')
    call s:set_gui_cursor_style()
  else
    call s:set_term_cursor_style()
    if (has('termguicolors') && &termguicolors)
        call s:set_gui_cursor_style()
    endif
  endif
endfunction

" 方法（一）使得terminal的光标变为细线，而不是默认的粗条。这个在vim的普通模式和插入模式都会生效。
" set "gcr=n-v-c:ver25-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor

" 方法（二）在当前用户的./vimrc文件中添加如下代码。效果是，在vim的插入模式时光标变细。
" if has("autocmd")
"   au InsertEnter * silent execute
"     \ "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"   au InsertLeave * silent execute
"     \"!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"   au VimLeave * silent execute
"     \ "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
" endif
