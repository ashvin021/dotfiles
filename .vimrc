syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set indentexpr
set relativenumber
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set incsearch


set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/neovimhaskell/haskell-vim.git'
"Plug 'itchyny/vim-haskell-indent'
"Plug 'https://tpope.io/vim/surround.git'
Plug 'preservim/nerdtree'
Plug 'udalov/kotlin-vim'
Plug 'jiangmiao/auto-pairs'


"Master branch of gruvbox
"Plug 'morhetz/gruvbox'
"Gruvbox fork with better highlighting for Haskell
Plug 'dkasak/gruvbox'

call plug#end()

"This sets gruvbox as the colorscheme, the last line here is to 
"stop tmux interfering with it on vim.
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set bg=dark
set t_ut=

" fix colorscheme transparency in alacritty
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

"This is to configure the enter key to confirm autocomplete suggestions
"by coc.nvim
noremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
unmap <cr>

"Remaps key to NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

"Remaps the escape key to jj
imap jj <Esc>

filetype plugin indent on
"haskell-vim shortcuts
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_indent_before_where = 0
let g:haskell_indent_where = 6
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_if = 3 
let g:haskell_indent_do = 3
let g:haskell_indent_guard = 2 

"fix mouse support in vim for alacritty
if !has('nvim')
     set ttymouse=sgr
endif

"for mouse support
set mouse=a

"to stop searched terms from staying highlighted
set nohlsearch
