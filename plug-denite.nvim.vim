"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" denite   {{{1
" Plug 'Shougo/denite.nvim', { 'on': ['Denite'] }
" Denite file/rec   // 递归搜索, rec 表递归

" nnoremap <leader>ff :Denite
"             \ -input='<C-R>=escape(expand("<cword>"), "/\\\*\ \|\(\)")<CR>'
"             \ buffer file `GetGitRoot() != '' ? 'file/rec/git' : 'file/rec'`
"             \ <CR>

nnoremap <silent><leader>ff :Denite
            \ buffer file `GetGitRoot() != '' ? 'file/rec/git' : 'file/rec'`
            \ <CR>

nnoremap <silent><leader>fc :Denite
            \ -input='<C-R>=escape(expand("<cword>"), "/\\\*\ \|\(\)")<CR>'
            \ buffer file `GetGitRoot() != '' ? 'file/rec/git' : 'file/rec'`
            \ <CR>

nnoremap <silent><leader>fh :Denite -auto-action=preview
            \ file_mru file/rec
            \ <CR>

vnoremap <silent><leader>fh :Denite -auto-action=preview
            \ -input='<C-R>=escape(GetVisualSelection(), "/\\\*\ \|\(\)")<CR>'
            \ file_mru file/rec
            \ <CR>

vnoremap <silent><leader>ff :Denite
            \ -input='<C-R>=escape(GetVisualSelection(), "/\\\*\ \|\(\)")<CR>'
            \ buffer file `GetGitRoot() != '' ? 'file/rec/git' : 'file/rec'`
            \ <CR>

augroup augroup_denite
  autocmd!
  autocmd FileType denite call s:denite_settings()
  autocmd FileType denite-filter call s:denite_filter_settings()
augroup END

function! s:denite_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> A
                \ denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> f
                \ denite#do_map('filter', '')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> h
                \ denite#do_map('move_up_path')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <esc>
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
                \ denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer><expr> <C-t>
          \ denite#do_map('do_action', 'tabopen')
    nnoremap <silent><buffer><expr> <C-v>
          \ denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> <C-s>
          \ denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><Tab> j
    nnoremap <silent><buffer><S-Tab> k
endfunction

function! s:denite_filter_settings() abort
    imap <silent><buffer> <Esc> <Plug>(denite_filter_quit)
    inoremap <silent><buffer> <Tab>
                \ <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
    inoremap <silent><buffer> <S-Tab>
                \ <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
    " inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    if exists('*deoplete#custom#buffer_option')
        call deoplete#custom#buffer_option('auto_complete', v:false)
    endif
endfunction

function! s:denite_key_mapping() abort
    " KEY MAPPINGS
    let s:insert_mode_mappings = [
          \ ['<Esc>', '<denite:enter_mode:normal>', 'noremap'],
          \ ['<Tab>', '<denite:move_to_next_line>', 'noremap'],
          \ ['<C-j>', '<denite:move_to_next_line>', 'noremap'],
          \ ['<S-tab>', '<denite:move_to_previous_line>', 'noremap'],
          \ ['<C-k>', '<denite:move_to_previous_line>', 'noremap'],
          \ ['<C-t>', '<denite:do_action:tabopen>', 'noremap'],
          \ ['<C-v>', '<denite:do_action:vsplit>', 'noremap'],
          \ ['<C-s>', '<denite:do_action:split>', 'noremap'],
          \ ['<C-N>', '<denite:assign_next_matched_text>', 'noremap'],
          \ ['<C-P>', '<denite:assign_previous_matched_text>', 'noremap'],
          \ ['<Up>', '<denite:assign_previous_text>', 'noremap'],
          \ ['<Down>', '<denite:assign_next_text>', 'noremap'],
          \ ['<C-Y>', '<denite:redraw>', 'noremap'],
          \ ]

    let s:normal_mode_mappings = [
          \ ['<C-n>', '<denite:jump_to_next_source>', 'noremap'],
          \ ['<C-p>', '<denite:jump_to_previous_source>', 'noremap'],
          \ ['<Tab>', '<denite:move_to_next_line>', 'noremap'],
          \ ['<C-j>', '<denite:move_to_next_line>', 'noremap'],
          \ ['<S-tab>', '<denite:move_to_previous_line>', 'noremap'],
          \ ['<C-k>', '<denite:move_to_previous_line>', 'noremap'],
          \ ['gg', '<denite:move_to_first_line>', 'noremap'],
          \ ['<C-t>', '<denite:do_action:tabopen>', 'noremap'],
          \ ['<C-v>', '<denite:do_action:vsplit>', 'noremap'],
          \ ['<C-s>', '<denite:do_action:split>', 'noremap'],
          \ ['q', '<denite:quit>', 'noremap'],
          \ ['r', '<denite:redraw>', 'noremap'],
          \ ]

    " this is for old version of denite
    for s:m in s:insert_mode_mappings
      call denite#custom#map('insert', s:m[0], s:m[1], s:m[2])
    endfor
    for s:m in s:normal_mode_mappings
      call denite#custom#map('normal', s:m[0], s:m[1], s:m[2])
    endfor

    unlet s:m s:insert_mode_mappings s:normal_mode_mappings
endfunction

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

function! s:source_file_rec_git() abort
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " file/rec/git
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    call denite#custom#alias('source', 'file/rec/git', 'file/rec')
    call denite#custom#var('file/rec/git', 'command',
          \ ['git', 'ls-files', '-co', '--exclude-standard', GetGitRoot()])
endfunction

function! s:source_menu_vim_plugins() abort
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Add plugin config manager to Denite menu
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let s:menus = {}

    let s:menus.vim_plugins = {
        \ 'description': 'Edit vim plugin configuration'
        \ }
    " split string to list
    function! s:lines(msg)
      return split(a:msg, "[\r\n]")
    endfunction

    " list files
    function! s:glob(from, pattern)
      return s:lines(globpath(a:from, a:pattern))
    endfunction

    " extract filename from fullpath
    function! s:filename(fullpath) abort
        return matchstr(a:fullpath, "[a-z-.]\\+$")
    endfunction

    let s:exists = {}
    " let lenp = strlen('plug-')
    " let lene = strlen('.vim')
    for name in s:glob($CONFROOT, '*')
        let fname = s:filename(name)
        let s:exists[name] = name
        " let s:exists[strpart(fname, lenp, len(fname) - lenp - lene)] = name
    endfor

    let s:files = [
        \ 'main.vim', 'plugins.vim', 'plugins.config.vim', 'functions.vim',
        \ 'README.md', 'INSTALL.md',
        \ ]
    for name in g:plugs_order
        call add(s:files, 'plug-'.name.'.vim')
    endfor

    let s:plugs = []
    for name in s:files
        if has_key(s:exists, name)
            let display = name . ' - [exists]'
        else
            let display = name
        endif
        call add(s:plugs, [display, simplify(expand($CONFROOT.'/'.name))])
    endfor
    let s:menus.vim_plugins.file_candidates = s:plugs

    "===============================================================================
    " Git command
    "===============================================================================
    let s:menus.git = {
      \ 'description' : '            gestionar repositorios git
      \                            ⌘ [espacio]g',
      \}
    let s:menus.git.command_candidates = [
      \ ['▷ tig                                                        ⌘ ,gt',
      \ 'normal ,gt'],
      \ ['▷ git status       (Fugitive)                                ⌘ ,gs',
      \ 'Gstatus'],
      \ ['▷ git diff         (Fugitive)                                ⌘ ,gd',
      \ 'Gdiff'],
      \ ['▷ git commit       (Fugitive)                                ⌘ ,gc',
      \ 'Gcommit'],
      \ ['▷ git log          (Fugitive)                                ⌘ ,gl',
      \ 'exe "silent Glog | Unite quickfix"'],
      \ ['▷ git blame        (Fugitive)                                ⌘ ,gb',
      \ 'Gblame'],
      \ ['▷ git stage        (Fugitive)                                ⌘ ,gw',
      \ 'Gwrite'],
      \ ['▷ git checkout     (Fugitive)                                ⌘ ,go',
      \ 'Gread'],
      \ ['▷ git rm           (Fugitive)                                ⌘ ,gr',
      \ 'Gremove'],
      \ ['▷ git mv           (Fugitive)                                ⌘ ,gm',
      \ 'exe "Gmove " input("destino: ")'],
      \ ['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
      \ 'Git! push'],
      \ ['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
      \ 'Git! pull'],
      \ ['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
      \ 'exe "Git! " input("comando git: ")'],
      \ ['▷ git cd           (Fugitive)',
      \ 'Gcd'],
      \ ]

    "===============================================================================
    " HTTP Status Code Definitions
    "===============================================================================
    let s:menus.StatusCodeDefinitions = {'description':
          \ 'HTTP status code definitions             <leader>sc'}
    let s:menus.StatusCodeDefinitions.command_candidates = [
          \ ['➤ 100 Continue                                                   ',
          \  'echo "Continue"'],
          \ ['➤ 101 Switching Protocols                                        ',
          \  'echo "Switching Protocols"'],
          \ ['➤ 200 OK                                                         ',
          \  'echo "OK"'],
          \ ['➤ 201 Created                                                    ',
          \  'echo "Created"'],
          \ ['➤ 202 Accepted                                                   ',
          \  'echo "Accepted"'],
          \ ['➤ 203 Non-Authoritative Information                              ',
          \  'echo "Non-Authoritative Information"'],
          \ ['➤ 204 No Content                                                 ',
          \  'echo "No Content"'],
          \ ['➤ 205 Reset Content                                              ',
          \  'echo "Reset Content"'],
          \ ['➤ 206 Partial Content                                            ',
          \  'echo "Partial Content"'],
          \ ['➤ 300 Multiple Choices                                           ',
          \  'echo "Multiple Choices"'],
          \ ['➤ 301 Moved Permanently                                          ',
          \  'echo "Moved Permanently"'],
          \ ['➤ 302 Found                                                      ',
          \  'echo "Found"'],
          \ ['➤ 303 See Other                                                  ',
          \  'echo "See Other"'],
          \ ['➤ 304 Not Modified                                               ',
          \  'echo "Not Modified"'],
          \ ['➤ 305 Use Proxy                                                  ',
          \  'echo "Use Proxy"'],
          \ ['➤ 307 Temporary Redirect                                         ',
          \  'echo "Temporary Redirect"'],
          \ ['➤ 400 Bad Request                                                ',
          \  'echo "Bad Request"'],
          \ ['➤ 401 Unauthorized                                               ',
          \  'echo "Unauthorized"'],
          \ ['➤ 402 Payment Required                                           ',
          \  'echo "Payment Required"'],
          \ ['➤ 403 Forbidden                                                  ',
          \  'echo "Forbidden"'],
          \ ['➤ 404 Not Found                                                  ',
          \  'echo "Not Found"'],
          \ ['➤ 405 Method Not Allowed                                         ',
          \  'echo "Method Not Allowed"'],
          \ ['➤ 406 Not Acceptable                                             ',
          \  'echo "Not Acceptable"'],
          \ ['➤ 407 Proxy Authentication Required                              ',
          \  'echo "Proxy Authoritative Required"'],
          \ ['➤ 408 Request Timeout                                            ',
          \  'echo "Request Timeout"'],
          \ ['➤ 409 Conflict                                                   ',
          \  'echo "Conflict"'],
          \ ['➤ 410 Gone                                                       ',
          \  'echo "Gone"'],
          \ ['➤ 411 Length Required                                            ',
          \  'echo "Length Required"'],
          \ ['➤ 412 Precondition Failed                                        ',
          \  'echo "Precondition Failed"'],
          \ ['➤ 413 Request Entity Too Large                                   ',
          \  'echo "Request Entity Too Large"'],
          \ ['➤ 414 Request-URI Too Long                                       ',
          \  'echo "Request-URI Too Long"'],
          \ ['➤ 415 Unsupported Media Type                                     ',
          \  'echo "Unsupported Media Type"'],
          \ ['➤ 416 Requested Range Not Satisfiable                            ',
          \  'echo "Requested Range Not Satisfiable"'],
          \ ['➤ 417 Expectation Failed                                         ',
          \  'echo "Expectation Failed"'],
          \ ['➤ 422 Unprocessable Entity                                       ',
          \  'echo "Unprocessable Entity"'],
          \ ['➤ 500 Internal Server Error                                      ',
          \  'echo "Internal Server Error"'],
          \ ['➤ 501 Not Implemented                                            ',
          \  'echo "Not Implemented"'],
          \ ['➤ 502 Bad Gateway                                                ',
          \  'echo "Bad Gateway"'],
          \ ['➤ 503 Service Unavailable                                        ',
          \  'echo "Service Unavailable"'],
          \ ['➤ 504 Gateway Timeout                                            ',
          \  'echo "Gateway Timeout"'],
          \ ['➤ 505 HTTP Version Not Supported                                 ',
          \  'echo "HTTP Version Not Supported"'],
          \ ]

    call denite#custom#var('menu', 'menus', s:menus)
endfunction

function! s:default_source_settings() abort
    " === Denite setup ==="
    " Use ripgrep for searching current directory for files
    " By default, ripgrep will respect rules in .gitignore
    "   --files: Print each file that would be searched (but don't search)
    "   --glob:  Include or exclues files for searching that match the given glob
    "            (aka ignore .git files)
    let s:ignores = '.jpg,.png,.pdf.exe.doc'
    if executable('rg')
        " For ripgrep
        " Note: It is slower than ag
        call denite#custom#var('file/rec', 'command',
                    \ ['rg', '--hidden', '--files', '--glob', '!.git']
                    \ )
    elseif executable('ag')
      " Change file/rec command.
      call denite#custom#var('file/rec', 'command',
                  \ ['ag' , '--nocolor', '--nogroup', '-g', '']
                  \ )
    elseif executable('pt')
        " For Pt(the platinum searcher)
        call denite#custom#var('file/rec', 'command',
                    \ ['pt', '--nocolor', '--ignore', '.git', '--hidden', '-g=', ''])
    endif

    " FIND and GREP COMMANDS
    if executable('rg')
      " Ripgrep command on grep source
      call denite#custom#var('grep', 'command', ['rg'])
      call denite#custom#var('grep', 'default_opts',
                  \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
      call denite#custom#var('grep', 'recursive_opts', [])
      call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
      call denite#custom#var('grep', 'separator', ['--'])
      call denite#custom#var('grep', 'final_opts', [])
    elseif  executable('pt')
      " Pt command on grep source
      call denite#custom#var('grep', 'command', ['pt'])
      call denite#custom#var('grep', 'default_opts',
                  \ ['--nogroup', '--nocolor', '--smart-case'])
      call denite#custom#var('grep', 'recursive_opts', [])
      call denite#custom#var('grep', 'pattern_opt', [])
      call denite#custom#var('grep', 'separator', ['--'])
      call denite#custom#var('grep', 'final_opts', [])
    elseif executable('ag')
      call denite#custom#var('grep', 'command', ['ag'])
      call denite#custom#var('grep', 'default_opts',
                  \ [ '--vimgrep', '--smart-case' ])
      call denite#custom#var('grep', 'recursive_opts', [])
      call denite#custom#var('grep', 'pattern_opt', [])
      call denite#custom#var('grep', 'separator', ['--'])
      call denite#custom#var('grep', 'final_opts', [])
    elseif executable('ack')
      " Ack command
      call denite#custom#var('grep', 'command', ['ack'])
      call denite#custom#var('grep', 'default_opts',
                  \ ['--ackrc', $HOME.'/.config/ackrc', '-H',
                  \ '--nopager', '--nocolor', '--nogroup', '--column'])
      call denite#custom#var('grep', 'recursive_opts', [])
      call denite#custom#var('grep', 'pattern_opt', ['--match'])
      call denite#custom#var('grep', 'separator', ['--'])
      call denite#custom#var('grep', 'final_opts', [])
    endif

    " buffer date format
    call denite#custom#var('buffer', 'date_format', '%m-%d-%Y %H:%M:%S')
