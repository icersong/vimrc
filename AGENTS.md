# nvim-config

**Generated:** 2026-04-29
**Author:** icersong

---

## 项目结构

```
nvim-config/
├── init.vim           # 入口: Python3环境 + 加载 main.vim
├── main.vim           # 核心配置: 环境/UI/键映射/插件加载 (517行)
├── plugins.vim        # 插件声明: vim-plug (90+ 插件)
├── keymap.vim         # 键盘映射扩展
├── coc-settings.json  # LSP 客户端配置
├── vimrc              # 存根: source init.vim
├── plugins/           # 81个插件配置文件
│   ├── fzf.vim.vim    # FZF 模糊搜索
│   ├── coc.nvim.vim  # LSP
│   ├── vim-airline.vim
│   └── ...
├── autoload/          # 工具函数
│   ├── cursorstyle.vim
│   ├── formaters.vim
│   ├── functools.vim
│   └── bufswitch.vim
└── snippets/          # 代码片段
```

---

## 加载流程

```
vim → vimrc → init.vim → main.vim → plugins.vim
                                    ↓
                              plugins/ (*.vim)
```

**启动顺序** (main.vim):
1. 行18-20: 平台检测 ($MACOS, $LINUX, $WINDOWS)
2. 行22-33: 路径环境变量
3. 行86-88: Leader 配置
4. 行102: netrw.vim
5. 行110: bufswitch#default_maps()
6. 行124: plugins.vim (插件加载)
7. 行128-152: colorscheme 初始化

---

## 核心约定

| 配置项 | 值 | 位置 |
|--------|-----|------|
| Leader | `,` (逗号) | main.vim:87 |
| 缩进 | 4空格, expandtab | main.vim:332-336 |
| 编码 | UTF-8 | main.vim:324 |
| 颜色 | solarized8_flat/dark | main.vim:147-152 |
| Python3 | ~/.pyenv/versions/nvim-py3 | init.vim:14-15 |

**平台支持**: macOS / Linux / Windows

---

## 插件分类

### LSP / 补全
| 插件 | 用途 |
|------|------|
| coc.nvim | LSP 客户端 (nvim only) |
| YouCompleteMe | 备用补全 |
| ultisnips | 代码片段 |
| semshi | Python 语法增强 |
| jedi-vim | Python 跳转/补全 |

### 文件搜索 (冗余 - 建议保留2-3个)
| 插件 | 用途 |
|------|------|
| fzf.vim | 模糊搜索 |
| LeaderF | 文件/符号搜索 |
| CtrlSF | 内容搜索 + 预览 |
| defx.nvim | 文件浏览器 |
| vista / tagbar | 代码导航 |

### UI 增强
| 插件 | 用途 |
|------|------|
| vim-airline | 状态栏 |
| vim-bufferline | 缓冲区标签 |
| vim-startify | 启动画面 |
| vim-minimap | 代码缩略图 |

### Git
| 插件 | 用途 |
|------|------|
| vim-fugitive | Git 命令 |
| vim-gitgutter | 行号标记 |
| vim-signify | 差异显示 |

### 开发工具
| 插件 | 用途 |
|------|------|
| vim-surround | 包裹/修改符号 |
| vim-commentary | 注释/取消注释 |
| vim-sneak / vim-easymotion | 快速移动 |
| vim-expand-region | 选中区域扩展 |

---

## FZF 配置详解

**插件加载** (plugins.vim:125-127):
```vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
```

**FZF 路径** (main.vim:490):
```vim
set rtp+=/usr/local/opt/fzf
```

### Find vs Rg 区别

| 特性 | Find | Rg |
|------|------|-----|
| 大小写 | `--ignore-case` 始终忽略 | `--smart-case` 智能 |
| 快捷键 | `<leader>fa` | `<leader>fw` |

### 快捷键速查

| 快捷键 | 命令 | 用途 |
|--------|------|------|
| `<leader>fb` | `:Buffers` | 缓冲区列表 |
| `<leader>f.` | `:Files` | 文件搜索 |
| `<leader>fg` | `:GFiles` | Git文件 |
| `<leader>fh` | `:History` | 历史文件 |
| `<leader>ff` | `:GFilesOrFiels` | 智能文件 |
| `<leader>fa` | `:Find` | 内容搜索(忽略大小写) |
| `<leader>fw` | `:Rg <word>` | 内容搜索(智能大小写) |

---

## 键盘映射 (main.vim 400+)

### 常用操作
```vim
", ,"          " 取消搜索高亮
", zz"         " 开关折叠
", z0-z9"      " 设置折叠级别
", q / ,Q"    " 关闭缓冲区
", w / ,W"    " 保存
", x / ,X"    " 保存并退出
```

### 移动
```vim
" 视觉模式缩进
< <  > >       " 左右缩进

" 行移动
S-J / S-K    " 上下移动行
```

### Buffer
```vim
<leader> / <leader>.  " 上一个/下一个 buffer
```

---

## 自定义命令

```vim
:TrailingWhitespace  " 清除尾部空白
:FormatJSON           " JSON 格式化
:FormatXML            " XML 格式化
:FormatSQL            " SQL 格式化
:ProfileStartLog      " 启动性能分析
:DiffOrig             " 比较差异
```

---

## 问题排查

### 插件不工作
1. 检查 `:PlugStatus`
2. 检查 `$VIMFILES` 路径
3. 验证插件依赖 (rg, git, etc.)

### 性能问题
```vim
:profile start profile.log
:profile func *
:profile file *
" 执行操作后
:profile pause
```

### 常见问题
- **列粘贴失效**: `clipboard=unnamedplus` 已注释 (main.vim:163)
- **FZF 不工作**: 检查 `/usr/local/opt/fzf` 是否存在
- **coc.nvim**: 仅支持 nvim (plugins.vim:298-300)

---

## 注意事项 (ANTI-PATTERNS)

- ❌ 禁止: plug/vundle (使用 vim-plug)
- ❌ 禁止: python2 (仅 py3)
- ❌ 禁止: `clipboard=unnamedplus` (会破坏列粘贴)
- ❌ 禁止: `netrw.vim` (默认禁用)

---

## 更新日志

- 2026-04-29: 初始版本
- 添加 FZF 配置详解
- 添加插件分类
- 添加键盘映射速查