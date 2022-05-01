" Current vim annoyances (April 2022)
" (mostly due to lack of time to investigate good neovim plugins)
" no intelligent suggestions for importing files
" no mypy hinting / suggestions on invalid lines
" overly annoying pylint / neomake suggestions
" ctrl-6 no longer working for switching between recent files
" no decent fuzzy find
" no hotkey for running python
" no AREPL style auto-evaluation of code
" no decent auto-suggestions (and tabnine sucks)
" no easy commenting of code (like nerdcommenter)
" config currently stuck halfway between neovim all-lua and old vim
" no decent test-runner hotkey that uses quickfix or a buffer with nice
" pytest colored output in status bar, popping up if error
" no good auto-documention or intellisense info like bpython
" stackoverflow suggestions
" tldr suggestions
" snippets quick-insert
" copilot plugin
" multi-suggestions like oni had
" easy bootstrap from any system
" easy switch between / preview of colorschemes
" nice default colorschemes
" easy working with git
" modular config files
"
"
"let mapleader = ' '

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"call plug#begin('~/.config/nvim/plugged')

"
"" Colors
"Plug 'krp/molokai.vim'
"

lua <<EOF
require('basic')
EOF

"
"" Colorschemes
"" Nightfox: Styles: nightfox, nordfox, dayfox, dawnfox
"" duskfox, randfox
"Plug 'EdenEast/nightfox.nvim'
"
"" colorscheme: nord
"Plug 'arcticicestudio/nord-vim'
"
"Plug 'wilmanbarrios/palenight.nvim'

" Files
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" Plug 'justinmk/vim-gtfo'

" Syntax
" Plug 'pangloss/vim-javascript'
" 
" " Replaced by nvim-ts-rainbow
" " Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'p00f/nvim-ts-rainbow'
"  
" Plug 'posva/vim-vue'
" Plug 'mxw/vim-jsx'

" Git
"Plug 'tpope/vim-fugitive'
""Plug 'airblade/vim-gitgutter'
"Plug 'lewis6991/gitsigns.nvim'
"Plug 'junegunn/gv.vim'
"
"" Status bar
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"
"" Node
"Plug 'moll/vim-node'
"Plug 'elzr/vim-json'

" Rust
" Plug 'rust-lang/rust.vim' | Plug 'rust-lang/rust'
" 
" " Python
" Plug 'python-mode/python-mode', { 'branch': 'develop' }

" Code
" Plug 'sjl/gundo.vim'
" " Plug 'jaxbot/selective-undo.vim'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-repeat'
" Plug 'terryma/vim-expand-region'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'junegunn/vim-after-object'
" Plug 'junegunn/vim-easy-align'
" 
" " Docs
" Plug 'KabbAmine/zeavim.vim'
" 
" " Misc
" Plug 'junegunn/goyo.vim'
" Plug 'tpope/vim-rsi'

" Typescript
"Plug 'leafgarland/typescript-vim'
"" See github for configuration
"Plug 'peitalin/vim-jsx-typescript'
"
"
"" Treesitter
"" Then use TSInstall <language_to_install>
"" See repo for list of supported languages
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


" trouble.nvim - quickfix/diagnostics
" See repo for configuration options
" requires some configuration
"Plug 'kyazdani42/nvim-web-devicons'
"Plug 'folke/trouble.nvim'

" Requires lua plugin
" lua << EOF
"   require("trouble").setup {
"     -- your configuration comes here
"     -- or leave it empty to use the default settings
"     -- refer to the configuration section below
"   }
" EOF




"call plug#end()




"" " Settings
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
" nmap <leader>w :w!<cr>
" Fast editing of vimrc
nmap <leader>e :e! $MYVIMRC<cr>
" When vimrc is edited and saved, automatically reload it
autocmd! bufwritepost vimrc source $MYVIMRC

" Remap Q to prevent Ex mode
nmap Q <nop>

" EasyMotion
map <leader>a <Plug>(easymotion-b)
map <leader>d <Plug>(easymotion-w)

" Add leader-r runs Python file.
autocmd FileType python map <buffer> <leader>r :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" Can also use imap for insert-mode binding

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

"exec "set listchars=tab:->,trail:\uB7,nbsp:~,eol:¬"

" Strip all trailing whitespace from current file
nnoremap <leader>W :%s/\s\+%//<cr>:let @/=''<cr>

" Add support for 'after' designated chars. (See junegunn/vim-after-object)
"TODO: Reenable autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" (junegunn/vim-easy-align) in visual-mode only (see docs for normal mode)
xmap ga <Plug>(EasyAlign)

" Fuzzy finder (see junegunn/fzf.vim for more details)
map <leader>t :FZF<cr>

" TODO: Reenable for annoying lint warnings
" call neomake#configure#automake('w', 5000)

" vim-flutter
let g:dart_style_guide=1
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

" Completion
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" if exists('+termguicolors')
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif

set laststatus=2

" schemes
" soft, medium, hard
" let g:gruvbox_contrast = hard

colorscheme molokai  " good in Python but kinda sucks for Rust & Go


""" Crap to be migrated / double-checked from Mac config

" Completion
" Plug 'nvim-lua/completion-nvim'


" colorscheme 256_noir  " Nice simple black & white with red integers.
" colorscheme afterglow  " Ok in terminal, not great.
"let ayucolor="dark"
"colorscheme ayu  " Possibly not working
" colorscheme carbonized-dark  " Kinda crap. Has some pretty crazy cursor, status line, and
" number column highlighting.
"colorscheme deus  " Looks identical to gruvbox? Ok 
" colorscheme fogbell  " Not bad for monochrome
" colorscheme gruvbox  " Ok but a bit boring
" colorscheme PaperColor  " Ok. Quite nice in Rust. light and dark backgrounds.
" colorscheme molokayo  " Not bad molokai alternative. better w/ Rust than Go.
" colorscheme onedark  " Ok grey background, rest not great.
" colorscheme purify  " Italic comments. Ugly underlines in Rust. italic keywords in python.
" colorscheme sonokai  " Muted molokai. Ok but a bit boring.
" colorscheme atlas  " Monochrome. Might be ok for writing? Sucks for coding.
" colorscheme austere  " Boring grayscale.
" colorscheme pencil  " Potentially ok base if tweaked.
" colorscheme monotone  " Ok use of italic. Nice grey. Similar to atlas
