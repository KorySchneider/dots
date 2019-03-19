set rtp+=~/.fzf

"" Plugins
call plug#begin('~/.vim/plugged')

" UI
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/goyo.vim' | let g:goyo_width = 85
Plug 'junegunn/limelight.vim' | let g:limelight_conceal_ctermfg = 240
Plug 'haya14busa/incsearch.vim'
Plug 'JamshedVesuna/vim-markdown-preview'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Tools
Plug 'justinmk/vim-sneak' | let g:sneak#s_next = 1
Plug 'danro/rename.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'koryschneider/vim-trim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-eunuch'
Plug 'Townk/vim-autoclose'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

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

"" Theme
set background=dark
colorscheme gruvbox

"" Custom Bindings
let mapleader=","

" ctrl+T NerdTree toggle
map <silent> <c-t> :NERDTreeToggle<CR>
" goyo
map <silent> <c-g> :Goyo<CR>
" , (c)lear (s)earch
nnoremap <silent> <leader>cs :nohl<CR>
" , (ta)b guides
nnoremap <silent> <leader>ta :IndentGuidesToggle<CR>
" , (sp)ell check
nnoremap <silent> <leader>sp :setlocal spell spelllang=en_us <CR>

" FZF
map <silent> <c-o> :Files<CR>
map <silent> <c-s> :vsp<CR>:Files<CR>
map <silent> <c-i> :sp<CR>:Files<CR>

nnoremap ; :
inoremap kj <Esc>
set timeoutlen=250

" incsearch.vim
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"" File specific settings
autocmd filetype python set tabstop=4 shiftwidth=4
autocmd filetype gitcommit setlocal spell textwidth=72
autocmd filetype rust set tabstop=4 shiftwidth=4
autocmd filetype markdown setlocal spell textwidth=80

" fzf colors
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" - down / up / left / right
let g:fzf_layout = { 'down': '~15%' }
