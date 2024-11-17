"去掉vi的一致性"
set nocompatible
"显示行号"
set number
" 隐藏滚动条"    
set guioptions-=r 
set guioptions-=L
set guioptions-=b
"隐藏顶部标签栏"
set showtabline=0
"设置字体"
set guifont=Monaco:h13         
syntax on   "开启语法高亮"
let g:solarized_termcolors=256  "solarized主题设置在终端下的设置"
set background=dark     "设置背景色"
set nowrap  "设置不折行"
set cindent     "设置C样式的缩进格式"
set tabstop=4   "设置table长度"
set shiftwidth=4        "同上"
set showmatch   "显示匹配的括号"
set scrolloff=5     "距离顶部和底部5行"
set laststatus=2    "命令行为两行"
set fenc=utf-8      "文件编码"
set backspace=2
set mouse=a     "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase      "忽略大小写"
set incsearch
set hlsearch        "高亮搜索项"
set noexpandtab     "不允许扩展table"
set whichwrap+=<,>,h,l
set autoread
set cursorline      "突出显示当前行"
set cursorcolumn        "突出显示当前列"

call plug#begin()
      Plug 'preservim/nerdtree'
	  Plug 'tpope/vim-fugitive'
	  Plug 'majutsushi/tagbar'
	  Plug 'chun-yang/auto-pairs'
	  Plug 'vim-airline/vim-airline'
	  Plug 'junegunn/vim-easy-align'
	  Plug 'airblade/vim-gitgutter'
	  Plug 'SirVer/ultisnips'
	  Plug 'honza/vim-snippets'
	  Plug 'Xuyuanp/nerdtree-git-plugin'
	  Plug 'jistr/vim-nerdtree-tabs'
	  Plug 'easymotion/vim-easymotion'
call plug#end()

" ######set for NERDTree############
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" 是否显示行号
let g:NERDTreeShowLineNumbers=1
nmap <F8> :NERDTreeToggle<CR>
nmap <F2> :NERDTreeFind<CR>
set viminfo='100,<1000,s100
set wrap
