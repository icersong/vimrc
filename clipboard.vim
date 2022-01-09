" clipboard
" visual mode: only paste but not replace cut table
" MacOS * + 寄存器指向系统剪切板
" Linux X11 * 寄存器指向Primary 选区，鼠标选中区域
" Linux X11 + 寄存器指向Clipboard选区，系统剪切板
vnoremap p pgvy
noremap <silent><leader>p "+p
noremap <silent><leader>y "+y:call clipboard#yank()<cr>
" 预防粘贴时有<Esc>或<CR>字符，导致剪切板劫持
inoremap <C-r>+ <C-g>u<C-\><C-o>"+gP


function clipboard#yank()
  call clipboard#send()
  " if executable('s2rc')
  "   return system('s2rc', join(clipboard#getlines(), "\n"))
  " endif
  " if executable('send-to-remote-clipboard')
  "   return system('send-to-remote-clipboard', @")
  " endif
endfunction


function! clipboard#save(filename)
  let data=escape(join(clipboard#getlines(), "\n"), "\"\\")
  let data=substitute(data, "\n", "\\\\n", "g")
  let data=substitute(data, "\r", "\\\\r", "g")
  call writefile([join(['{"data": "', data, '"}'], '')], a:filename, 'b')
endfunction


function! clipboard#getlines()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    return getline(line_start, line_end)
endfunction


function clipboard#authcode()
  let user=$ONLINE_CLIPBOARD_USER
  let expired=$ONLINE_CLIPBOARD_EXPIRED ? $ONLINE_CLIPBOARD_EXPIRED : 30
  return trim(system("echo -n " . user . '.' . localtime() / expired . ' | md5sum | cut "-d " -f1'))
endfunction


" send current selected to online-clipboard
function clipboard#send()
  if !len($ONLINE_CLIPBOARD_HOST)
    echo $ONLINE_CLIPBOARD_HOST
    return
  endif
  if !len($ONLINE_CLIPBOARD_USER)
    echo $ONLINE_CLIPBOARD_USER
    return
  endif
  let host=$ONLINE_CLIPBOARD_HOST
  let auth=clipboard#authcode()
  let tmpf = trim(system('mktemp'), "\n\r")
  call clipboard#save(tmpf)
  call system('curl -X POST ' . host
        \ . ' -H "Content-Type: text"'
        \ . ' -H "X-Content-Type: text"'
        \ . ' -H "X-API-Version: 1"'
        \ . ' -H "X-Client-Name: arch"'
        \ . ' -H "X-Auth: ' . auth . '"'
        \ . ' -s -S'
        \ . ' -d @' . tmpf
        \)
  call system("rm -f " . tmpf)
endfunction
