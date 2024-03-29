"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 切换BUFFER或TAB
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! bufswitch#tab_buf_switch(num) abort
    if index(g:plugs_order, 'vim-airline') >= 0
        execute 'normal '."\<Plug>AirlineSelectTab".a:num
    else
        if exists( '*tabpagenr' ) && tabpagenr('$') != 1
            " Tab support && tabs open
            execute 'normal '.a:num.'gt'
        else
            let l:index = a:num - 1
            if l:index < 0
                return
            endif
            let l:buffers = filter(range(1, bufnr('$')), 'buflisted(v:val)')
            let l:buf_count=len(l:buffers)
            if l:buf_count == 0 || l:index >= l:buf_count
                return
            endif
            " execute ':'.l:buffers[l:index].'b'
            execute l:buffers[l:index].'b'
        endif
    endif
endfunction


" " tab or buf 1
function! bufswitch#default_maps() abort
    nnoremap <silent> <leader>1 :call bufswitch#tab_buf_switch(1)<cr>
    " tab or buf 2
    nnoremap <silent> <leader>2 :call bufswitch#tab_buf_switch(2)<cr>
    " tab or buf 3
    nnoremap <silent> <leader>3 :call bufswitch#tab_buf_switch(3)<cr>
    " tab or buf 4
    nnoremap <silent> <leader>4 :call bufswitch#tab_buf_switch(4)<cr>
    " tab or buf 5
    nnoremap <silent> <leader>5 :call bufswitch#tab_buf_switch(5)<cr>
    " tab or buf 6
    nnoremap <silent> <leader>6 :call bufswitch#tab_buf_switch(6)<cr>
    " tab or buf 7
    nnoremap <silent> <leader>7 :call bufswitch#tab_buf_switch(7)<cr>
    " tab or buf 8
    nnoremap <silent> <leader>8 :call bufswitch#tab_buf_switch(8)<cr>
    " tab or buf 9
    nnoremap <silent> <leader>9 :call bufswitch#tab_buf_switch(9)<cr>
endfunction
