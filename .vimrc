syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=2
set expandtab
set indentexpr
set relativenumber
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nohlsearch
set hidden
set scrolloff=8
set foldmethod=indent
set foldlevel=99
set signcolumn=yes

filetype plugin indent on

"Adds Color Column
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

"General plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://tpope.io/vim/surround.git'
Plug 'tmsvg/pear-tree'
Plug 'christoomey/vim-tmux-navigator'

"NERDTree stuff
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Git
Plug 'airblade/vim-gitgutter'

"Haskell
Plug 'https://github.com/neovimhaskell/haskell-vim.git'
Plug 'Twinside/vim-haskellFold'

"Kotlin
"Plug 'udalov/kotlin-vim'

"Python
Plug 'tmhedberg/SimpylFold'

"Rust
Plug 'dense-analysis/ale'

"PureScript
Plug 'purescript-contrib/purescript-vim'
Plug 'vmchale/dhall-vim'

"WACC
Plug 'AndreaMichi/wacc-vim'

"Master branch of gruvbox
"Plug 'morhetz/gruvbox'
"Gruvbox fork with better highlighting for Haskell
"Plug 'dkasak/gruvbox'
Plug 'gruvbox-community/gruvbox'

"Discord Rich Presence
"Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}

call plug#end()

"---------------------------------------------------------------------------
"Color scheme stuff

"This sets gruvbox as the colorscheme, the last line here is to
"stop tmux interfering with it on vim.
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set bg=dark
set t_ut=

" fix colorscheme transparency in alacritty
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

"---------------------------------------------------------------------------
"Remaps

"This is to configure the enter key to confirm autocomplete suggestions
"by coc.nvim
noremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
unmap <cr>

"Remaps key to NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

"Remaps the escape key to jj
imap jj <Esc>

let mapleader = ","

"---------------------------------------------------------------------------
"Coc Stuff

let g:coc_global_extensions = [
        \'coc-clangd',
        \'coc-eslint',
        \'coc-html',
        \'coc-json',
        \'coc-python',
        \'coc-snippets',
        \'coc-toml',
        \'coc-tsserver',
        \'coc-xml',
        \'coc-yaml',
        \]

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"---------------------------------------------------------------------------
"Haskell plugin options

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

"---------------------------------------------------------------------------
"ALE Stuff

let g:ale_disable_lsp = 1

let g:ale_linters = {
\   'rust': ['rls'],
\}

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\}

let g:ale_fix_on_save = 1

"---------------------------------------------------------------------------
"Misc

"NERDTree Git hide boring brackets
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0

"fix mouse support in vim for alacritty
if !has('nvim')
     set ttymouse=sgr
endif

"for mouse support
set mouse=a
