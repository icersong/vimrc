"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline   {{{1
" g ctrl-g 可显示选中字符数量信息
" Plug 'bling/vim-airline'
set laststatus=2
let g:airline_theme = "dark"
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_z = '%B %P %l/%L %v'
let g:airline_highlighting_cache = 1
let g:airline_extensions = ['branch', 'tabline', 'whitespace', 'ale', 'tagbar', 'virtualenv']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#alt_sep = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#tabline#ignore_bufadd_pat =
      \ '!|defx|gundo|undotree|vimfiler|tagbar|nerd_tree|vim-minimap'
      \.'|DebuggerWatch|gitcommit|MiniBufExplorer|startify|term://'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1

let g:airline#extensions#tabline#buffer_idx_format = {
      \ '0': '⁰', '1': 'ⁱ', '2': 'ᶽ', '3': 'ᶟ', '4': 'ᶣ',
      \ '5': '⁵', '6': '⁶', '7': '⁷', '8': '⁸', '9': '⁹'}
" let g:airline#extensions#tabline#buffer_idx_format = {
"       \ '0': '⓿', '1': '⓵', '2': '⓶', '3': '⓷', '4': '⓸',
"       \ '5': '⓹', '6': '⓺', '7': '⓻', '8': '⓼', '9': '⓽',
"       \ '10': '⓾', '11': '⓫', '12': '⓬', '13': '⓭',
"       \ '14': '⓮', '15': '⓯', '16': '⓰', '17': '⓱',
"       \ '18': '⓲', '19': '⓳', '20': '⓴' }
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9
" nmap <leader>0 <Plug>AirlineSelectTab10
" nmap <silent><c-h> <Plug>AirlineSelectPrevTab
" nmap <silent><c-l> <Plug>AirlineSelectNextTab
" autocmd BufEnter <buffer> AirlineRefresh


let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'y', 'z', 'error', 'warning', 'counter' ]
    \ ]

call airline#extensions#coc#init('')
" let g:airline_section_error = airline#section#create_right([
"       \ '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}',
"       \ '%{airline#util#wrap(airline#extensions#ale#get_error(),0)}',
"       \])

" let g:airline_section_warning = airline#section#create_right([
"       \ '%{airline#util#wrap(airline#extensions#coc#get_warning(), 0)}',
"       \ '%{airline#util#wrap(airline#extensions#ale#get_warning(), 0)}',
"       \ '%{airline#util#wrap(airline#extensions#whitespace#check(), 0)}',
"       \])



" let g:airline_section_error = airline#section#create_right(['%0.9{g:asyncrun_status}'])
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
