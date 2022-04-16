""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sean .vimrc
"
" Mostly stolen from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""
" Basics
"""""""""

set number

set noerrorbells
set visualbell
set t_vb=
set tm=500

set wildmenu

"""""""""
" Search
"""""""""

set ignorecase
set smartcase
set hlsearch
set incsearch

""""""""""""""
" Indentation
""""""""""""""

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set ai
set si

"""""""""
" Colors
"""""""""

syntax enable

try
    colorscheme zellner
catch
endtry

""""""""""""""
" Status line
""""""""""""""

set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
