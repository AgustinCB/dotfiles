set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Search with ag and rg
Plugin 'mileszs/ack.vim'
" Dirtree
Plugin 'scrooloose/nerdtree'
" Scala plugin
Plugin 'derekwyatt/vim-scala'
" Git plugin
Plugin 'tpope/vim-fugitive'
" Multicursor plugin
Plugin 'terryma/vim-multiple-cursors'
" Airline status bar plugin
Plugin 'vim-airline/vim-airline'
" Plugin to run commands in a window
Plugin 'wkentaro/conque.vim'
" Plugin to close buffers 
Plugin 'moll/vim-bbye'
" Plugin for typescript highlight
Plugin 'leafgarland/typescript-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

filetype plugin on
syntax on
syntax enable
set background=dark
colorscheme solarized

" Ack configuration to use ag instead
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Ack configuration to use rg instead
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

:command Bclose Bdelete
:command Bc Bdelete

" Shortcuts
:nnoremap <Leader>q :Bdelete<CR>
:nnoremap <Leader>n :bnext<CR>
:nnoremap <Leader>p :bprev<CR>
:nnoremap <Leader>t :NERDTree<CR>

" Remap arrows to switch between windows

map <Up>   <C-W>k
map <Down> <C-W>j
map <Left> <C-W>h
map <Right> <C-W>l

" Remap tab to switch between tabs

nmap <tab> gt
nmap <s-tab> gT

let g:airline#extensions#tabline#enabled = 1

" Start with NERDTree, but in the other window, PLEASE

autocmd vimenter * NERDTree
autocmd vimenter * wincmd l

" set paste by default
:set paste
