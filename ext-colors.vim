function! s:fix_scheme_color() abort
    highlight Comment ctermfg=241 guifg=#80a0ff
    highlight Search cterm=reverse ctermfg=0 ctermbg=226 guifg=Black guibg=Yellow
    highlight Pmenu cterm=reverse ctermfg=236 ctermbg=253 guibg=Magenta
    highlight PmenuSearch cterm=reverse ctermfg=236 ctermbg=226 guifg=Black guibg=Yellow
endfunction
autocmd colorscheme * call s:fix_scheme_color()
