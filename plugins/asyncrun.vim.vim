"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AsyncRun    {{{1
" Plug 'skywind3000/asyncrun.vim'

if index(g:plugs_order, 'vim-airline') < 0
    finish
endif

" vim-airline
let g:asyncrun_open = 0
let g:asyncrun_status = ''
" let g:airline_section_error = airline#section#create_right(['%0.9{g:asyncrun_status}'])

" timeout (seconds)
let g:asyncrun_timeout=99

function! AsyncRunning(timer)
  " counting
  if !empty(matchstr(g:asyncrun_status, '\d\+'))
    " counter++
    let g:asyncrun_status = printf('%02d', g:asyncrun_status + 1)
    " check timeout
    if g:asyncrun_status == g:asyncrun_timeout
      let g:asyncrun_status = 'timeout'
      call asyncrun#stop('!')
    endif
    return
  endif
  " stop timer
  call timer_stop(a:timer)
endfunction

function! AsyncRunStart()
  " start timer
  let g:asyncrun_status = '0'
  call timer_start(1000, 'AsyncRunning',
      \ {'repeat': g:asyncrun_timeout})
endfunction

function! AsyncrunClear(timer='')
    let g:asyncrun_status=''
endfunction

function! s:AsyncRunStop()
    if g:asyncrun_open != 0 || g:asyncrun_status != 'success'
      call execute('copen')
    endif
    call timer_start(9999, 'AsyncrunClear', {'repeat': 1})
    let g:asyncrun_open = 0
endfunction

autocmd User AsyncRunStart call AsyncRunStart()

autocmd User AsyncRunStop call <SID>AsyncRunStop()


" fix quickfix title
augroup QuickfixStatus
  au! BufWinEnter quickfix setlocal
  \ statusline=%t\ [%{g:asyncrun_status}]\ %{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P
augroup END

" command make
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" fugitive Gpush Gfetch GPull
command! -bang -bar -nargs=* Gpush execute 'AsyncRun<bang> -cwd=' .
          \ fnameescape(FindRootDirectory()) 'git push' <q-args>
command! -bang -bar -nargs=* Gfetch execute 'AsyncRun<bang> -cwd=' .
          \ fnameescape(FindRootDirectory()) 'git fetch' <q-args>
command! -bang -bar -nargs=* Gpull execute 'AsyncRun<bang> -cwd=' .
          \ fnameescape(FindRootDirectory()) 'git pull' <q-args>
