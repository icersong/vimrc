
" test vim command is exists
function! functools#has_command(cmd) abort
  return !!len(matchstr(execute('command ' . a:cmd), ' ' . a:cmd . ' '))
endfunction


" test vim function is exists
function! functools#has_function(cmd)
  return len(execute('function /^' . a:cmd . '$'))
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GetVisualRange 获取当前选中内容
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search for other instances of the current visual range
" <C-R>=               Insert the result of an expression on
"                      the search line (see :help c_CTRL-R_= )
"vmap ,/ <ESC>/<C-R>=GetVisualRange()<CR><CR>

" Create the function that extracts the contents of the visual range
function! functools#get_visual_range()
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


function! functools#get_visual_text()
    " Why is this not a built-in Vim script function?!
    let lines = GetVisualLines()
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\r")
endfunction


function! functools#get_visual_lines()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    return getline(line_start, line_end)
endfunction


" 用寄存器实现，很简洁
function! functools#get_visual_selection()
    try
        let x_save = @"
        let a_save = @a
        normal! gv"ay
        return @a
    finally
        let @a = a_save
        let @" = x_save
    endtry
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 将所选内容写入指定文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! functools#write_select_lines(filename) range
  " call writefile([functools#get_visual_range()], a:filename, 'b')
  " call writefile([functools#get_visual_selection()], a:filename, 'b')
  " call writefile(split(functools#get_visual_text(), '\n'), a:filename, 'b')
  call writefile(functools#get_visual_lines(), a:filename, 'b')
endfunction

