set nocompatible                " vim only, not vi

" Vundle
filetype off                    " required for vundle
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

set laststatus=2                " Always show status line
"let g:mapleader = "\"          " Use \ as leader key. Disabled.
set encoding=utf-8              " Necessary for unicode glyphs
set t_Co=256                    " 256 color terminal support
"let g:Powerline_symbols = 'fancy' " Requires a patched font.
"let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols = 'compatible'



syntax enable                  " Enable syntax highlighting
filetype indent plugin on      " Indent based on filetypes


set modeline                   " Enable the use of modelines
set tabstop=8                  " Number of columns 'Tabstops' should use
set expandtab                  " Convert tabs to spaces
set softtabstop=4              " Number of columns to use when pressing Tab
set shiftwidth=4               " When shifting using << or >>, shift by this many
filetype plugin on             " Recognize filetypes 
"set ofu=syntaxcomplete#Complete " Omnifunc Completion
set linespace=3                " Used for GUI to specify space between lines


" Pressing 'jj' in insert mode will hit Escape.
inoremap jj <Esc>


" Eliminate windows line endings: %s/<Ctrl-V><Ctrl-M>//g

let mapleader = ' '             " Bind <leader> key to space.
" Fast saving. Press leader+w to write changes to file
nmap <leader>w :w!<cr>
" Fast editing of the .vimrc. Press leader+e to edit vimrc.
map <leader>e :e! $MYVIMRC<cr>

" Vertically split window switch cursor focus with leader+v.
nnoremap <leader>v <C-w>v<C-w>l
" Navigate splits easily using Ctrl+hjkl.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Open MiniBufExplorer with leader+m.
map <leader>m :MiniBufExplorer<cr>
" When vimrc is edited and saved, automatically reload it
 autocmd! bufwritepost vimrc source ~/.vimrc

" Disable italic/etc attributes from color schemes
" set gui=NONE
" set cterm=NONE
" set term=NONE

" GUI options
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar


" gmarik's stuff
set history=256                 " Number of things to remember in history.
set autowrite                   " Writes on make/shell commands
set autoread  
set timeoutlen=500              " Time to wait after ESC, 0 bugs out some keypresses
set clipboard+=unnamed          " Yanks go on clipboard instead.

set hlsearch                    " highlight search
" Toggle hlsearch off with leader+h, or just type :noh.
map <leader>h :nohlsearch
set ignorecase                  " Do case insensitive matching with
set smartcase                   " Be sensitive when word begins with a capital letter
set incsearch                   " Incremental search - show matching patterns as you type
set backspace=indent,eol,start  " more powerful backspacing

"set nowrap
"set textwidth=0                 " Don't wrap lines by default

" Enable wrapping with:
 set wrap
 set linebreak                   " Only wrap at a character in 'breakat' option
 set nolist                      " Disables adding linebreaks where there shouldn't be any
 set wrapmargin=0

" Some of Steve Losh's settings
set scrolloff=3 " Show 3 lines above and below cursor when scrolling
set showcmd " Show parts of the currently typed command in the status line
set wildmenu " Show vim autocompletion commands on line above
" set wildmode=list:longest " Makes the autocompletion take up much more
" screen space
set cursorline " Highlights the current line
set ttyfast " Indicates fast terminal connection. See :help ttyfast
set relativenumber " Show relative line numbers. Allows faster vertical motion
set undofile " vim 7.3 feature which creates <FILENAME>.un~ for persistent undo
" Use ordinary regex handling instead of vim's
" Doesn't seem to work
"nnoremap / /\v 
"vnoremap / /\/ 
set gdefault " With :s/foo/bar/g, globally substitute all matches on line without needing /g
set showmatch " Briefly show where matching bracket is when one is inserted.
" Uses tab to match bracket pairs instead of using %
nnoremap <tab> % 
vnoremap <tab> % 
set textwidth=79 " Wrap lines after 79 chars except in paste mode
set formatoptions=qrn1 " Wrapping options. See :help fo-table
"set colorcolumn=85 " Show colored column after 85 chars.
"set list " Show invisible characters (tab and EOL)
"set listchars=tab:▸\ ,eol:¬ " Use these characters to show them. Current font lacks an arrow.

" Stop using arrow keys!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Disable help on F1 keypress. Avoids accidentally hitting it if you press Esc.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Automatically write changes to file after losing focus.
au FocusLost * :wa

" Strip all trailing whitespace from current file
nnoremap <leader>W :%s/\s\+%//<cr>:let @/=''<cr>


" Command and Auto commands " {{{
" Sudo write - just type :W if you edit a file without root permissions
" it'll prompt for your sudo password, then write the file as root.
comm! W exec 'w !sudo tee % > /dev/null' | e!



" My Bundles here:
 "
 " original repos on github
" Git wrapper. See github page.
Bundle 'tpope/vim-fugitive'



Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
" Interactive command features in split window
" Required for IPython integration
Bundle 'rosenfeld/conque-term' 
" Integrate vim with IPython
"Bundle 'ivanov/vim-ipython'
"" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" Adds surround functionality
Bundle 'tpope/vim-surround' 
 " vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
"Bundle 'indentpython'
Bundle 'wincent/Command-T'
let g:CommandTMaxFiles=50000
"map <leader>T ??

"Bundle 'JavaRun'
Bundle 'minibufexpl.vim'
Bundle 'mileszs/ack.vim'
Bundle 'YankRing.vim'

Bundle 'krispritchard/molokai.vim'
Bundle 'evanmiller/nginx-vim-syntax'

" Clang-Complete
"Bundle 'Rip-Rip/clang_complete'
"set completeopt=menu,menuone,longest

" Bundle 'Scratch - find appropriate plugin'

" Python-mode. Additional python features.
"Bundle 'klen/python-mode'
"let g:pymode_lint_checker = "pyflakes"


" threesome.vim
" tslime.vim
" pythonmode
" tpope's github
" UltiSnips (has youtube videos)
"
" Supertab
"Bundle 'ervandew/supertab'
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"

" SLIME for vim
"Bundle 'jpalardy/vim-slime'
"let g:slime_target = "tmux"
"
" Rainbow Parentheses klen != kien
" 
Bundle 'kien/rainbow_parentheses.vim'
" Always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"map <leader>R :RainbowParenthesesToggle<cr>

nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

" Gundo - Undo Tree
Bundle 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<cr>

" Vim-orgmode
"Bundle 'jceb/vim-orgmode'

" Snipmate (and dependencies)
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
"Bundle 'honza/snipmate-snippets'
"Bundle 'garbas/vim-snipmate'



" UltiSnips (alternative to Snipmate)
" Bundle 'SirVer/ultisnips'


" Steve Losh recommends Sparkup for html completion
" non github repos
" Bundle 'git://git.wincent.com/command-t.git

" MakeGreen
"Bundle 'reinh/vim-makegreen'

colorscheme molokai



"let loaded_nerd_tree=0 " Load NERDTree at startup
let NERDChrismasTree=1 " Additional syntax highlighting
let NERDTreeDirArrows=0 " Current font is missing unicode arrows
map <leader>n :NERDTreeToggle<cr>
