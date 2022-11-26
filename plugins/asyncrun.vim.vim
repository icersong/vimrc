"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AsyncRun    {{{1
" Plug 'skywind3000/asyncrun.vim'

if index(g:plugs_order, 'vim-airline') < 0
    finish
endif

let g:airline_section_warning = airline#section#create_right(['%0.9{g:asyncrun_status}'])
let g:asyncrun_open = 0
let g:asyncrun_timeout=99
let g:asyncrun_status = ''

augroup QuickfixStatus
  au! BufWinEnter quickfix setlocal
  \ statusline=%t\ [%{g:asyncrun_status}]\ %{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P
augroup END

function! AsyncrunClear(timer)
    if g:asyncrun_status == 'timeout'
                \ || g:asyncrun_status == 'success'
                \ || g:asyncrun_status == 'failure'
        let g:asyncrun_status=''
    endif
endfunction

function! AsyncRunning(timer)
  if !empty(matchstr(g:asyncrun_status, '\d\+'))
    if g:asyncrun_status == g:asyncrun_timeout
      let g:asyncrun_status = 'timeout'
      call asyncrun#stop('!')
      call timer_start(9999, 'AsyncrunClear', {'repeat': 1})
    else
      let g:asyncrun_status = printf('%02d', g:asyncrun_status + 1)
    endif
  else
    if g:asyncrun_status == 'running'
      let g:asyncrun_status = '1'
    elseif g:asyncrun_status == 'success'
      call timer_stop(a:timer)
      call timer_start(3333, 'AsyncrunClear', {'repeat': 1})
    elseif g:asyncrun_status == 'failure'
      call timer_stop(a:timer)
      call execute('copen')
      call timer_start(3333, 'AsyncrunClear', {'repeat': 1})
    endif
  endif
endfunction

autocmd User AsyncRunStart call timer_start(1000, 'AsyncRunning', {'repeat': g:asyncrun_timeout})
