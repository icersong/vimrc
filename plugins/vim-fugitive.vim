"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive   {{{1
" git wapper
" Plug 'tpope/vim-fugitive'
" autocmd QuickFixCmdPost *grep* cwindow
" command GPush :AsyncRun -raw=1 -post=copen git svn dcommit
" command GPull :AsyncRun -raw=1 -post=copen git svn rebase
command GStash :Git stash
command GStashPop :Git stash pop
" 修正本地查看远程分支列表
command GitRemotePruneOrigin :Git remote prune origin<CR>

nnoremap <silent><leader>gv :Gitv!<CR>
nnoremap <silent><leader>gV :Gitv --all<CR>
nnoremap <silent><leader>glola :AsyncRun -raw=1 -post=copen
      \ git --no-pager log --oneline --decorate --graph -40
      \ --date=format:"\%Y-\%m-\%d \%H:\%M:\%S" --pretty="format:\%h \%ad \%an \%s" %<CR>
nnoremap <silent><leader>gL :AsyncRun -raw=1 -post=copen
      \ git --no-pager log --oneline --decorate --graph -40
      \ --date=format:"\%Y-\%m-\%d \%H:\%M:\%S" --pretty="format:\%h \%ad \%an \%s" %<CR>
" nnoremap <silent><leader>gl :silent! Glog<CR>:bot copen<CR>
" nnoremap <silent><leader>ga :Git add %:p<CR><CR>
nnoremap <silent><leader>gs :Git<CR>
nnoremap <silent><leader>gc :Gcommit -v -q<CR>
nnoremap <silent><leader>gC :Gcommit -v -q --amend<CR>
nnoremap <silent><leader>gt :Gcommit -v -q %:p<CR>
nnoremap <silent><leader>gd :Gvdiff<CR>
nnoremap <silent><leader>gD :Git diff --stat origin<CR>
nnoremap <silent><leader>ge :Gedit<CR>
nnoremap <silent><leader>gr :Gread<CR>
nnoremap <silent><leader>gw :Gwrite<CR><CR>
nnoremap <silent><leader>go :Git checkout<Space>

nnoremap <silent><leader>gp :Gpush<CR>
nnoremap <silent><leader>gl :Gpull<CR>
nnoremap <silent><leader>gpoa :Gpush --tags<CR>

command! Gblame Git blame
