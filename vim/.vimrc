"" General Settings
set nocompatible
set mouse=a
set title
set relativenumber
set number " line numbers
set hidden " hide buffers instead of closing them
set backspace=indent,eol,start
set showcmd " shows command being typed
set showmatch " show matching parenthesis
set ignorecase " case-insensitive search
set smartcase " case-sensitive search if any caps are used
set hlsearch " highlight search matches
set incsearch " searches as you type search text
set scrolloff=2 " can always see at least X number of lines above and below cursor
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab " spaces instead of tabs
set smarttab " insert/delete shiftwidth number of spaces at beginning of lines
set tabstop=2
set shiftwidth=2
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
set noerrorbells
filetype plugin indent on
syntax enable

"" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"" Theme
set background=dark
colorscheme gruvbox

"" Custom Bindings
let mapleader=","
map <silent> <leader>tt :NERDTreeToggle<CR>
nnoremap <silent> <leader>cs :nohl<CR>
nnoremap <silent> <leader>ta :IndentGuidesToggle<CR>
nnoremap <silent> <leader>sp :setlocal spell spelllang=en_us <CR>
nnoremap ; :
inoremap kj <Esc>
set timeoutlen=250

"" File specific settings
autocmd filetype python set tabstop=4 shiftwidth=4
autocmd filetype gitcommit setlocal spell textwidth=72
autocmd filetype markdown setlocal spell textwidth=80
