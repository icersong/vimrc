"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AsyncRun    {{{1
" Plug 'skywind3000/asyncrun.vim'
function! AsyncRunning(id)
  if !empty(matchstr(g:asyncrun_status, '\d\+'))
    let g:asyncrun_status += 1
  else
    if g:asyncrun_status == 'running'
      let g:asyncrun_status = '1'
    endif
    if g:asyncrun_status == 'success'
      let g:asyncrun_status = ''
      if exists('s:asyncrun_running_timer')
        call timer_stop(s:asyncrun_running_timer)
        unlet s:asyncrun_running_timer
      endif
    endif
    if g:asyncrun_status == 'failure'
      if exists('s:asyncrun_running_timer')
        call timer_stop(s:asyncrun_running_timer)
        unlet s:asyncrun_running_timer
      endif
    endif
  endif
  let g:airline_section_error = g:asyncrun_status
  exec ':AirlineRefresh'
  redrawstatus!
  redraw
endfunction
autocmd User AsyncRunStart let s:asyncrun_running_timer =
      \ timer_start(1000, 'AsyncRunning', {'repeat': 100})
