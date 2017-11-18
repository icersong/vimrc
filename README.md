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


* 编辑时开启记录调试信息

    :profile start profile.log
    :profile func *
    :profile file *
    " At this point do slow actions
    :profile pause
    :noautocmd qall! [ Translation service is temporarily unavailable]


* 开启调试信息，记录那些插件影响速度

You can use built-in profiling support: after launching vim do

    :profile start profile.log
    :profile func *
    :profile file *
    " At this point do slow actions
    :profile pause
    :no


* 借助插件分析插件性能

   - Plug 'hyiltiz/vim-plugins-profile'


# 帮助使用

## 标题跳转

    Ctrl-] 跳转到光标所在标题内容区

## 帮助查询

    :h r 表示查找普通模式下的帮助信息

    :h v_r 表示查找可视化模式下的帮助信息

    :h i_CTRL_W 表示查找插入模式下快捷键的帮助信息

    :h c_CTRL_W 表示查找命令行模式下快捷键的帮助信息

    :h /\r 表示查找搜索的正则表达式

    :h 'ro' 表示查找操作帮助信息

    :h -r 表示查找参数的帮助信

    :help quickref命令，可以查看快速索引

    :help tips命令，可以查看使用技巧

## 帮助模糊匹配

    :helpgrep ...

    :cnext 下一个匹配

    :cprev 前一个匹配

# QuickFix 窗口操作

    :cwindow

    :cclose

# VIM内建鼠标支持

    Ctrl+LeftMouse == Ctrl-T
    Ctrl+RightMouse == Ctrl-]


# Plugins

## vimux

Configue .tmux.conf file

    # navigate panels between tmux & vim
    # Smart pane switching with awareness of Vim splits.
    # See: https://github.com/christoomey/vim-tmux-navigator
    is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
        | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
    bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
    bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
    bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
    bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
    bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
    bind-key -T copy-mode-vi C-h select-pane -L
    bind-key -T copy-mode-vi C-j select-pane -D
    bind-key -T copy-mode-vi C-k select-pane -U
    bind-key -T copy-mode-vi C-l select-pane -R
    bind-key -T copy-mode-vi C-\ select-pane -l

    bind -r C-h run "tmux select-pane -L"
    bind -r C-j run "tmux select-pane -D"
    bind -r C-k run "tmux select-pane -U"
    bind -r C-l run "tmux select-pane -R"
    bind -r C-\ run "tmux select-pane -l"
