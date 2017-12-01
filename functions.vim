"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function for test command is exists
function! HasCmdValid(cmd)
  if g:iswin
    return executable(a:cmd)
  endif
  if g:islinux
    return executable(a:cmd)
  endif
  if g:ismacos
    let cc = execute('command ' . a:cmd)
    if len(matchstr(cc, ' '.a:cmd.' '))
      return 1
    endif
  endif
  return 0
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 调整光标显示样式
function! SetCursorStyle()
  " cursor setting
  if has('gui_running')
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
  else
    if &term =~ '^xterm'
      " 1 or 0 -> blinking block
      " 2 -> solid block
      " 3 -> blinking underscore
      " 4 -> solid underscore
      " 5 -> blinking vertical bar
      " 6 -> solid vertical bar
      if &term == 'xterm-256color' || &term == 'screen-256color'
        let &t_SI = "\<Esc>[6 q"
        let &t_EI = "\<Esc>[2 q"
      endif
      if exists('$TMUX')
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      endif
    endif
  endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VSearch
" Search for selected text.
" http://vim.wikia.com/wiki/VimTip171
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:save_cpo = &cpo | set cpo&vim
if !exists('g:VeryLiteral')
  let g:VeryLiteral = 0
endif
function! s:VSetSearch(cmd)
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  normal! gvy
  if @@ =~? '^[0-9a-z,_]*$' || @@ =~? '^[0-9a-z ,_]*$' && g:VeryLiteral
    let @/ = @@
  else
    let pat = escape(@@, a:cmd.'\')
    if g:VeryLiteral
      let pat = substitute(pat, '\n', '\\n', 'g')
    else
      let pat = substitute(pat, '^\_s\+', '\\s\\+', '')
      let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
      let pat = substitute(pat, '\_s\+', '\\_s\\+', 'g')
    endif
    let @/ = '\V'.pat
  endif
  normal! gV
  call setreg('"', old_reg, old_regtype)
endfunction
vnoremap <silent> * :<C-U>call <SID>VSetSearch('/')<CR>/<C-R>/<CR>
vnoremap <silent> # :<C-U>call <SID>VSetSearch('?')<CR>?<C-R>/<CR>
vmap <kMultiply> *
nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral
  \\| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")<CR>
if !hasmapto("<Plug>VLToggle")
  nmap <unique> <Leader>vl <Plug>VLToggle
endif
let &cpo = s:save_cpo | unlet s:save_cpo


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

function! s:filedict(path, ext, pre)
  let lenp = strlen(a:path . a:pre)
  let lene = strlen(a:ext)
  let kws = {}
  for name in s:glob(a:path, a:pre.'*'.a:ext)
    let kws[strpart(name, lenp, len(name) - lenp - lene)] = name
    " echo strpart(name, lenp, len(name) - lenp - lene) name
  endfor
  return kws
endfunction

function! LoadConfigures(path, names)
  let vimkvs = s:filedict(a:path, '.vim', 'plug-')
  for name in a:names
    if has_key(vimkvs, name)
      execute 'source' s:esc(vimkvs[name])
      " echo 'load' vimkvs[name]
    endif
  endfor
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SQLPP 格式化选中的SQL内容，并更新到当前光标处
" depends shell.vim, GetVisualRange
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! SQLPP()
"    call writefile([GetVisualRange()], $TEMP."\\~.sql", "b")
"    "exec 'r!D:\\Program\\SQL.P.P\\sqlpp_cmd.exe -mysql -stdout \
"        -config=D:\\Program\\SQL.P.P\\default.ini -F "%"'
"    exec 'r!D:\\Program\\SQL.P.P\\sqlpp_cmd.exe -mysql -stdout \
"        -config=D:\\Program\\SQL.P.P\\default.ini -F "'.$TEMP.'\\~.sql"'
"endfunction
"
"command! -nargs=0 SQL call SQLPP()


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
" 将所选内容写入指定文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! WriteLinePart(filename) range
    call writefile([GetVisualRange()], a:filename, 'b')
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file undo redo history auto save & load
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set undofile
" execute('set undodir=' . $UNDODIR)
" au BufReadPost * silent call ReadUndo()
" au BufWritePost * silent call WriteUndo()
" au VimLeave * silent call CleanCache()
function! ReadUndo()
  " let fname = undofile(expand('%'))
  let fname = join(split(join(split(undofile(expand('%')), '%'), '&'), '\s'), '_')
  if filereadable(fname)
    execute('silent rundo ' . fname)
  endif
endfunc
function! WriteUndo()
  let fname = join(split(join(split(undofile(expand('%')), '%'), '&'), '\s'), '_')
  if isdirectory($UNDODIR)
    execute('wundo ' . fname)
  endif
endfunc
function! CleanCache()
  exe '!find "'.$VIMCACHE.'/undo" -mtime +7 -exec rm -f {} \;'
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
    !./install.py --clang-completer
  endif
endfunction
