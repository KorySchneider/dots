"" Theme
set background=dark
colorscheme gruvbox


"" Custom Bindings
let mapleader=","
nnoremap <leader>cs :nohl <Enter>
nnoremap ; :
inoremap kj <Esc>
set timeoutlen=200


"" General Settings
set nocompatible
set title
set number " line numbers
set hidden " hide buffers instead of closing them
set backspace=indent,eol,start
set showcmd " shows command being typed
set showmatch " show matching parenthesis
set ignorecase " case-insensitive search
set smartcase " case-sensitive search if any caps are used
set hlsearch " highlight search matches
set incsearch " searches as you type search text
set scrolloff=4 " can always see at least X number of lines above and below cursor
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab " spaces instead of tabs
set smarttab " insert/delete shiftwidth number of spaces at beginning of lines
set tabstop=3 shiftwidth=3
set softtabstop=0
set autoindent
set copyindent
set splitbelow " more natural
set splitright " split opening
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set nobackup
set noswapfile
filetype plugin indent on
syntax enable
