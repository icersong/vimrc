"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline   {{{1
" g ctrl-g 可显示选中字符数量信息
" Plug 'bling/vim-airline'
set laststatus=2
let g:airline_theme = "dark"
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_z = '%B %P %l/%L %v'
let g:airline_extensions = ['branch',
    \ 'tabline', 'whitespace', 'ale',
    \ 'tagbar', 'virtualenv', 'unite']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tabline#ignore_bufadd_pat =
      \ '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree|vim-minimap|DebuggerWatch|gitcommit|[No Name]'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#tabline#buffer_idx_format = {
"       \ '0': '⁰', '1': '¹', '2': '²', '3': '³', '4': '⁴',
"       \ '5': '⁵', '6': '⁶', '7': '⁷', '8': '⁸', '9': '⁹'}
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab10
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
" nmap <silent><c-h> <Plug>AirlineSelectPrevTab
" nmap <silent><c-l> <Plug>AirlineSelectNextTab
" autocmd BufEnter <buffer> AirlineRefresh