endfunction

autocmd sourcepost $VIMFILES/denite.nvim/plugin/*.vim call s:denite_end()
function! s:denite_end() abort
    " denite option
    call denite#custom#option('default', {
                \   'wincol': &columns * 1 / 8,
                \   'winwidth': &columns * 3 / 4,
                \   'split': 'floating',
                \   'root_markers': '.git,.svn',
                \   'start_filter': 1,
                \   'source_names': 'short',
                \   'statusline' : has('patch-7.4.1154') ? v:false : 0,
                \   'prompt' : '➜',
                \   'highlight_filter_background': 'DeniteFilter',
                \   'highlight_matched_char': 'DeniteMatchedChar',
                \   'highlight_matched_range': 'DeniteMatchedRange',
                \   'highlight_preview_line': 'DeniteMatchedChar',
                \   'highlight_prompt': 'DenitePrompt',
                \   'highlight_window_background': 'DeniteMenu',
                \ })

    " denite key mapping
    call s:denite_key_mapping()

    " denite colors
    call s:denite_colors()

    " source file/rec/git
    call s:source_file_rec_git()

    " source menu -> vim-plugins
    call s:source_menu_vim_plugins()

    " default source setting
    call s:default_source_settings()

    " test source
    " call s:source_test()
endfunction

" function s:source_test() about
" endfunction
