" Vim Configuration File "

" Enable mouse "
set mouse=a

" Enable syntax "
syntax enable
syntax on

" Enable line numbers " 
set number

" Highlight current line "
set cursorline
:highlight Cursorline cterm=bold ctermbg=black

" Enable highlight search pattern "
set hlsearch

" Enable smartcase search sensitivity "
set ignorecase
set smartcase

" Indentation "
set autoindent
set tabstop =4
set softtabstop =4
set shiftwidth =4
set textwidth =80
set expandtab

" Show the matching part of pairs [] {} and () "
set showmatch

" Appearance "
set termguicolors
colorscheme blue 
colorscheme spacegray 

" Search down into subfolders "
set path+=**

" Display all matching files when using tab complete "
set wildmenu

" Additional Settings "
set spell
set nocompatible
filetype on
filetype indent on
filetype plugin on

