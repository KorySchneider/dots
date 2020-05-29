set rtp+=~/.fzf

" Plugins
call plug#begin('~/.vim/plugged')

" UI
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline' | let g:airline#extensions#obsession#enabled = 1
Plug 'vim-airline/vim-airline-themes' | let g:airline_theme='gruvbox'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/goyo.vim' | let g:goyo_width = 85
Plug 'junegunn/limelight.vim' | let g:limelight_conceal_ctermfg = 240
Plug 'haya14busa/incsearch.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'airblade/vim-gitgutter'

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
Plug 'ycm-core/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'tpope/vim-obsession'

call plug#end()

" General Settings
set clipboard=unnamed
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

" Theme
set background=dark
colorscheme gruvbox

" git gutter
"highlight! link SignColumn LineNr
highlight! link SignColumn Bg
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_sign_added              = '┃'
let g:gitgutter_sign_modified           = '┃'
let g:gitgutter_sign_removed            = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed   = '┃'
set updatetime=100

" Custom Bindings
let mapleader=","

" Snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsSnippetDirectories=["custom-snippets"]

" YouCompleteMe
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_disable_signature_help = 1
let g:ycm_auto_hover = ''
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1

" ctrl+T NerdTree toggle
map <silent> <c-t> :NERDTreeToggle<CR>

" goyo
map <silent> <c-g> :Goyo<CR>

" Leader mappings
" , (c)lear (s)earch
nnoremap <silent> <leader>cs :nohl<CR>
" , (ta)b guides
nnoremap <silent> <leader>ta :IndentGuidesToggle<CR>
" , (sp)ell check
nnoremap <silent> <leader>sp :setlocal spell spelllang=en_us<CR>
" , (g)it (d)iff (GitGutter)
nnoremap <silent> <leader>gd :GitGutterBufferToggle<CR>

" FZF
map <silent> <c-o> :Files<CR>
map <silent> <c-s> :vsp<CR>:Files<CR>
map <silent> <c-i> :sp<CR>:Files<CR>
map <silent> <c-f> :Lines<CR>

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

" File specific settings
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
