"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neoformat {{{1

" use &formatprg as a formatter
let g:neoformat_try_formatprg = 0
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
" Enable all formaters
let g:neoformat_run_all_formatters = 1

let g:neoformat_enabled_sql = ['sqlformat']
let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']
let g:neoformat_enabled_javascript = ['esformatter', 'prettier-eslint', 'eslint_d']
let g:neoformat_enabled_xml = ['tidy', 'prettydiff']

let g:neoformat_sql_sqlformat = {
        \ 'exe': 'sqlformat',
        \ 'args': ['--reindent' , '--keywords upper', '--comma_first true'],
        \ 'stdin': 1,
        \ }
