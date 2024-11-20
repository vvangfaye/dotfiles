"去掉vi的一致性"
set nocompatible
set mouse=          "禁用鼠标
set backspace=2
set tabstop=4       " 一个 Tab 字符显示为 4 个空格宽度
set shiftwidth=4    " 自动缩进的宽度为 4 个空格
set expandtab       " 按 Tab 键时插入空格，而不是 Tab 字符
"显示相对行号
" set number
" set relativenumber

" 将 jk 映射为 Esc
inoremap jk <Esc>

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

" 响应超时时间
set timeoutlen=300       " 一般按键超时时间（单位：毫秒）
set ttimeoutlen=10       " 终端按键超时时间（单位：毫秒）

call plug#begin()
Plug 'chun-yang/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'arzg/vim-colors-xcode'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
call plug#end()

colorscheme xcodehc
let g:airline_theme='xcodedark'

" 设置Leader键为空格键
let mapleader = " "
" 设置快捷键
" 保存文件
nnoremap <leader>w :w<CR>
" 保存并退出
nnoremap <leader>wq :wq<CR>

" easy motion
let g:EasyMotion_smartcase = 1

" fzf
" 映射快捷键到 fzf 的核心功能
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" oscyank
nmap <leader>c <Plug>OSCYankOperator
nmap <leader>cc <leader>c_
vmap <leader>c <Plug>OSCYankVisual

" auto python template
autocmd BufNewFile *.py call InsertPyHeader()

function! InsertPyHeader()
    " 自定义模板内容
    call append(0, [
    \ '# ========================================',
    \ '# File Name: '.expand('%:t'),
    \ '# Author: Wang Yu',
    \ '# Created Date: '.strftime('%Y-%m-%d %H:%M:%S'),
    \ '# Description: ',
    \ '# ========================================',
    \ ''
    \ ])
    " 定位到 'Description:' 后
    execute "normal! gg" 
    call search('# Description:')
    execute "normal! A "    
endfunction
