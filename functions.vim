"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function for test command is exists
function! HasCmdValid(cmd)
  return !!len(matchstr(execute('command ' . a:cmd), ' ' . a:cmd . ' '))
endfunction

" function for test function is exists
function! HasFuncValid(cmd)
  return len(execute('function /^' . a:cmd . '$'))
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置光标显示样式
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetGuiCursorStyle()
  highlight CursorLine gui=underline guibg=NONE guifg=NONE
  highlight Cursor guifg=Red guibg=Yellow
  highlight nCursor guifg=Red guibg=Yellow
  highlight iCursor guifg=Red guibg=Yellow
  highlight vCursor guifg=Red guibg=Yellow
  " set guicursor=n-v-c:block-nCursor-blinkon0
  " set guicursor+=v:ver20-vCursor-blinkwait300-blinkon200-blinkoff100
  set guicursor=n-c:block-nCursor-blinkon0
  set guicursor+=v:ver100-vCursor-blinkwait300-blinkon100-blinkoff300
  set guicursor+=r:block-nCursor-blinkwait300-blinkon100-blinkoff300
  set guicursor+=i:ver20-iCursor-blinkwait300-blinkon200-blinkoff100
endfunction


function! SetTermCursorStyle()
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


function! SetCursorStyle()
  if has('gui_running')
    call SetGuiCursorStyle()
  else
    call SetTermCursorStyle()
  endif
endfunction

" 方法（一）使得terminal的光标变为细线，而不是默认的粗条。这个在vim的普通模式和插入模式都会生效。
" set "gcr=n-v-c:ver25-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor

" 方法（二）在当前用户的./vimrc文件中添加如下代码。效果是，在vim的插入模式时光标变细。
" if has("autocmd")
"   au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"   au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"   au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugin's config 

function! s:esc(path)
  return escape(a:path, ' ')
endfunction

function! s:lines(msg)
  return split(a:msg, "[\r\n]")
endfunction

function! s:glob(from, pattern)
  return s:lines(globpath(a:from, a:pattern))
endfunction

function! s:filedict(path, pre, ext)
  let lene = strlen(a:ext)
  let lenp = strlen(a:pre)
  let kws = {}
  for name in s:glob(a:path, a:pre.'*'.a:ext)
    let fname = split(name, $SEP)[-1]
    let kws[strpart(fname, lenp, len(fname) - lenp - lene)] = name
  endfor
  return kws
endfunction

function! LoadConfigures(path, names)
  let vimkvs = s:filedict(a:path, 'plug-', '.vim')
  for name in a:names
    if has_key(vimkvs, name)
      execute 'source ' . s:esc(vimkvs[name])
    endif
  endfor
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" displays a sample of all 256 cterm colors, by appending to the current buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ShowColorTable()
  let num = 255
  while num >= 0
      exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
      exec 'syn match col_'.num.' "ctermbg='.num.':...." containedIn=ALL'
      call append(0, 'ctermbg='.num.':....')
      let num = num - 1
  endwhile
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format xml file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function FormatXML()
    set filetype=xml
    :%s/></>\r</g
    :normal gg=G<cr>
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GetVisualRange 获取当前选中内容
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search for other instances of the current visual range
" <C-R>=               Insert the result of an expression on
"                      the search line (see :help c_CTRL-R_= )
"vmap ,/ <ESC>/<C-R>=GetVisualRange()<CR><CR>

" Create the function that extracts the contents of the visual range
function! GetVisualRange()
    " Get the start and end positions of the current range
    let StartPosition = getpos("'<")
    let EndPosition = getpos("'>")

    " Prefix the range with \V to disable "magic"
    " See :help \V
    let VisualRange = ''

    " If the start and end of the range are on the same line
    if StartPosition[1] == EndPosition[1]
      " Just extract the relevant part of the line
      let VisualRange .= getline(StartPosition[1])[StartPosition[2]-1:EndPosition[2]-1]
    else
      " Otherwise, get the end of the first line
      let VisualRange .= getline(StartPosition[1])[StartPosition[2]-1:]
      " Then the all of the intermediate lines
      for LineNum in range(StartPosition[1]+1, EndPosition[1]-1)
        let VisualRange .= "\r" . getline(LineNum)
      endfor
      " Then the start of the last line
      let VisualRange .= "\r" . getline(EndPosition[1])[:EndPosition[2]-1]
    endif
    " Replace legitimate backslashes with double backslashes to prevent
    " a literal \t being interpreted as a tab
    "let VisualRange = substitute(VisualRange, '\\[nV]\@!', '\\\\', "g")

    " Return the result
    return VisualRange
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FormatSQL 格式化选中的SQL内容，并更新到当前光标处
" depends shell.vim, GetVisualRange
" command! -nargs=? -bar -range=% -bang FormatSQL call FormatSQL()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FormatSQL() range
  let tempfile = tempname()
  echomsg tempfile
  call writefile([GetVisualRange()], tempfile, "b")
  if executable('sqlformat')
    silent execute '!sqlformat -r ' . tempfile . ' -o ' . tempfile
    silent execute 'r!cat ' . tempfile
  else
    echomsg "Can not found sql formaters (sqlformat, ...)"
  endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 将所选内容写入指定文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! WriteSelected(filename) range
  call writefile([GetVisualRange()], a:filename, 'b')
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe build function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --js-completer
  endif
endfunction
