" sdcv 本地词典
"   安装工具 sudo apt install sdcv
"   下载词典 https://kdr2.com/resource/stardict.html
"   词典路径 $(HOME)/.startdict/dic/

nmap <silent> <Leader>sd <Plug>TranslateW
vmap <silent> <Leader>sd <Plug>TranslateWV
let g:translator_default_engines=['haici', 'bing']
