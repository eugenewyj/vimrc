set nocompatible                " be improved
filetype off                    " required!

" vundle setting
if has("win32")
  set rtp+=$VIM/vimfiles/bundle/vundle/
else
  set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()
