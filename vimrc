set nocompatible                " be improved
filetype off                    " required!
filetype plugin indent off		" required!

" Vundle插件设置
if has("win32")
  set rtp+=%HOME%/vimfiles/bundle/vundle/
  set rtp+=%GOROOT%/misc/vim
else
  set rtp+=~/.vim/bundle/vundle/
  set rtp+=$GOROOT/misc/vim
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

" ---- NERDTree插件及其配置。
Bundle 'scrooloose/nerdtree'
nmap <F2> :NERDTreeToggle <CR>

" ---- solarized主题插件及其配置
Bundle 'altercation/vim-colors-solarized'
set background=dark
colorscheme solarized

" ---- golang官方插件设置
if has("win32")
  set rtp+=%GOROOT%/misc/vim
else
  set rtp+=$GOROOT/misc/vim
endif
" ---- gocode插件及其配置
Bundle 'Blackrush/vim-gocode'


filetype plugin indent on     	" required!
syntax enable