"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugin's config

if $WINDOWS
  let s:SEP = '\'
else
  let s:SEP = '/'
endif


" escape tail space
function! s:esc(path)
  return escape(a:path, ' ')
endfunction


" split string to list
function! s:lines(msg)
  return split(a:msg, "[\r\n]")
endfunction


" list files
function! s:glob(from, pattern)
  return s:lines(globpath(a:from, a:pattern))
endfunction

" extract filename from fullpath
function! s:filename(fullpath) abort
    return matchstr(a:fullpath, "[a-z-.]\\+$")
endfunction


function! s:filedict(path, pre, ext)
  let lene = strlen(a:ext)
  let lenp = strlen(a:pre)
  let kws = {}
  for name in s:glob(a:path, a:pre.'*'.a:ext)
    " let fname = split(name, s:SEP)[-1]
    let fname = s:filename(name)
    let kws[strpart(fname, lenp, len(fname) - lenp - lene)] = name
  endfor
  return kws
endfunction


" load all vilid plugin configs
function! plugin_config_loader#load_configs(path, names)
  let vimkvs = s:filedict(a:path, '', '.vim')
  for name in a:names
    if has_key(vimkvs, name)
      execute 'source ' . s:esc(vimkvs[name])
    endif
  endfor
endfunction
