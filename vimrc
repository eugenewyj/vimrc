"=============================================
" Author: Eugene Wang
" Version: 0.0.1
" Email: fengbaoxp@gmail.com
" 
" Sections:
"   >常量初始化
"   >基本设置
"   >插件管理及配置
"   >主题配置
"=============================================
set nocompatible                " be improved 关闭vi兼容模式
filetype off                    " required! 先关闭文件类型侦测，最后再打开
filetype plugin indent off      " required!

"=============================================
" 第一部分：常量初始化
"=============================================

" 判断操作系统
let g:iswindows = 0
let g:islinux = 0
if has("unix")
    let g:islinux = 1
else
    let g:iswindows = 1
endif

" 判断是终端还是GVIM
if has("gui_running")
    let g:isgui = 1
else
    let g:isgui = 0
endif

"=============================================
" 第二部分：基本配置
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

"---------------------------------------------
"                代码折叠设置
"---------------------------------------------
" 1. syntax:基于语法折叠;
" 2. indent:基于缩进进行折叠;
" 3. diff:为更改文本构成折叠;
" 4. manual:手工建立折叠
" za:打开或者关闭折叠;
" zM:关闭所有折叠;
" zR:打开所有折叠;
set foldmethod=syntax 
set nofoldenable                " 启动vim时关闭所有折叠代码


"=============================================
" 第三部分：插件管理及配置
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
" 设置快捷键，速记：file list
nmap <leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree子窗口不显示荣誉帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 启动Vim时自动打开NERDTree子窗口
au VimEnter * NERDTreeToggle
" 常用操作
" 回车或o:打开选中文件
" r:刷新工程目录文件列表
" I(大写):显示/隐藏 隐藏文件
" m:出现创建/删除/剪切/拷贝操作列表

"----------Molokai主题插件----------
Bundle 'tomasr/molokai'
colorscheme molokai

"----------supertab插件及配置----------
Bundle 'ervandew/supertab'
let g:SuperTabRetainCompletionType = 2            "记住上次补全方式，直到退出插入模式
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1        "关闭代码补全时函数即开式预览

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

"----------bufkill插件及配置----------
Bundle 'vim-scripts/bufkill.vim'

"----------NERD Commenter 注释插件---------
Bundle 'scrooloose/nerdcommenter'
" 使用帮助
" <leader>cc 注释当前选中文本，单行用//，多行用/**/
" <leader>cu 取消选中文本块注释

"----------ultisnips 模板补全插件----------
Bundle 'SirVer/ultisnips'

"------------------------------------------
"         golang相关插件及其设置
"------------------------------------------
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

"------------------------------------------
"      c/c++相关插件及其设置
"------------------------------------------

"------改进的C++11/14 STL 语法高亮 
Bundle 'Mizuchi/STL-Syntax' 

"------源代码与头文件快速切换插件
Bundle 'vim-scripts/a.vim'
nmap <leader>ch :A<CR>
nmap <leader>sch :AS<CR>
nmap <leader>vch :AV<CR>
" 使用帮助
" :A 切换到与当前编辑文件对应的头文件(或者反向切换)
" :AS 水平分割窗口并切换
" :AV 垂直分割窗口并切换
" :AN 循环匹配(cycles through matches)

"------代码收藏插件(fork from vim-scripts/Visual-Mark)
Bundle 'fengbaoxp/Visual-Mark'
" 使用帮助
" mm 创建或删除书签
" mn 正向遍历书签
" mp 反向遍历书签

"===================================================
" 第四部分：主题配置
"===================================================
set background=dark
if (g:isgui)                    " 运行GVIM
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

  set guioptions-=T             " 隐藏工具栏
  " set guioptions-=m           " 隐藏菜单
endif


filetype plugin indent on       " required!
syntax enable                   " 开启语法高亮功能
syntax on                       " 允许个性化语法高亮配色方案替换默认方案
