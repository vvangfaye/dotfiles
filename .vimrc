"去掉vi的一致性"
set nocompatible
set backspace=2
set tabstop=4       " 一个 Tab 字符显示为 4 个空格宽度
set shiftwidth=4    " 自动缩进的宽度为 4 个空格
set expandtab       " 按 Tab 键时插入空格，而不是 Tab 字符
"显示相对行号
" set relativenumber

set termguicolors
syntax enable
set background=dark

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
Plug 'arzg/vim-colors-xcode'
" easy motion
Plug 'easymotion/vim-easymotion'
" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set mouse= "禁用鼠标
colorscheme xcode
let g:airline_theme='xcode'

" 设置Leader键为空格键
let mapleader = " "
" 设置快捷键
" 保存文件
nnoremap <leader>w :w<CR>
" 保存并退出
nnoremap <leader>q :wq<CR>

" easy motion
let g:EasyMotion_smartcase = 1
