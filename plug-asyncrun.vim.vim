"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AsyncRun    {{{1
" Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_timeout=99
let g:asyncrun_status = ''
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

augroup QuickfixStatus
  au! BufWinEnter quickfix setlocal
  \ statusline=%t\ [%{g:asyncrun_status}]\ %{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P
augroup END

function! AsyncrunClear(timer)
    let g:asyncrun_status=''
endfunction

function! AsyncrunStop(timer)
    call AsyncrunClear('!')
    call asyncrun#stop('!')
endfunction

function! AsyncRunning(timer)
  if !empty(matchstr(g:asyncrun_status, '\d\+'))
    if g:asyncrun_status == g:asyncrun_timeout
      let g:asyncrun_status = 'timeout'
      call timer_start(3333, 'AsyncrunStop', {'repeat': 1})
    else
      let g:asyncrun_status = printf('%d', g:asyncrun_status + 1)
    endif
  else
    if g:asyncrun_status == 'running'
      let g:asyncrun_status = '1'
    elseif g:asyncrun_status == 'success'
      call timer_stop(a:timer)
      call timer_start(3333, 'AsyncrunClear', {'repeat': 1})
    elseif g:asyncrun_status == 'failure'
      call timer_stop(a:timer)
      call timer_start(3333, 'AsyncrunStop', {'repeat': 1})
    endif
  endif
endfunction
autocmd User AsyncRunStart call timer_start(1000, 'AsyncRunning', {'repeat': g:asyncrun_timeout})
