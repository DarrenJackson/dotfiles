" .vimrc - Darren Jackson - 2022/01/04
"
" Intro {{{ 

" za to toggle folds
" zr to unfold all
" zm to fold all

" }}}

" Vundle {{{ 

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible 

filetype plugin indent on

filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
let path='$HOME/.vim/bundle'
call vundle#begin(path)
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'OrangeT/vim-csharp'
Plugin 'tpope/vim-fugitive'
Plugin 'zeis/vim-kolor'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'sickill/vim-pasta'
Plugin 'PProvost/vim-ps1'
Plugin 'AndrewRadev/sideways'
call vundle#end()
filetype plugin indent on

"}}}

" General {{{ 

"let $cortex = "C:\\Cortex\\dev\\Jan\\Src\\Net\\Apps\\Gui"
"au BufNewFile,BufRead *.xaml set filetype=xml

" Syntax highlighting
syntax on

" Set UTF-8 as standard encoding
set encoding=utf-8

" No mode lines
set modelines=0

" Misc
"set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" Hide buffers instead of closing them
set hidden

set foldmethod=marker
"set fileformat=unix

" Set leader to , (comma)
let mapleader = ","

"set undofile	
set undodir=$HOME/.vim/undodir
set directory=$HOME/.vim/swapdir

" shortcut to source the vim.rc
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Move the Next/Previous buffer
:nnoremap <PageUp> :bnext<CR>
:nnoremap <PageDown> :bprevious<CR>

" Always show the status line
set laststatus=2

" Use fancy fonts for airline
let g:airline_powerline_fonts=1
:1
" }}}

" VIM user interface {{{

" Set 7 lines to the curser (top/bottom)
set so=7 

" Relative line numbers
set relativenumber

" Command menus, start command and press tab
set path+=**
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,.git\*
set wildignore+=**/bin/**

" Always show current position
set ruler

" surround word with ()
"noremap <leader>b ysiw) 

" split line at first comma
"noremap <leader>j f,li<cr><esc>

" Configure backspace so it acts as it should act
set backspace=indent,eol,start

" Allow arrow keys to continue between lines
set whichwrap+=<,>,h,l

"nnoremap <CS-j> <S-j>

" Show matching brackets when cursor is over them
"set showmatch

" No annoying sounds on errors
set noerrorbells
set novisualbell
set vb t_vb=
set belloff=all

" Map jj to escape
inoremap jj <esc>

" Show command being entered
"set showcmd

" }}}

" Search {{{

" Map space to search
map <space> /
map <c-space> ?

" Ignore case when searching unless search-term has an uppercase
set ignorecase
set smartcase

" highlight search results, clear by typing ,<space>
set incsearch

" Highlight search result
set hlsearch

" Clear highlighted search by pressing ,<space>
nnoremap <leader><space> :noh<cr>




" }}}

" Colours {{{ 

syntax enable
set termguicolors
colorscheme wombat 

" Search color
hi Search cterm=NONE ctermfg=white ctermbg=darkgrey guibg=peru guifg=wheat

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Hack:h14:cANSI
  endif
endif

"set guifont! = Hack:h12:1
set guioptions -=m
set guioptions -=T
"
" Set line number colour
"highlight LineNr ctermfg=Grey

" Show column 80 in a colour
"hi ColorColumn ctermbg=DarkGrey
"set textwidth=80
"set colorcolumn=+1 

" Cursor line colour
hi clear cursorline
set cursorline
hi CursorLine ctermbg=Darkblue guibg=black 

" }}}
"
" Text, tabs and indents  {{{ 

" 1 tab = 4 spaces 
set tabstop=4
set shiftwidth=4

set softtabstop=4

" Use spaces instead of tabs
set expandtab

" }}}

" Moving around {{{ 

" Split screen with ,w
noremap <leader>w <C-w>v<C-w>l

" Easier way to move between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Use tab instead of % to go to matching bracket
nnoremap <tab> %
vnoremap <tab> %

" Treat long lines as breaks
nnoremap j gj
nnoremap k gk

" position cursor at (screen) middle afer search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" Makes :s%/foo/bar do :s%/foo/bar/g
set gdefault


" }}}

" Editing Mappings {{{ 

" Move line(s) of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
		
" Yank a word to reg w
noremap <C-a> "wyiw
noremap <leader>a "wyiw

" Overwrite word at cursor with reg w
noremap <C-s> viw"wp 
noremap <leader>s viw"wp 

" Clone a paragraph
noremap cp yap<S-}>p

"nnoremap <leader>b :!.\build.bat<CR>

" }}}

"endif
