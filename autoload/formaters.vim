
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format xml file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function formaters#format_xml()
    set filetype=xml
    :%s/></>\r</g
    :normal gg=G<cr>
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FormatSQL 格式化选中的SQL内容，并更新到当前光标处
" depends shell.vim, GetVisualRange
" command! -nargs=? -bar -range=% -bang FormatSQL call FormatSQL()
" referance: https://github.com/mattn/vim-sqlfmt
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! formaters#format_sql() range
  if !executable('sqlformat')
    echo "Please install command sqlformat (sudo pip3 install -y sqlparse)"
    return -1
  endif
  call setqflist([])
  let cmd = get(g:, 'sqlfmt_program', 'sqlformat -r -k upper -s --comma_first true -o %s -')
  if stridx(cmd, '%s') > -1
    let tmpfile = tempname()
    let cmd = substitute(cmd, '%s', tr(tmpfile, '\', '/'), 'g')
    let lines = system(cmd, iconv(join(getline(1, '$'), "\n"), &encoding, 'utf-8'))
    if v:shell_error != 0
      call delete(tmpfile)
      echoerr substitute(lines, '[\r\n]', ' ', 'g')
      return
    endif
    let lines = join(readfile(tmpfile), "\r")
    call delete(tmpfile)
  else
    let lines = system(cmd, iconv(join(getline(1, '$'), "\n"), &encoding, 'utf-8'))
    if v:shell_error != 0
      echoerr substitute(lines, '[\r\n]', ' ', 'g')
      return
    endif
  endif
  let pos = getcurpos()
  silent! %d _
  call setline(1, split(lines, "\r"))
  call setpos('.', pos)

  " let tempfile = tempname()
  " echomsg tempfile
  " call writefile([GetVisualRange()], tempfile, "b")
  " if executable('sqlformat')
  "   silent execute '%r!sqlformat -r -s --comma_first true ' . tempfile
  " else
  "   echomsg "Can not found sql formaters (sqlformat, ...)"
  " endif
endfunction
