"----------------------------------Plugins------------------------------------"

" Call to vim-plug
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'justinmk/vim-syntax-extra'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'scrooloose/nerdtree'

call plug#end()

"----------------------------------General------------------------------------"

set encoding=utf-8
set nocompatible

set number

" Syntax highlighting
filetype plugin on
syntax on
" colorscheme nord

" Case insensitive search
set ignorecase

set expandtab

" Indent and wrap
set autoindent
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4

" set textwidth=79

" Remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

"----------------------------File type specific-------------------------------"

" Force alternative color scheme for .vimrc
autocmd BufEnter .vimrc colorscheme elflord

" Force .md files to be recognized as Markdown files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
