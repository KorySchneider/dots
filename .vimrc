set nocompatible

colorscheme gruvbox
set background=dark

set nu

inoremap kj <Esc>
set timeoutlen=200

filetype plugin on
syntax on

filetype plugin indent on
set hidden
set backspace=indent,eol,start

set showcmd

let mapleader=","

set hidden

set tabstop=4
set autoindent
set copyindent
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title

set nobackup
set noswapfile

nnoremap ; :
