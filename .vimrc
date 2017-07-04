set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'mileszs/ack.vim'

" Ack configuration to use ag instead
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Ack configuration to use rg instead
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
