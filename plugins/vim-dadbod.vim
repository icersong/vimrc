augroup DadbodMappings
   autocmd!

   autocmd FileType sql,mysql vnoremap <buffer> <silent> <F5> :DB<CR>
   autocmd FileType sql,mysql vnoremap <buffer> <silent> <CR> :DB<CR>

   autocmd FileType sql,mysql nnoremap <buffer> <silent> <F5> :%DB<CR>
   autocmd FileType sql,mysql nnoremap <buffer> <silent> <CR> :%DB<CR>
augroup END
