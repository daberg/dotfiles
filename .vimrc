"----------------------------------Plugins------------------------------------"

" Call to vim-plug
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'justinmk/vim-syntax-extra'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'scrooloose/nerdtree'
Plug 'dracula/vim'

call plug#end()

"----------------------------------General------------------------------------"

set encoding=utf-8
set nocompatible

" Syntax highlighting
filetype plugin on
syntax on

" Colorscheme
set termguicolors
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 20
let g:nord_cursor_line_number_background = 1
colorscheme nord

" Indent and wrap
set autoindent
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Miscellanea
set cursorline
set expandtab
set ignorecase
set number

" Remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

"----------------------------File type specific-------------------------------"

" Set line width limit in accordance to Pep8
autocmd FileType python set textwidth=79

" Force .md files to be recognized as Markdown files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Compile shortcut for Tex files
autocmd FileType tex inoremap <F5> <Esc>:!latexmk -pdf<space><c-r>%<Enter>a
autocmd FileType tex nnoremap <F5> :!latexmk -pdf<space><c-r>%<Enter>
