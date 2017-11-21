"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale     {{{1
" check syntax for all language while write file.

nmap <silent> <leader>jp <Plug>(ale_previous_wrap)
nmap <silent> <leader>jn <Plug>(ale_next_wrap)

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_error = "✘"
let g:ale_sign_warning = "⚠"
let g:ale_sign_style_error = "✗"
let g:ale_sign_style_warning = "◬"
let g:ale_echo_msg_format = '[%severity%] [%linter%] %code: %%s'

let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_python_pylint_options = '-d line-too-long -d invalid-name'

let g:ale_fixers = {
      \ 'xml': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \ ],
      \ 'css': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \ ],
      \ 'php': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \ ],
      \ 'html': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \ ],
      \ 'json': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \ ],
      \ 'jinja': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \ ],
      \ 'python': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \   'autopep8',
      \ ],
      \ 'javascript': [
      \   'eslint',
      \   {buffer, lines -> filter(lines, 'v:val !=~ ''^\s*//''')},
      \ ],
      \}
