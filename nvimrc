let mapleader = ' '

call plug#begin('~/.config/nvim/plugged')

" Colors
Plug 'krisrp/molokai.vim'

" Files
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-gtfo'

" Syntax
Plug 'pangloss/vim-javascript'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'

" Git
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Node
Plug 'moll/vim-node'
Plug 'elzr/vim-json'

" Rust
Plug 'rust-lang/rust.vim' | Plug 'rust-lang/rust' | Plug 'racer-rust/vim-racer'

" Python
Plug 'python-mode/python-mode', { 'branch': 'develop' }

" Code
Plug 'sjl/gundo.vim'
" Plug 'jaxbot/selective-undo.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-after-object'
Plug 'junegunn/vim-easy-align'

" Docs
Plug 'KabbAmine/zeavim.vim'

" Misc
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-rsi'

" Typescript
Plug 'leafgarland/typescript-vim'
" See github for configuration
Plug 'peitalin/vim-jsx-typescript'

call plug#end()

" Settings
set encoding=utf-8 " Necessary for unicode glyphs
set linespace=3 " Num of pixels inserted between adjacent lines
set breakindent " Continue linebreaks at correct indentation
set linebreak " Wrap lines at 'breakat' char
set autowrite " Autowrite on make/shell commands
set autoread
set timeoutlen=250 " Time to wait after ESC. 0 bugs out some keypresses
set clipboard+=unnamed " Yanks go on clipboard instead
set cursorline " Highlight current line
set hlsearch " Highlight search
set wrap " Wrap lines
set relativenumber " Show relative line numbers
set undofile " vim 7.3+ can create <FILENAME>.un~ for persistent undo
set gdefault " With :s/foo/bar/g, globally substitute all matches on line without needing /g
set showmatch " Briefly show where matching paren/bracket is when inserted
set textwidth=79 " Wrap at 79 chars except in paste mode
set formatoptions=qrn1 " Wrapping options. See :help fo-table
"set colorcolumn=120 " Show colored column after 120 chars
set background=dark

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='simple'
let g:gitgutter_sign_removed_first_line = "^_"
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "M",
  \ "Staged"    : "✚",
  \ "Untracked" : "U",
  \ "Renamed"   : "R",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "D",
  \ "Clean"     : "C",
  \ "Unknown"   : "?"
  \ }
let g:jsx_ext_required=0
" Rust
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let $RUST_SRC_PATH="$HOME/.config/nvim/plugged/rust/src"

" Show arrow at beginning of wrapped lines
let &showbreak='↪ '

" Mappings
map <leader>n :NERDTreeToggle<cr>
nmap <leader>g :Goyo<cr>
" Bind 'jj' to Esc. Useful when CapsLock isn't rebound to Esc
inoremap jj <Esc>
" Fast file-saving
nmap <leader>w :w!<cr>
" Fast editing of vimrc
nmap <leader>e :e! $MYVIMRC<cr>
" When vimrc is edited and saved, automatically reload it
autocmd! bufwritepost vimrc source $MYVIMRC
" Fast close-buffer
nmap <leader>x :bdelete<cr>
" Toggle hlsearch off
map <leader>h :nohlsearch<cr>
" Uses Tab to match bracket pairs instead of using %
nnoremap <tab> %
vnoremap <tab> %
" Disable accidental opening of docs on F1 keypress
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" Easier split swaps
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Use <leader>l to toggle display of whitespace
nmap <leader>, :set list!<cr>
exec "set listchars=tab:->,trail:\uB7,nbsp:~,eol:¬"
" Strip all trailing whitespace from current file
nnoremap <leader>W :%s/\s\+%//<cr>:let @/=''<cr>
" Add support for 'after' designated chars. (See junegunn/vim-after-object)
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
" (junegunn/vim-easy-align) in visual-mode only (see docs for normal mode)
xmap ga <Plug>(EasyAlign)
" Fuzzy finder (see junegunn/fzf.vim for more details)
map <leader>t :FZF<cr>


colorscheme molokai
