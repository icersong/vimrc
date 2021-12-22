"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: icersong <icersong@gmail.com>
" Created: 2013-10-10
" Modified: 2021-12-22
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins configure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start page {{{1
" Plug 'mhinz/vim-startify'
let g:startify_session_dir = $VIMCACHE.'/session'
" let g:startify_list_order = ['files', 'dir', 'bookmarks', 'sessions', 'commands']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smooth scroll {{{1
" Plug 'terryma/vim-smooth-scroll'
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 9)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 9)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 9)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 9)<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized theme  {{{1
" solarized8 theme  {{{1
" Plug 'altercation/vim-colors-solarized'
" Plug 'lifepillar/vim-solarized8'
let g:solarized_hitrail     = 1
let g:solarized_menu        = 0
let g:solarized_contrast    = "normal"
let g:solarized_visibility  = "normal"
let g:solarized_diffmode = "high"
if !has('gui_running')
  let g:solarized_termcolors  = 256
  let g:solarized_termtrans   = 1
  let g:solarized_degrade     = 1
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-clap    {{{1

let g:clap_theme = 'material_design_dark'
let g:clap_theme = { 'search_text': {'guifg': 'yellow', 'ctermfg': 'yellow'} }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quickhl {{{1
" Plug 't9md/vim-quickhl'
" autocmd BufWinEnter * execute "call quickhl#cword#enable()"
let g:quickhl_manual_enable_at_startup = 1
let g:quickhl_cword_enable_at_startup = 1
let g:quickhl_manual_colors = [
      \ "gui=bold ctermfg=white ctermbg=17 guifg=white guibg=#000044",
      \ "gui=bold ctermfg=white ctermbg=52 guibg=white guifg=#440000",
      \ "gui=bold ctermfg=white ctermbg=22 guibg=white guifg=#004400",
      \ "gui=bold ctermfg=white ctermbg=9  guibg=white guifg=#444400",
      \ "gui=bold ctermfg=white ctermbg=4  guibg=white guifg=#004444",
      \ "gui=bold ctermfg=white ctermbg=5  guibg=white guifg=#440044",
      \ "gui=bold ctermfg=white ctermbg=3  guibg=white guifg=#224488",
      \ "gui=bold ctermfg=white ctermbg=2  guibg=white guifg=#884422",
      \ "gui=bold ctermfg=white ctermbg=1  guibg=white guifg=#448822",
      \ ]
nmap <leader>mm <Plug>(quickhl-manual-this)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VOoM  {{{1
" Plug 'vim-voom/VOoM'
let g:voom_tree_placement = "right"
let g:voom_tree_width = 40
let g:voom_tab_key = "<C-Tab>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion  {{{1
" fast jump to after current, nmap s<char><char>
" Plug 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = ";"
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ;'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-sneak  {{{1
" fast jump to after current, \\f<char>
" Plug 'justinmk/vim-sneak'
let g:sneak#label = 1
let g:sneak#target_labels = ";abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent line {{{1
" Plug 'Yggdroot/indentLine'
let g:indentLine_maxLines = 999
let g:indentLine_faster = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" polyglot {{{1
" Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = []
let g:jsx_ext_required = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow_parentheses   {{{1
" high light parentheses with different color
" Plug 'kien/rainbow_parentheses.vim'

" let g:rbpt_loadcmd_toggle = 0
" let g:rbpt_max = 9
" " autocmd VimEnter * nested :RainbowParenthesesToggle
" autocmd VimEnter * RainbowParenthesesToggle
" autocmd Syntax * RainbowParenthesesLoadRound
" autocmd Syntax * RainbowParenthesesLoadSquare
" autocmd Syntax * RainbowParenthesesLoadBraces
" " autocmd Syntax * RainbowParenthesesLoadChevrons


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FastFold    {{{1
" Plug 'Konfekt/FastFold'

nmap zuz <Plug>(FastFoldUpdate)
xnoremap iz :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zv[z<cr>
xnoremap az :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zV[z<cr>

let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

" let g:tex_fold_enabled=1
" let g:vimsyn_folding='af'
" let g:xml_syntax_folding = 1
" let g:php_folding = 1
" let g:perl_fold = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'tmhedberg/SimpylFold' {{{1
let g:SimpylFold_docstring_preview=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips   {{{1
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
let g:UltiSnipsEditSplit='vertical'
"let g:UltiSnips = {}
let g:UltiSnipsListSnippets = '<C-L>'
"let g:UltiSnipsExpandTrigger = '<Tab>'
"let g:UltiSnipsJumpForwardTrigger = '<Tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"
let g:UltiSnipsSnippetsDir=simplify(expand($CONFROOT.'/snippets/UltiSnips'))
let g:UltiSnipsSnippetDirectories=[simplify(expand($VIMFILES.'/vim-snippets/UltiSnips'))]

let g:snips_author = 'icersong'
let g:snips_email = 'icersong@gmail.com'
let g:snips_github = 'https://github.com/icersong'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" html/css tools  {{{1
" fast create xml css html
" eg: root>elememnt#property*3>default<ctrl-y>,
" Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
function! ProxyEmmetInstall()
  if HasCmdValid('EmmetInstall')
    execute('EmmetInstall')
  endif
endfunction
autocmd FileType php,css,xml,tpl,htm,html,xhtml,jinja call ProxyEmmetInstall()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vdebug {{{1
" Plug 'joonty/vdebug'

let g:vdebug_options= {
\    "port" : 9000,
\}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DBGPavim  {{{1
" Plug 'brookhong/DBGPavim'
let g:dbgPavimBreakAtEntry = 0
let g:dbgPavimOnce = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PyDoc     {{{1
" Plug 'fs111/pydoc.vim'
" let g:pydoc_cmd = 'python -m pydoc'
let g:pydoc_perform_mappings = 0
let g:pydoc_window_lines=0.5
nnoremap <leader>? :Pydoc <C-R>=escape(expand("<cword>"), "/\\\*\ \|\(\)")<CR>
" 用ag在当前工程下搜索选中文本的文件名 gag
vnoremap <leader>? :Pydoc! <C-R>=escape(GetVisualSelection(), "/\\\*\ \|\(\)")<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'chrisbra/Colorizer'
" 注：此插件可能极度影响光标及输入的速度, 但是功能强于'gko/vim-coloresque'
" let g:colorizer_auto_color = 0
" let g:colorizer_auto_filetype='css,html,javascript,jinia,python,xdefaults'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" javascript indentation and syntax     {{{1
" Vastly improved Javascript indentation and syntax support in Vim
" Plug 'pangloss/vim-javascript'
let g:javascript_enable_domhtmlcss = 1
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
" let g:javascript_conceal_function   = "ƒ"
" let g:javascript_conceal_null       = "ø"
" let g:javascript_conceal_this       = "@"
" let g:javascript_conceal_return     = "⇚"
" let g:javascript_conceal_undefined  = "¿"
" let g:javascript_conceal_NaN        = "ℕ"
" let g:javascript_conceal_prototype  = "¶"
" let g:javascript_conceal_static     = "•"
" let g:javascript_conceal_super      = "Ω"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular  {{{1
" Plug 'godlygeek/tabular'
" let g:tabular_loaded = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TaskList.vim {{{1
" It will search the file for FIXME, TODO, and XXX ...
" Plug 'vim-scripts/TaskList.vim'
map <leader>tl <Plug>TaskList


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" better-whitespace {{{1
" improve from trailing-whitespace
" :StripWhitespace
" Plug 'ntpeters/vim-better-whitespace'

" autocmd FileType javascript,c,cpp,java,html,python,vim,tpl,css,jinja,markdown
"       \ autocmd BufWritePre <buffer> StripWhitespace
" let g:better_whitespace_filetypes_blacklist=['text', 'rich', 'diff', 'gitcommit', 'unite', 'qf', 'help']
" highlight ExtraWhitespace ctermbg=Red
" unmap <silent><space>
" nmap <silent><space> :nohls<CR>za


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent-object   {{{1
" select object by indent
" vii, viI, vai, vaI,
" Plug 'michaeljsmith/vim-indent-object'
nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" surround    {{{1
" normal-add-word: ysiw<symbol>  ysw<symbol>
" normal-add-line: yss<symbol>
" normal-change: cs<oldsymbol><newsymbol>  cst<newtag>
" normal-delete: ds<symbol>
" normal-delete-tag: dst
" visual-add: S<symbol>
" Plug 'tpope/vim-surround'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter   {{{1
" Plug 'scrooloose/nerdcommenter'
" <leader>cc add comment
" <leader>cu remove comment
" let NERDCreateDefaultMappings = 0
" let NERDSpaceDelims           = 1
" let NERDAllowAnyVisualDelims  = 1
" let NERDCommentEmptyLines     = 1
" let NERDCompactSexyComs       = 1
" let NERDDefaultAlign          = 'left'
" let NERDTrimTrailingWhitespace = 1
" let g:NERDCustomDelimiters = {
"     \ 'python': { 'left': '#', 'leftAlt': '#' },
" \ }
" vmap <BS> <plug>NERDCommenterToggle:nohls<CR>gv
" nmap <BS> <plug>NERDCommenterToggle
" nmap <leader>cc <plug>NERDCommenterToggle
" vmap <leader>cc <plug>NERDCommenterAlignBoth:nohls<CR>gv
" nmap <leader>cu <plug>NERDCommenterUncomment:nohls<CR>gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commentary {{{1
" Plug 'tpope/vim-commentary'
vmap <silent> <BS> <plug>Commentary:nohls<CR>gv
nmap <silent> <BS> :Commentary<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" multiple-cursors  {{{1
" Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_insert_maps={'I':1, 'i':1, 'a':1, 'A':1}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" expand-region   {{{1
" select region by key "+" & "-"
" Plug 'terryma/vim-expand-region'
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :1,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NrrwRgn   {{{1
" :NR      - Open the selected region in a new narrowed window
" :NW      - Open the current visual window in a new narrowed window
" Plug 'chrisbra/NrrwRgn'
let g:nrrw_rgn_wdth = 50
" let g:nrrw_rgn_resize_window = 'absolute'
" let g:nrrw_rgn_rel_min = 30
" let g:nrrw_rgn_rel_max = 80


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoVim  {{{1
" It is for Collaborative Editing. But not stable
" if $MACOS
"   Plug 'FredKSchott/CoVim'
"   let CoVim_default_name = "icersong"
"   let CoVim_default_port = "8888"
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - taglist   {{{1
" Plug 'vim-scripts/taglist.vim'
" "let Tlist_Auto_Open = 1
" let Tlist_Close_On_Select = 1
" let Tlist_File_Fold_Auto_Close = 1
" let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_Show_One_File = 1
" let Tlist_Use_Right_Window = 1
" let Tlist_Use_SingleClick = 1
" $ctags -R . 在当前目录下递归生成tags文件

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar {{{1
" Plug 'majutsushi/tagbar'
if !executable("ctags")
  if exists('janus#disable_plugin')
    call janus#disable_plugin("tagbar", "The ctags program is not installed")
  endif
else
  nmap <Leader>tb :TagbarToggle<CR>
  "let g:tagbar_ctags_bin='/usr/bin/ctags'
  let g:tagbar_width=33
  " let g:tagbar_autoclose = 1
  " let g:tagbar_autofocus = 1
  let g:tagbar_show_linenumbers = 1
  " let g:tagbar_singleclick = 1
  " autocmd BufReadPost *.cpp,*.c,*.h,*.py,*.js,*.php call tagbar#autoopen()
endif

" Plug 'liuchengxu/vista.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VCS   {{{1
" Plug 'vim-scripts/vcscommand.vim'
if $WINDOWS
  let g:VCSCommandSVNExec="D:\\PROGRA~1\\TORTOI~1\\bin\\svn.exe"
  let g:VCSCommandVCSTypeOverride= [['D:/tmp', 'SVN'], ['D:/MyWork', 'SVN']]
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-signify   {{{1
" Plug 'mhinz/vim-signify'
" UPDATE it to reflect your preferences, it will speed up opening files

let g:signify_vcs_list = ['git', 'svn']
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)

" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-signature  {{{1
" Plug 'kshenoy/vim-signature'
" virtual mark
" m.        If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
" m<space>  Delete all marks from te current buffer
" [` or ]`  Jump to prev or next mark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" commandline complete  {{{1
" Plug 'vim-scripts/CmdlineComplete'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" improved shell  {{{1
" Plug 'Shougo/vimproc.vim'
" Plug 'Shougo/vimshell.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-tmux-navigator  {{{1
" Plug "christoomey/vim-tmux-navigator"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimux  {{{1
" Plug 'benmills/vimux'

map <Leader>vxp normal! VimuxPromptCommand<CR>
map <Leader>vxl :VimuxRunLastCommand<CR>
map <Leader>vxi :VimuxInspectRunner<CR>
map <Leader>vxq :VimuxCloseRunner<CR>
map <Leader>vxk :VimuxInterruptRunner<CR>
map <Leader>vxz :call VimuxZoomRunner()<CR>

let g:VimuxHeight = "16"
let g:VimuxOrientation = "v"
let g:VimuxPromptString = "(tmux)$ "


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" calendar  {{{1
" Plug 'itchyny/calendar.vim'
" let g:calendar_frame = 'default'
" let g:calendar_cache_directory = simplify(expand($VIMCACHE.'/calendar'))
" Plug 'mattn/calendar-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'iamcco/markdown-preview.vim'
" :MarkdownPreview
" :MarkdownPreviewStop
" if $MACOS
"   let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
" else
"   let g:mkdp_path_to_chrome = "google-chrome"
"   " let g:mkdp_path_to_chrome = "chromium-browser"
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" suan/vim-instant-markdown
" 可在浏览器中实时预览正在编写的MD文档
" 安装需要node.js


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-vim-instant-markdown   {{{1
" python markdown实时预览，与其它markdown syntax冲突
" :Instantmd
" Plug 'isnowfy/python-vim-instant-markdown'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'gabrielelana/vim-markdown'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-which-key

" let g:mapleader = "\<Space>"
" let g:maplocalleader = ','
" call which_key#register('<Space>', "g:which_key_map")
" nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
" vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
" nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
" vnoremap <silent> <localleader> :<c-u>WhichKeyVisual  ','<CR>
" let g:which_key_map =  {}
" let g:which_key_map.f = { 'name' : '+file' }
" let g:which_key_map.f.f = 'search-git-file'
" let g:which_key_map.f.r = 'search-context-git-file'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ZoomWin  {{{1
" Plug 'vim-scripts/ZoomWin'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EnhancedDiff {{{1
" Plugin 'chrisbra/vim-diff-enhanced'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" xml.vim  {{{1
" Plug 'othree/xml.vim'
" auto close tag
":help xml-plugin
"<para>|   ==>  <para>|</para>
"<para>>|  ==>  <para>\n..|\n</para>
"LocalLeader is '\'
"<LocalLeader> d or D del tags or with contant
"<LocalLeader> % jump to the matching tag
" let xml_tag_completion_map = "<C-l>"
let g:xml_warn_on_duplicate_mapping = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lage file   {{{1
" Plug 'vim-scripts/LargeFile'
let g:LargeFile=9


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" timestamp   {{{1
" Plug 'icersong/timestamp.vim'
"@ Modified: 2014-09-09 00:00:00 [0]
let g:timestamp_regexp = '\v\C%(<%(Last %([cC]hanged?|modified)|Modified)\s*:\s+)@<='
let g:timestamp_regexp .= '(\d{4}[-/]\d{2}[-/]\d{2}|\d{4}[-/]\d{2}[-/]\d{2} \d{2}:\d{2}:\d{2}|TIMESTAMP)'
let g:timestamp_regexp .= '\s*(\[(\d+)\])?$'
let g:timestamp_rep = '\=strftime("%Y-%m-%d").(submatch(2)==submatch(9) ? "" : " [".(submatch(3)+1)."]")'
let g:timestamp_modelines = 9


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto load plugin's config while plug valid

call LoadConfigures($CONFROOT."/plugins", g:plugs_order)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin config end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
