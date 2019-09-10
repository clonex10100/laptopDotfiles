set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Basic settings
set nobackup		" do not keep a backup file, use versions instead
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set hlsearch        "highlight search results when using / or ?
set incsearch		" do incremental searching
set number      "Line numbers should always be on.
set mouse=a     "Enable mouse
set showmatch       "Highlight matching bracket
set wildmenu        "Show possble outcompletes above commandbar

set lazyredraw      "Avoid unessary frames
set ignorecase
set smartcase

"Visual settings

set go=aeirL@

syntax on "Enable syntax highlighting

"Color scheme
"set t_Co=16
let g:solarized_termcolors=16
set background=dark
colorscheme solarized
"Italicize comments
highlight Comment cterm=italic gui=italic


" Indentation settings

" always set autoindenting on
set autoindent
set smartindent

"Interpret tabs as four spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Set filetype specific settings and indentation
filetype plugin indent on

" Add optional packages.
" The matchit plugin makes the % command work better, but it is not backwards

" compatible.
packadd matchit

"Add custom keybinds

"set leader key
let mapleader = ","
"map to quickly reload this file
nnoremap <leader>r :so $MYVIMRC <CR>

"Cancel highlights from search
nnoremap <leader>c :nohlsearch <CR>

inoremap <esc> <Nop>
inoremap <C-h> <esc>

" Smart way to move between windows
nnoremap <C-n> <C-W>h
nnoremap <C-e> <C-W>j
nnoremap <C-i> <C-W>k
nnoremap <C-o> <C-W>l

" Colemak binds
" NEIO to move,
" h insert
" k open
" l end
" j n
nnoremap n h
nnoremap N H
nnoremap e gj
nnoremap E J
nnoremap i gk
nnoremap I K
nnoremap o l
nnoremap O L

nnoremap h i
nnoremap H I
nnoremap k o
nnoremap K O
nnoremap l e
nnoremap L E
nnoremap j n
nnoremap J N
"zero should take to first non whitespace character
nnoremap 0 ^

"Easily add blank lines
noremap { O<ESC>
noremap } o<ESC>
