"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" timestamp   {{{1
" Plug 'icersong/timestamp.vim'
"@ Modified: 2022-01-11 [1]
let g:timestamp_regexp = '\v\C%(<%(Last %([cC]hanged?|modified)|Modified)\s*:\s+)@<='
let g:timestamp_regexp .= '(\d{4}[-/]\d{2}[-/]\d{2}|\d{4}[-/]\d{2}[-/]\d{2} \d{2}:\d{2}:\d{2}|TIMESTAMP)'
let g:timestamp_regexp .= '\s*(\[(\d+)\])?$'
let g:timestamp_rep = '\=strftime("%Y-%m-%d").(submatch(2)==submatch(9) ? "" : " [".(submatch(3)+1)."]")'
let g:timestamp_modelines = 9
