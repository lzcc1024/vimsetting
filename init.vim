set number " 显示行号
set relativenumber " 显示相对行号
set encoding=utf-8 " 文件默认编码
set t_Co=256 " 指定配色方案为256
set nocompatible " 关闭VI兼容模式
syntax on " 文字内容高亮(语法高亮)
set cursorline " 高亮光标所在行
set cursorcolumn " 高亮光标所在列
" highlight cursorline cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
" highlight cursorcolumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
set ambiwidth=double " 设置为双字宽显示，否则无法完整显示一些Unicode字符
set showmatch " 高亮匹配括号
set helplang=cn " 设置帮助说明文档为中文(前提下载了中文文档包)
filetype on " 开启文件类型检测
filetype plugin on " 允许根据文件类型加载相关插件
filetype indent on " 允许根据文件类型定义不同的缩进格式
set autoindent " 新行根据前一次缩进自动缩进
set expandtab " tab键转空格
set tabstop=4 " tab键的显示宽度
set softtabstop=4 " tab键的行为宽度
set shiftwidth=4 " 缩进宽度
set list " 显示看不见字符
set listchars=tab:▸\ ,trail:▫ " 用特定的符号替换看不见的字符
set ruler " 在状态栏显示光标当前位置，哪一行哪一列
set hlsearch " 搜索关键词高亮
" 进入vim后关闭上次搜索结果的高亮
exec "nohlsearch"
set incsearch " 高亮所有匹配的字符
set ignorecase " 搜索忽略大小写
set smartcase " 如果搜索的文字中出现大写，则区分大小写搜索
set scrolloff=5 " 页面持续滚动时，光标距离窗口顶部或底部的偏移行数
" 打开文件后光标定位到关闭前所在的位置行
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set infercase " 区分大小写

set foldenable " 开启折叠
set foldmethod=indent " 根据语法来折叠
set foldlevel=99 " 折叠层级
set foldlevelstart=99 " 打开文件后的默认折叠层级

set linebreak " 换行时不拆分单词
set showcmd " 命令模式下，显示输入的命令
set smartindent " 智能缩进
set copyindent " 复制粘贴时保留原有的缩进

set wildmenu " 命令模式 开启tab键命令自动补全
set wildmode=longest,list,full " 命令模式 tab键自动补全模式

set backspace=indent,eol,start " Insert模式下，使退格键可以删掉任何东西

set autochdir " 自动切换工作目录到当前打开文件目录

set history=1000 " 历史命令最大条数

set undolevels=1000 " 撤销最大次数

set mouse-=a " 禁用鼠标行为

set wrap " 自动折行，即太长的行分成几行显示
set textwidth=80 " 设置行宽，即一行显示多少个字符
set cc=80,120
set wrapmargin=2 " 指定折行处与编辑窗口的右边缘之间空出的字符数
set sidescrolloff=15 " 水平滚动时，光标距离行首或行尾的位置（单位：字符）。该配置在不折行时比较有用
set laststatus=2 " 是否显示状态栏 0 表示不显示，1 表示只在多窗口时显示，2 表示显示

set showmode " 底部显示当前所处的模式

set noerrorbells " 出错时，不要发出响声
set visualbell " 出错时，发出视觉提示，通常是屏幕闪烁
set autoread " 打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示

set hidden " 允许VIM自动将未保存写入缓冲区

set splitright " 垂直分屏以后光标停留在右窗口
set splitbelow " 水平分屏以后光标停留在下窗口

set lazyredraw " 缓解滚动卡顿
set ttyfast " 提高滚动效率

" silent !mkdir -p ~/.config/nvim/tmp/backup " 静默创建备份目录
" silent !mkdir -p ~/.config/nvim/tmp/undo " 静默创建撤销记录目录

" 创建备份目录
if !isdirectory($HOME . "/.config/nvim/tmp/backup")
    call mkdir($HOME . "/.config/nvim/tmp/backup", "p", 0775)
endif

" 创建撤销记录目录
if !isdirectory($HOME . "/.config/nvim/tmp/undo")
    call mkdir($HOME . "/.config/nvim/tmp/undo", "p", 0775)
endif

set backupdir=~/.config/nvim/tmp/backup,. " 设置备份目录
set directory=~/.config/nvim/tmp/backup,. " 设置交换文件目录
if has('persistent_undo')
    set noundofile " 不保留撤销记录
    set undodir=~/.config/nvim/tmp/undo,.
endif

set nobackup " 不创建备份文件
set swapfile " 开启交换文件
set updatetime=1000 " 每隔1000毫秒保存数据到交换文件 默认4000毫秒
set updatecount=100 " 每隔100个字符保存数据到交换文件 默认200个字符

set termguicolors " 开启真彩色支持
set background=dark " 设置主色调 dark、light
highlight Normal guibg=NONE ctermbg=None


" https://blog.csdn.net/u013595419/article/details/54898490 配色指南
" https://github.com/theniceboy/nvim/blob/master/init.vim
" https://www.jianshu.com/p/a984ea030005
" https://linux.cn/article-10039-1.html
" https://www.cnblogs.com/cniwoq/p/13272746.html

" Normal模式中非递归方式禁用键盘方向
"nnoremap <Up> <Nop>
"nnoremap <Down> <Nop>
"nnoremap <Left> <Nop>
"nnoremap <Right> <Nop>

" 初次使用时加载插件管理插件
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 插件列表
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'chr4/nginx.vim'
Plug 'sickill/vim-monokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let g:indentLine_color_term = 239 "对其线颜色

syntax enable
colorscheme monokai " 查看默认色彩方案列表执行 :colorscheme [space] [tab]

" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions 插件列表
let g:coc_global_extensions = [
    \ 'coc-explorer',
    \ 'coc-html',
    \ 'coc-emmet',
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-prettier',
    \ 'coc-phpls',
    \ 'coc-php-cs-fixer',
    \ 'coc-go',
    \ 'coc-sql',
    \ 'coc-clangd']

" go文件 保存的时候自动添加缺失的import
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" :verbose set conceallevel " 查看是哪个配置文件或者插件最后设置此值
" indentLine 避免json、markdown文件隐藏双引号
autocmd FileType json,markdown let g:indentLine_conceallevel = 0
" vim-json 避免json、markdown文件隐藏双引号
autocmd FileType json,markdown let g:vim_json_syntax_conceal = 0


nmap gtt :CocCommand explorer<CR>

" ctrl + b 跳转到函数，并在新的tab页面中打开
nmap <silent> gtf :call CocAction('jumpDefinition', 'tab drop')<CR>

" 设置按下tab时，是选择补全，而不是输入tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 回车选中补全，而不是换行
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" 
endif

nnoremap term :split term://bash<CR>
 
nnoremap <up> :res +5<CR>
nnoremap <down> :res -5<CR>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>
