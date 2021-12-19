" FZF   {{{1
" Plug 'junegunn/fzf.vim'
" ESC, CTRL-C, CTRL-G and CTRL-Q close fzf by default
" :FZF -q <query string>

let g:fzf_history_dir = $VIMCACHE.'/fzf-history'
let g:fzf_nvim_statusline = 0

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Fix <exc> to exit fzf
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

nmap <silent> <leader>fb :Buffers<CR>
nmap <silent> <leader>f. :Files<CR>
nmap <silent> <leader>fg :GFiles<CR>
nmap <silent> <leader>fh :History<CR>

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

vnoremap <silent><leader>fzf <Esc>:FZF
      \ --prompt"> "
      \ -q <C-R>=<SID>getVisualSelection()<CR><CR>t

" vnoremap <silent><leader>f/ :call g:GitFindFiles(<SID>getVisualSelection())<CR>
vnoremap <silent><leader>ff <Esc>:GFindFiles <C-R>=<SID>getVisualSelection()<CR><CR>
nnoremap <silent><leader>ff <Esc>:GFindFiles<CR>

command! -bang -nargs=* GFindFiles
  \ call g:GitFindFiles(<q-args>,
  \ fzf#vim#with_preview('up:50%'),
  \ <bang>0)

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

"----------------------
" get selection text
function! s:getVisualSelection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ""
    endif
    let lines[-1] = lines[-1][:column_end - (&selection == "inclusive" ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

"----------------------
" copy from fzf.vim
let s:TYPE = {'dict': type({}), 'funcref': type(function('call')), 'string': type(''), 'list': type([])}

function! s:fzf(name, opts, extra)
  let [extra, bang] = [{}, 0]
  if len(a:extra) <= 1
    let first = get(a:extra, 0, 0)
    if type(first) == s:TYPE.dict
      let extra = first
    else
      let bang = first
    endif
  elseif len(a:extra) == 2
    let [extra, bang] = a:extra
  else
    throw 'invalid number of arguments'
  endif

  let extra  = copy(extra)
  let eopts  = has_key(extra, 'options') ? remove(extra, 'options') : ''
  let merged = extend(copy(a:opts), extra)
  let all_opts = [merged.options, eopts]
  let merged.options = join(map(all_opts, 'type(v:val) == s:TYPE.list ? join(map(copy(v:val), "fzf#shellescape(v:val)")) : v:val'))
  let wrapped = fzf#wrap(a:name, merged, bang)
  " return fzf#run(s:wrap(a:name, merged, bang))
  return fzf#run(wrapped)
endfunction

function! s:warn(message)
  echohl WarningMsg
  echom a:message
  echohl None
  return 0
endfunction

function! s:get_git_root()
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  return v:shell_error ? '' : root
endfunction

function! g:GitFindFiles(args, ...)
  let root = s:get_git_root()
  if empty(root)
    return s:warn('Not in git repo')
  endif
  echo a:args
  let query = empty(a:args) ? '' : ' -q '.fzf#shellescape(a:args)
  return s:fzf('gitfindfile', {
  \ 'source':  'git ls-files '.(' | uniq'),
  \ 'dir':     root,
  \ 'options': '-m --prompt "=> "'.query
  \}, a:000)
endfunction

"----------------------
" Reference:
" * https://segmentfault.com/a/1190000016186540
" * https://yqc.im/vim-fzf-config/
