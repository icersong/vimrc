set nobackup
set nowritebackup

" Use Enter to confirm select
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
    \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" <TAB> select
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
autocmd BufWritePost call coc#refresh()


" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gk <Plug>(coc-diagnostic-prev)
nmap <silent> gj <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)<cr>

" Remap for format selected region
xmap <leader>fmt  <Plug>(coc-format-selected)<cr>
nmap <leader>fmt  <Plug>(coc-format-selected)<cr>

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'cocstatus': 'coc#status'
"       \ },
"       \ }

" air-line
" use error & warning count of diagnostics form coc.nvim
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" create a part for server status.
if index(g:plugs_order, 'vim-airline') >= 0
    function! GetServerStatus()
      return get(g:, 'coc_status', '')
    endfunction
    call airline#parts#define_function('coc', 'GetServerStatus')
    function! AirlineInit()
      let g:airline_section_a = airline#section#create(['coc'])
    endfunction
    autocmd User AirlineAfterInit call AirlineInit()
    " exclude overwrite statusline of list filetype
    let g:airline_exclude_filetypes = ["list"]
    " Change error symbol:
    let airline#extensions#coc#error_symbol = 'Error:'
    " Change warning symbol:
    let airline#extensions#coc#warning_symbol = 'Warning:'
    " Change error format:
    let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
    " Change warning format:
    let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
endif

" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
let g:coc_global_extensions = [
    \ 'coc-highlight',
    \ 'coc-snippets',
    \ 'coc-python',
    \ 'coc-eslint',
    \ 'coc-emmet',
    \ 'coc-vetur',
    \ 'coc-yaml',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ ]
