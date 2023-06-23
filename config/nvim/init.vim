set nocompatible              " be iMproved, required
filetype off                  " required

syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'godlygeek/tabular'
" Plugin 'preservim/vim-markdown'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'WolfgangMehner/latex-support'
Plugin 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plugin 'https://github.com/preservim/nerdtree' " NerdTree
Plugin 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plugin 'https://github.com/vim-airline/vim-airline' " Status bar
Plugin 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plugin 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plugin 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plugin 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plugin 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plugin 'https://github.com/neoclide/coc.nvim' " Autocompletions 
" Plugin 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plugin 'https://github.com/mattn/emmet-vim' " Emmet support

call vundle#end()            " required
filetype plugin indent on    " required

:colorscheme onedark

:set number relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-q> :tabclose<CR>

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Custom Commands
"" LateX
:command Ttp !pdflatex %:t

"" JS/TS/Node
:command NpmInstall !npm install
:command TscWatch !npm run ts-watch
:command NodemonStart !npm run start

"" Git
:command -nargs=1 -bar GitignoreCreate !curl https://www.toptal.com/developers/gitignore/api/<args> | tee -a .gitignore
:command -nargs=* GitCommit !git commit -m "<args>"
:command -nargs=* GitCommitAll !git commit -am "<args>"
:command GitAddAll !git add * && git add .*
:command GitStatus !git status
:command GitPush !git push 

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

set shell=/bin/bash
