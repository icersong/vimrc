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
