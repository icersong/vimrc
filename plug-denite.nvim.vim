"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" denite   {{{1
" Plug 'Shougo/denite.nvim', { 'on': ['Denite'] }
" Denite file/rec   // 递归搜索, rec 表递归

nnoremap <silent> <leader>ff :Denite
            \ -input='<C-R>=escape(expand("<cword>"), "/\\\*\ \|\(\)")<CR>'
            \ buffer file `GetGitRoot() != '' ? 'file/rec/git' : 'file/rec'`
            \ <CR>

vnoremap <silent> <leader>ff :Denite
            \ -input='<C-R>=escape(GetVisualSelection(), "/\\\*\ \|\(\)")<CR>'
            \ buffer file `GetGitRoot() != '' ? 'file/rec/git' : 'file/rec'`
            \ <CR>

nnoremap <silent> <leader>fa :Denite -auto-action=preview
            \ -input='<C-R>=escape(expand("<cword>"), "/\\\*\ \|\(\)")<CR>'
            \ buffer file `GetGitRoot() != '' ? 'file/rec/git' : 'file/rec'`
            \ <CR>

nnoremap <silent> <leader>fh :Denite -auto-action=preview
            \ -input='<C-R>=escape(expand("<cword>"), "/\\\*\ \|\(\)")<CR>'
            \ file_mur file/rec
            \ <CR>

" autocmd ColorScheme * call s:denite_colors()
function! s:denite_colors() abort
    if &background ==? "dark"
        highlight DeniteMenu cterm=reverse ctermfg=236 ctermbg=253
        highlight DeniteMatchedChar cterm=reverse ctermfg=236 ctermbg=226
        highlight DeniteMatchedRange cterm=reverse ctermfg=236 ctermbg=250
        highlight DenitePrompt cterm=reverse ctermfg=240 ctermbg=220
        highlight DeniteFilter cterm=reverse ctermfg=240 ctermbg=74
    endif
endfunction

" Define mappings
autocmd FileType denite call s:denite_settings()
function! s:denite_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> A
                \ denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <esc>
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
                \ denite#do_map('toggle_select').'j'

    " call denite#custom#map('insert', '<tab>', '<denite:move_to_next_line>', 'noremap')
    " call denite#custom#map('insert', '<S-tab>', '<denite:move_to_previous_line>', 'noremap')
    " call denite#custom#map('insert', '<C-cr>', '<denite:choose_action>', 'noremap')
    " call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')
    call denite#custom#map('normal', '<tab>', '<denite:do_action:preview>', 'noremap')
    " call denite#custom#map('normal', '<S-tab>', '<denite:choose_action>', 'noremap')
    call denite#custom#map('insert', '<esc>', '<denite:choose_action>', 'noremap')
    call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')
endfunction

autocmd sourcepost $VIMFILES/denite.nvim/plugin/*.vim call s:denite_end()
function! s:denite_end() abort
    " denite colors
    call s:denite_colors()
    " denite option
    call denite#custom#option('default', {
                \   'wincol': &columns * 1 / 8,
                \   'winwidth': &columns * 3 / 4,
                \   'split': 'floating',
                \   'root_markers': '.git,.svn',
                \   'statusline' : has('patch-7.4.1154') ? v:false : 0,
                \   'prompt' : '➜',
                \   'highlight_filter_background': 'DeniteFilter',
                \   'highlight_matched_char': 'DeniteMatchedChar',
                \   'highlight_matched_range': 'DeniteMatchedRange',
                \   'highlight_preview_line': 'DeniteMatchedChar',
                \   'highlight_prompt': 'DenitePrompt',
                \   'highlight_window_background': 'DeniteMenu',
                \ })
    call denite#custom#alias('source', 'file/rec/git', 'file/rec')
    call denite#custom#var('file/rec/git', 'command',
                \['git', 'ls-files', '-co', '--exclude-standard', GetGitRoot()])
endfunction
