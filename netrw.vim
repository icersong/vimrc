let g:netrw_hide = 1
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 32
let g:netrw_altv = 1
let g:netrw_chgwin = 2
let g:netrw_list_hide = '.*\.swp$'
let g:netrw_localrmdir = 'rm -rf'

" let g:Netrw_UserMaps = [["e", "@<Plug>NetrwLocalBrowserCheck"]]
" autocmd filetype netrw unmap <buffer> <c-l>

augroup netrw_remap
  autocmd!
  autocmd filetype netrw call Remap_netrw()
augroup END

function! Remap_netrw()
  " 删除<c-l>
  nnoremap <buffer> <c-l> <c-l>
  unmap <buffer> <c-l>
  " 打开文件并关闭窗口
  " nmap <buffer> <unique> e <Plug>NetrwHideEdit
  " nmap <buffer> e <cr>:call CloseLexplorer()<cr>
  nnoremap <buffer> <silent> <nowait> e	:<c-u>call netrw#LocalBrowseCheck(<SID>NetrwBrowseChgDir(1,<SID>NetrwGetWord()))<cr>
endfunction

function! CloseLexplorer()
  if bufwinnr(t:netrw_lexbufnr) == 1
    Lexplore
  endif
endfunction
