"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fcitx输入法切话
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usage:
" if executable('fcitx-remote')
"     autocmd InsertEnter * call FcitxVimInsertEnter()
"     autocmd InsertLeave * call FcitxVimInsertLeave()
"     autocmd CmdlineEnter * call FcitxVimCmdlineEnter()
"     autocmd CmdlineLeave * call FcitxVimCmdlineLeave()
"     autocmd FocusGained * call FcitxVimFocus()
"     autocmd FocusLost * call FcitxVimLost()
"     autocmd VimEnter * call FcitxVimFocus()
"     autocmd VimLeave * call FcitxVimLost()
" endif

let s:FCITX_EN = 1
let s:FCITX_ZH = 2

" status: 0, switch, 1, select en, 2 select zh
function! FcitxSwitch(status)
    let curstatus = system('fcitx-remote')
    if a:status == 0
        if curstatus == s:FCITX_ZH
            call system('fcitx-remote -c')
            " echomsg 'switch en 0'
            return s:FCITX_EN
        else
            call system('fcitx-remote -o')
            " echomsg 'switch zh 0'
            return s:FCITX_ZH
        endif
    endif
    if curstatus != a:status
        if a:status == s:FCITX_ZH
            call system('fcitx-remote -o')
            " echomsg 'switch zh'
            return s:FCITX_ZH
        else
            call system('fcitx-remote -c')
            " echomsg 'switch en'
            return s:FCITX_EN
        endif
    endif
    return a:status
endfunction

" let g:fcitx_input_status = system('fcitx-remote')
let g:fcitx_input_status = s:FCITX_ZH
let g:fcitx_other_status = system('fcitx-remote')
" echomsg 'other' g:fcitx_other_status
" echomsg 'input' g:fcitx_input_status

function! FcitxVimLost()
    " echomsg 'lost' mode()
    call FcitxSwitch(g:fcitx_other_status)
endfunction

function! FcitxVimFocus()
    " echomsg 'focus' mode()
    " let g:fcitx_other_status = system('fcitx-remote')
    let inputmode = mode()
    if inputmode == 'n' || inputmode == 'v' || inputmode == 'V'
        call FcitxSwitch(s:FCITX_EN)
    else
        call FcitxSwitch(g:fcitx_input_status)
    endif
endfunction

function! FcitxVimInsertEnter()
    " echomsg 'InsertEnter' mode() g:fcitx_input_status
    call FcitxSwitch(g:fcitx_input_status)
    " echomsg 'insert after' mode() system('fcitx-remote')
endfunction

function FcitxVimInsertLeave()
    " echomsg 'InsertLeave' mode() system('fcitx-remote')
    " let g:fcitx_input_status = system('fcitx-remote')
    call FcitxSwitch(s:FCITX_EN)
endfunction

function! FcitxVimCmdlineEnter()
    " echomsg 'cmdline enter ' mode() g:fcitx_input_status
    call FcitxSwitch(g:fcitx_input_status)
    " echomsg 'cmdline enter after' mode() system('fcitx-remote')
endfunction

function! FcitxVimCmdlineLeave()
    " echomsg 'CmdlineLeave' mode() system('fcitx-remote')
    call FcitxSwitch(s:FCITX_EN)
endfunction
