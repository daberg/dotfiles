"----------------------------------Plugins------------------------------------"

" Call to vim-plug
call plug#begin('~/.vim/plugged')

" Finder
Plug 'ctrlpvim/ctrlp.vim'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'

" Filesystem explorer
Plug 'scrooloose/nerdtree'

" Editing
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'

" Syntax highlighting
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'justinmk/vim-syntax-extra'
Plug 'tikhomirov/vim-glsl'
Plug 'wlangstroth/vim-racket'

" Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
Plug 'nlknguyen/papercolor-theme'

" Spell language detection
"Plug 'konfekt/vim-DetectSpellLang'

" Misc
Plug 'tpope/vim-repeat'

call plug#end()

"----------------------------------General------------------------------------"

set nocompatible

" Encoding
set encoding=utf-8

" Syntax highlighting
filetype plugin indent on
syntax enable

" Indent and wrap
set autoindent
set shiftround
set shiftwidth=4

" Tab
set expandtab
set smarttab
set softtabstop=4
set tabstop=4

" Buffers
set hidden

" Search
set ignorecase
set incsearch

" Views
set viewoptions-=options

" Miscellanea
set backspace=indent,eol,start
set cursorline
set history=1000
set number
set ruler
set sidescrolloff=5
set tabpagemax=50
set wildmenu

" Status line
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = ""
set laststatus=2

"--------------------------------Colorscheme----------------------------------"

" Set termguicolors, breaks on tmux
if !exists('$TMUX')
    set termguicolors
endif

let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord

let ayucolor="light"

function OnColorschemeSwitch()
    highlight Normal       ctermbg=NONE guibg=NONE
    highlight CursorLine   ctermbg=NONE guibg=NONE
    highlight CursorLineNr ctermbg=NONE guibg=NONE
endfunction

command -nargs=1 -complete=color SwitchColorscheme
    \ colorscheme <args> |
    \ call OnColorschemeSwitch()

"----------------------------- Keybindings------------------------------------"

nnoremap <C-b> :CtrlPBuffer<CR>

nnoremap <silent> <expr> <C-p> g:NERDTree.IsOpen() ?
            \ "\:NERDTreeClose<CR>" :
            \ bufexists(expand('%')) ?
                \ "\:NERDTreeFind<CR>" :
                \ "\:NERDTree<CR>"

function TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" Leader key bindings help text
let s:help_leader = "Leader key bindings"

" Echo leader bindings
nnoremap <leader>h :call HelpLeader()<CR>
let s:help_leader .= "\n h    Display this message and exit"

" Reload .vimrc
" File type is reloaded to trigger relative autocmds
nnoremap <leader>r :source $MYVIMRC<CR> | execute "set filetype=" . &filetype
let s:help_leader .= "\n r    Reload .vimrc"

" Remove trailing white space
nnoremap <leader>w :%s/\s\+$//e
let s:help_leader .= "\n w    Remove trailing white space"

" Remove blank lines
nnoremap <leader>b :g/^\_$\n\_^$/d
let s:help_leader .= "\n b    Remove blank lines"

" Split C-like function call on commas and external parentheses and reindent
nnoremap <leader>, :s/(/&\r/e<CR>:s/,/&\r/ge<CR>:s/);/\r&/e<CR>V{=<ESC><C-O>
let s:help_leader .= "\n ,    Split C-like function call in current line"

" Change variable names from camelCase to snake_case in the current line
nnoremap <leader>s :s/\V\C\(\l\)\(\u\)/\1\_\l\2/g<CR>
let s:help_leader .= "\n s    Change line names from camelCase to snake_case"

function HelpLeader ()
    echo s:help_leader
endfunction

"----------------------------File type specific-------------------------------"

autocmd FileType c,javascript,python,vim set textwidth=79 colorcolumn=80
autocmd FileType javascript,vim SwitchColorscheme dracula

" Markdown files
autocmd FileType markdown set wrap linebreak nolist
autocmd FileType markdown setlocal spell
autocmd FileType markdown nnoremap j gj
autocmd FileType markdown nnoremap k gk
autocmd FileType markdown nnoremap 0 g0
autocmd FileType markdown nnoremap $ g$
autocmd FileType markdown vnoremap j gj
autocmd FileType markdown vnoremap k gk
autocmd FileType markdown vnoremap 0 g0
autocmd FileType markdown vnoremap $ g$

autocmd FileType markdown nnoremap <F5>
    \ :!pandoc
    \ -V geometry:left=1.5in,right=1.5in,top=1.2in,bottom=1.2in
    \ -N -o '%:r.pdf' '%'<Enter>

autocmd FileType markdown nnoremap <F6>
    \ :!pandoc
    \ -t beamer -o '%:r.pdf' '%'<Enter>

" Force .md files to be recognized as Markdown files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Tex files
autocmd FileType tex set wrap linebreak nolist
autocmd FileType tex setlocal spell
autocmd FileType tex nnoremap j gj
autocmd FileType tex nnoremap k gk
autocmd FileType tex nnoremap 0 g0
autocmd FileType tex nnoremap $ g$
autocmd FileType tex vnoremap j gj
autocmd FileType tex vnoremap k gk
autocmd FileType tex vnoremap 0 g0
autocmd FileType tex vnoremap $ g$
autocmd FileType tex nnoremap <F5> :!latexmk -pdf -bibtex % && latexmk -c<Enter>
autocmd FileType tex nnoremap <F6> :w !detex \| wc -w<CR>

autocmd BufRead *.prof set nowrap

"----------------------------Plugin specific----------------------------------"

let g:ctrlp_map = '<c-f>'
"let g:guesslang_langs = [ 'en_US', 'it' ]
