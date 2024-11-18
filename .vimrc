"去掉vi的一致性"
set nocompatible
set backspace=2
set tabstop=4       " 一个 Tab 字符显示为 4 个空格宽度
set shiftwidth=4    " 自动缩进的宽度为 4 个空格
set expandtab       " 按 Tab 键时插入空格，而不是 Tab 字符
"显示相对行号
" set relativenumber
syntax on   "开启语法高亮"
" 设置配色方案"
colorscheme solarized
let g:solarized_termcolors=256  "solarized主题设置在终端下的设置"
set background=dark     "设置背景色"

set showmatch   "显示匹配的括号"
set scrolloff=5     "距离顶部和底部5行"
set laststatus=2    "命令行为两行"
set fenc=utf-8      "文件编码"
set encoding=utf-8 "编码"
set matchtime=2     "匹配括号高亮的时间"
set ignorecase      "忽略大小写"
set incsearch      "实时搜索"
set hlsearch        "高亮搜索项"
set autoread
set cursorline      "突出显示当前行"
set cursorcolumn        "突出显示当前列"
set viminfo='100,<1000,s100

call plug#begin()
Plug 'chun-yang/auto-pairs'
Plug 'vim-airline/vim-airline'
call plug#end()

