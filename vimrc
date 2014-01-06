"=============================================
" Author: Eugene Wang
" Version: 0.0.1
" Email: fengbaoxp@gmail.com
" 
" Sections:
"   >基本设置
"   >插件管理及配置
"   >主题配置
"=============================================
set nocompatible                " be improved 关闭vi兼容模式
filetype off                    " required! 先关闭文件类型侦测，最后再打开
filetype plugin indent off      " required!

"=============================================
" 第一部分：基本配置
"=============================================
" vim 自身命令行模式智能补全
set wildmenu 

" 设置vim编码。
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

" 自动缩进，每个tab占四个字符，并且4个空格代替tab。
set smartindent
set tabstop=4                   " 设置编辑时制表符占用空格数
set shiftwidth=4                " 设置格式化时制表符占用空格数
set expandtab                   " 将制表符扩展为空格
set softtabstop=4               " 将连续的空格视为一个制表符

" 显示行号
set number
" 编辑过程中右下角显示行列信息
set ruler
" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" 总是显示状态栏
set laststatus=2

" 启用backspace删除字符功能，并且可以跨行。
set backspace=indent,eol,start 

" 根据当前输入，增量匹配上下文帮助提示内容。
set completeopt+=longest

" 禁止折行
set nowrap

" 自定义快捷键
let mapleader=";"               " 定义快捷键的前缀，即<Leader>
vnoremap <leader>y "+y          " 设置系统剪贴本复制快捷键
nmap <leader>p "+p              " 设置系统剪贴板粘贴快捷键

"=============================================
" 第二部分：插件管理及配置
"=============================================
"----------Vundle插件及设置----------
if has("win32")
  set rtp+=%HOME%/vimfiles/bundle/vundle/
else
  set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()
" Vundle插件使用帮助
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" 让Vundle插件管理Vundle插件本身。
Bundle 'gmarik/vundle'

"----------NERDTree插件及其配置----------
Bundle 'scrooloose/nerdtree'
nmap <F3> :NERDTreeToggle <CR>
au VimEnter * NERDTreeToggle

"----------Molokai主题插件----------
Bundle 'tomasr/molokai'
colorscheme molokai

"----------golang相关插件及其设置----------
if has("win32")
  set rtp+=%GOROOT%/misc/vim
else
  set rtp+=$GOROOT/misc/vim
endif
autocmd FileType go setlocal shiftwidth=4 tabstop=4 
autocmd FileType go autocmd BufWritePre <buffer> Fmt

Bundle 'Blackrush/vim-gocode'
let g:gocode_gofmt_tabs=' -tabs=true'
let g:gocode_gofmt_tabwidth=' -tabwidth=4'


"----------supertab插件及配置----------
Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

"----------auto-pairs插件及配置----------
Bundle 'jiangmiao/auto-pairs'

"----------powerline插件及配置----------
Bundle 'Lokaltog/powerline'
let g:Powerline_colorscheme='molokai'

"----------Markdown插件及配置----------
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

"----------MiniBufExpl插件及配置----------
Bundle 'fholgado/minibufexpl.vim'

"----------对齐线插件及配置----------
Bundle 'Yggdroot/indentLine'
nmap <leader>il :IndentLinesToggle<CR>

"===================================================
" 第三部分：主题配置
"===================================================
set background=dark
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Courier\ New\ 12
  elseif has("gui_photon")
    set guifont=Courier\ New:s12
  elseif has("gui_kde")
    set guifont=Courier\ New/12/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Consolas:h14:cDEFAULT
  endif

  set guioptions-=T         " 隐藏工具栏
  " set guioptions-=m       " 隐藏菜单
endif


filetype plugin indent on       " required!
syntax enable                   " 开启语法高亮功能
syntax on                       " 允许个性化语法高亮配色方案替换默认方案
