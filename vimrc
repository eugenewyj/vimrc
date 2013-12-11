"=============================================
" Author: Eugene Wang
" Version: 0.0.1
" Email: fengbaoxp@gmail.com
" 
" Sections:
" 	>基本设置
" 	>插件管理及配置
"	>主题配置
"=============================================

set nocompatible                " be improved
filetype off                    " required!
filetype plugin indent off		" required!



"=============================================
" 第一部分：基本配置
"=============================================
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

set tabstop=4
set number
set backspace=indent,eol,start



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

  set guioptions-=T		" 隐藏工具栏
  " set guioptions-=m		" 隐藏菜单
endif




filetype plugin indent on     	" required!
syntax on
