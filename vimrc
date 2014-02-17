" Author: Eugene Wang
" Version: 0.0.1
" Email: fengbaoxp@gmail.com
" 
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

" 初始窗口高、宽、位置
set lines=35
set columns=125
winpos 100 100
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
if (g:isgui)
    " 隐藏菜单栏
    set guioptions-=m
    " 隐藏工具栏
    set guioptions-=T
    " 隐藏左侧滚动条
    set guioptions-=L
    " 隐藏右侧滚动条
    set guioptions-=r
    " 隐藏底部滚动条
    set guioptions-=b
endif

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

"---------------------------------------------
"                Vim全屏模式
"---------------------------------------------
if (g:islinux)
    " 将外部命令wmctrl控制窗口最大化的命令行参数封装成一个vim的函数
    " 前提条件：安装wmctrl
    " $ sudo apt-get install wmctrl
    fun! ToggleFullscreen()
        call system("wmctrl -ir" . v:windowid . " -b toggle,fullscreen")
    endf
    " 全屏开/关快捷键
    map <silent> <F11> :call ToggleFullscreen()<CR>
    " 启动vim时自动全屏
    " autocmd VimEnter * call ToggleFullscreen()
endif


"=============================================
" 第三部分：插件管理及配置
"=============================================
"----------Vundle插件及设置----------
if (g:iswindows)
    set rtp+=%HOME%/vimfiles/bundle/vundle/
else
    set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()
" 使用帮助
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" 让Vundle插件管理Vundle插件本身。
Bundle 'gmarik/vundle'

"----------Molokai主题插件----------
Bundle 'tomasr/molokai'
colorscheme molokai

"----------NERDTree插件及其配置----------
Bundle 'scrooloose/nerdtree'
" 设置快捷键，速记：file list
nmap <leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=30
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree子窗口不显示荣誉帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 启动Vim时自动打开NERDTree子窗口
au VimEnter * NERDTreeToggle
" 使用帮助
" 回车或o:打开选中文件
" r:刷新工程目录文件列表
" I(大写):显示/隐藏 隐藏文件
" m:出现创建/删除/剪切/拷贝操作列表


if (g:iswindows)
    "windows下采用supertab插件来进行代码补全（YCM安装太困难）
    "----------supertab插件及配置----------
    Bundle 'ervandew/supertab'
    let g:SuperTabRetainCompletionType = 2            "记住上次补全方式，直到退出插入模式
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabClosePreviewOnPopupClose = 1        "关闭代码补全时函数即开式预览
else
    "linux下采用YCM插件进行代码不全
    "----------YCM插件及配置---------------
    " YCM相当于clang_complete,AutoComplPop,Supertab,neocomplcache四个插件组合
    " 前置工作：clang 支持和编译 YCM。 
    " 第一步：安装clang
    " 1.安装gcc和g++
    "   $ sudo apt-get install gcc g++
    " 2.下载LLVM、clang及辅助库源码
    "   $ cd ~/Downloads
    "   $ git clone http://llvm.org/git/llvm.git llvm
    "   $ cd llvm/tools
    "   $ git clone http://llvm.org/git/clang.git clang
    "   $ cd ../..
    "   $ cd llvm/tools/clang/tools
    "   $ git clone http://llvm.org/git/clang-tools-extra.git extra
    "   $ cd ../../../..
    "   $ cd llvm/projects
    "   $ git clone http://llvm.org/git/compiler-rt.git compiler-rt
    "   $ cd ..
    " 3.关掉其他应用，尽量多的系统资源留给gcc进行编译clang源码
    "   $ mkdir build
    "   $ cd build
    "   $ ../configure --enable-optimized CC=/usr/bin/gcc CXX=/usr/bin/g++
    "   $ sudo make install
    " 4.验证安装是否成功
    "   $ clang --version
    "
    " 第二步：编译 YCM
    "   $ cd ~/Downloads/
    "   $ mkdir ycm_build
    "   $ cd ycm_build
    "   $ cmake -G "Unix Makefiles"
    "   -DEXTERNAL_LIBCLANG_PATH=/usr/local/lib/libclang.so . ~/.vim/bundle/YouCompleteMe/cpp/
    "   $ make ycm_support_libs
    " 在~/.vim/bundle/YouCompleteMe/python/将生成ycm_client_support.so、
    " libclang.so、ycm_core.so三个共享库文件;
    Bundle 'Valloric/YouCompleteMe'
    " 允许vim加载 .yum_extra_conf.py文件，不再提示
    let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
    " 注释中同样支持补全
    let g:ycm_complete_in_comments=1
    " 补全内容不以分割窗口形式出现，只显示补全列表
    set completeopt-=preview
    " 语法关键字补全
    let g:ycm_seed_identifiers_with_syntax=1

endif
"----------auto-pairs插件及配置----------
Bundle 'jiangmiao/auto-pairs'

"----------vim-airline插件及配置---------
Bundle 'bling/vim-airline'
set laststatus=2
let g:airline_theme='molokai'

"----------Markdown插件及配置----------
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

