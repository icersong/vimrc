vimrc
=====

# 消息系统

* 历史消息

    :messages

* 查看错误

    :echo errmsg

* 错误说明

    :help <error no>


# 剪切板

* 粘贴出现多余缩进问题

    :set paste
    [do paste]
    :set nopaste


# 格式化json
   :%!python -m json.tool


# 调试加载速度

* 使用 --startuptime 启动 vim 即可，例如：

    $ vim --startuptime tmp.txt
    $ vim --startuptime tmp.txt ~/.vimrc


* 其它调试手段

    $ vim -V9

（或者在您的 vimrc 最前面加上 `set vbs=9`）XD


* 开启调试信息，记录那些插件影响速度

You can use built-in profiling support: after launching vim do

    :profile start profile.log
    :profile func *
    :profile file *
    " At this point do slow actions
    :profile pause
    :no


* 借助插件分析插件性能

    Plug 'hyiltiz/vim-plugins-profile'
