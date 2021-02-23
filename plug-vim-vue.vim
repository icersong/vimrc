" 解决滑动过快高亮失效
autocmd FileType vue syntax sync fromstart

" 使用一些已经写好的html、css、js配置
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
