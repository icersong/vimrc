""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 离开插入模式后自动关闭预览窗口
" key <esc>
" inoremap <expr> <esc> (pumvisible() ? "\<esc>a" : "\<esc>")
inoremap <expr><esc> coc#pum#visible() ? coc#pum#cancel()
  \: pumvisible() ? "\<C-e>"
  \: "\<esc>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
" inoremap <expr><cr> (pumvisible() ? "\<c-y>\<cr>" : "\<cr>")
" inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr><CR> coc#pum#visible() ? coc#_select_confirm()
  \: pumvisible() ? "\<C-y>"
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shift + tab, jump prev
inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : pumvisible() ? "\<C-p>" : "\<S-Tab>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Super TAB
" Use <TAB> to select the popup menu:
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr><TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ pumvisible() ? "\<C-n>" :
  \ functools#has_function('delimitMate#ShouldJump')
  \   && delimitMate#ShouldJump() ?
  \ delimitMate#JumpAny() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run script
" <F5>

function! s:run_python_project() abort
  let cwd = getcwd()
  " 查找项目根
  let rootdir = FindRootDirectory()
  let pjname = split(rootdir, '/')[-1]
  if rootdir == ''
    echo "Not in project."
    return
  endif
  " 查找项模块
  let mname = join(split(pjname, '-'), '_')
  if !isdirectory(rootdir . '/' . mname)
    echo "Not found module " . mname
    return
  endif
  lcd rootdir
  call asyncrun('!', 'raw', 'python -m ' . mname)
  lcd cwd
endfunction


function! s:run_python_file()
  " call system('python "' . expand('%') . '"')
  " call asyncrun('!', 'raw', 'python -m ' . mname)
  " call asyncrun#run('<bang>', 'raw', 'echo "1111111111111"')
  " :AsyncRun exec '!python' shellescape(@%, 1)
  let cmd = "python " . shellescape(@%, 1)
  echo cmd
  " :AsyncRun -raw=1 -pos=quickfix exec ''python %
  " :AsyncRun -raw=1 -pos=quickfix python a.py
  let g:asyncrun_open = 9
  :AsyncRun -raw=1 -pos=quickfix python %
endfunction

"""" python """"
augroup RunPython
  autocmd!

  autocmd FileType python nnoremap <buffer> <silent> <F5> :!python %<CR>

  autocmd FileType python nnoremap <buffer> <silent> <C-F5> s:run_python_project()

  " autocmd FileType python nnoremap <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>

augroup END
autocmd FileType python nnoremap <buffer> <silent> <F9> :call <SID>run_python_file()<CR>