"----------MiniBufExpl插件及配置----------
Bundle 'fholgado/minibufexpl.vim'
" 键映射 
map <leader>be  :MBEOpen<CR>
map <leader>bc  :MBEClose<CR>
map <leader>bt  :MBEToggle<CR>
map <leader>bd  :MBEbd<CR>
map <leader>bw  :MBEbw<CR>
map <Leader>bun :MBEbun<CR>
map <leader>bb  :MBEbb<CR>
map <leader>bf  :MBEbf<CR>
map <C-Tab>      :MBEbn<CR>
map <C-S-Tab>    :MBEbp<CR>

" 自定义 MiniBufExpl 颜色
"let g:did_minibufexplorer_syntax_inits=0
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

" 使用帮助
" d:删除光标所在的buffer
" s:将当前buffer对应window与先前window上下排列
" v:将当前buffer对应window与先前window左右排列

"----------对齐线插件及配置----------
Bundle 'Yggdroot/indentLine'
nmap <leader>il :IndentLinesToggle<CR>

"----------NERD Commenter 注释插件---------
Bundle 'scrooloose/nerdcommenter'
" 使用帮助
" <leader>cc 注释当前选中文本，单行用//，多行用/**/
" <leader>cu 取消选中文本块注释

"----------DrawIt ASCII art风格注释插件---------
Bundle 'vim-scripts/DrawIt'
" 使用帮助
" \di start DrawIt
" \ds stop DrawIt

"----------ultisnips 模板补全插件----------
Bundle 'SirVer/ultisnips'
" UltiSnips的tab键与YCM或supertab冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

"----------tagbar插件及其配置--------------
Bundle 'majutsushi/tagbar'
" 设置 tagbar 子窗口出现在右侧
let tagbar_right=1
" 设置显示/隐藏标签子窗口快捷键。速记：tag list
nnoremap <leader>tl :TagbarToggle<CR>
" 设置标签子窗口宽度
let tagbar_width=25
" tagbar 子窗口不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 tagbar 针对c++代码显示标签
let g:tagbar_type_cpp = {
    \ 'ctagstype' : 'c++',
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
    \ ],
    \ 'sro' : '::',
    \ 'kind2scope' : {
        \ 'g' : 'enum',
        \ 'n' : 'namespace',
        \ 'c' : 'class',
        \ 's' : 'struct',
        \ 'u' : 'union'
    \ },
    \ 'scope2kind' : {
        \ 'enum' : 'g',
        \ 'namespace' : 'n',
        \ 'class' : 'c',
        \ 'struct' : 's',
        \ 'union' : 'u'
    \ }
\ }
" 设置 tagbar 针对golang代码显示标签
" 因采用gotags生成标签，需先安装gotags
" $ go get github.com/jstemmer/gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


"------------------------------------------
"         golang相关插件及其设置
"------------------------------------------
"------Golang 官网vim插件
if (g:iswindows)
  set rtp+=%GOROOT%/misc/vim
else
  set rtp+=$GOROOT/misc/vim
endif
autocmd FileType go setlocal shiftwidth=4 tabstop=4 
autocmd FileType go autocmd BufWritePre <buffer> Fmt

"------vim 集成 gocode 插件
" 前置工作：安装 gocode
" $ go get -u github.com/nsf/gocode #linux
" 或
" $ go get -u -ldflags -H=windowsgui github.com/nsf/gocode  #windows
Bundle 'Blackrush/vim-gocode'
let g:gocode_gofmt_tabs=' -tabs=true'
let g:gocode_gofmt_tabwidth=' -tabwidth=4'

"------godef 自动跳转插件
"" 前置工作：安装godef
" $ go get -v code.google.com/p/rog-go/exp/cmd/godef
" $ go install -v code.google.com/p/rog-go/exp/cmd/godef
Bundle 'dgryski/vim-godef'
let g:godef_split=0

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

"------indexer插件及其配置（及依赖的DfrankUtil和vimprj两个插件）
Bundle 'vim-scripts/indexer.tar.gz'
Bundle 'vim-scripts/DfrankUtil'
Bundle 'vim-scripts/vimprj'
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="-R --c++-kinds=+px --fields=+iaSl --extra=+q"
" 使用帮助
" indexer
" 有个配置文件，用于设定工程根目录，配置文件为~/.indexer_files，内容示例为：
" -------------- ~/.indexer_files  -----------------
" [sample_proj1]
" /data/workspace/smaple_proj1
"
" [sapme_proj2]
" /data/workspace/sample_proj2
" -------------  ~/.indexer_files  -----------------
"
" 在以上工程目录中打开文件时，indexer便对整个目录创建标签文件，如果文件
" 有更新保存时，indexer自动调用ctags更新标签文件，并自动引入到vim中。
" indexer生成的标签文件以工程名命名，位于~/.indexer_files_tags/目录下。

"===================================================
" 第四部分：主题配置
"===================================================
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
endif


filetype plugin indent on       " required!
syntax enable                   " 支持语法高亮功能
syntax on                       " 打开语法高亮 
