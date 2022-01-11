function! s:fix_scheme_color() abort
    highlight Comment ctermfg=241 guifg=#666666
    highlight Search cterm=reverse ctermfg=0 ctermbg=226 guifg=Black guibg=Yellow
    highlight Pmenu cterm=reverse ctermfg=236 ctermbg=253 guibg=#333333 guifg=#AAAAAA
    highlight PmenuSel guifg=white guibg=#555555
    highlight PmenuSearch cterm=reverse ctermfg=236 ctermbg=226 guifg=Black guibg=Yellow
endfunction
autocmd colorscheme * call s:fix_scheme_color()
