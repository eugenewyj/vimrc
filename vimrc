set nocompatible                " be improved
filetype off                    " required!
filetype plugin indent off	" required!

" 设置编码
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

" Vundle插件设置
if has("win32")
  set rtp+=%HOME%/vimfiles/bundle/vundle/
else
  set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()

"
" Vundle插件使用帮助
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" ---- 让Vundle插件管理Vundle插件本身。" required!
Bundle 'gmarik/vundle'			 

" ==== 下面是定制的插件:

" ---- FencView插件（用于探测文件编码）
Bundle 'vim-scripts/FencView.vim'

" ---- NERDTree插件及其配置。
Bundle 'scrooloose/nerdtree'
nmap <F2> :NERDTreeToggle <CR>

" ---- solarized主题插件及其配置
Bundle 'altercation/vim-colors-solarized'
set background=dark
colorscheme solarized
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Courier\ New\ 11
  elseif has("gui_photon")
    set guifont=Courier\ New:s11
  elseif has("gui_kde")
    set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Consolas:h14:cDEFAULT
  endif

  set guioptions-=T		" 隐藏工具栏
  " set guioptions-=m		" 隐藏菜单
endif

" ---- golang官方插件设置
if has("win32")
  set rtp+=%GOROOT%/misc/vim
else
  set rtp+=$GOROOT/misc/vim
endif
" ---- gocode插件及其配置
Bundle 'Blackrush/vim-gocode'


filetype plugin indent on     	" required!
syntax on
