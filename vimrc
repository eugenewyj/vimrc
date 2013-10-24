set nocompatible                " be improved
filetype off                    " required!

" vundle setting
if has("win32")
  set rtp+=%HOME%/vimfiles/bundle/vundle/
else
  set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" NERDTree插件及其配置
Bundle 'scrooloose/nerdtree'
nmap <F2> :NERDTreeToggle <CR>

" solarized主题插件及其配置
Bundle 'altercation/vim-colors-solarized'
syntax enable
set background=dark
colorscheme solarized

filetype plugin indent on     	" required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

