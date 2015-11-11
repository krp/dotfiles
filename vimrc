"
" .vimrc - Kris Pritchard
"

" NeoBundle
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))


NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make',
    \     'linux' : 'make',
    \     'unix' : 'gmake',
    \    },
    \ }

NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
nnoremap <C-l> :Unite -silent -start-insert file file_rec/async buffer file_mru<CR>
nnoremap <C-x> :Unite line<CR>

let mapleader = ' '             " Bind <leader> key to space.

NeoBundle 'tpope/vim-fugitive'      " Git wrapper
NeoBundle 'airblade/vim-gitgutter'  " Git diffs in gutter
NeoBundle 'Lokaltog/vim-easymotion' " Enhanced motion navigation

NeoBundle 'scrooloose/nerdtree'
""let loaded_nerd_tree=0 " Load NERDTree at startup
let NERDChrismasTree=1 " Additional syntax highlighting
let NERDTreeDirArrows=0 " Current font is missing unicode arrows
map <leader>n :NERDTreeToggle<cr>

NeoBundle 'Xuyuanp/nerdtree-git-plugin'
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

NeoBundle 'jistr/vim-nerdtree-tabs'  " Better nerdtree support w/ tabs

NeoBundle 'scrooloose/nerdcommenter' " Smart commenting out of code

map <leader>' :ConqueTermSplit bpython<CR>
NeoBundle 'tpope/vim-surround'      " Adds additional surround functionality
NeoBundle 'tpope/vim-repeat' " Smarter repeat using .
NeoBundle 'krisrp/vim-sensible'     " Sane default. tpope fork w/ additions.
NeoBundle 'krisrp/conque'       " Run programs inside buffer

NeoBundle 'krisrp/molokai.vim'      " #1 colorscheme
NeoBundle 'evanmiller/nginx-vim-syntax'

" Python-mode. Additional python features.
NeoBundle 'klen/python-mode'
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes"
let g:pymode_lint_write = 1
let g:pymode_run_key = '<leader>a'
" Use jedi instead
let g:pymode_rope = 0
" Override go-to.definition key shortcut to Ctrl-]
"let g:pymode_rope_goto_definition_bind = "<C-]>"
"let g:pymode_breakpoint_key = '<leader>b'
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 1
" Rope makes vim horrendously slow. See help :pymode-rope-slow
let g:pymode_rope_lookup_project = 0
" Disable ipdb settrace default binding of <leader>b
let g:pymode_breakpoint = 0
let g:pymode_options_max_line_length = 120


" Rainbow Parentheses. Consider switching to junegunn's maintained fork.
NeoBundle 'krisrp/rainbow_parentheses.vim'

NeoBundle 'ctrlpvim/ctrlp.vim'      " Fuzzy file/buffer/mru/tag finder.
let g:ctrlp_map = '<leader>t'
set wildignore+=*/tmp/*,*/venv/*,*/node_modules/*
set wildignore+=*.so,*.swp,*~,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"nmap <leader>y :CtrlPBuffer<cr>


NeoBundle 'tacahiroy/ctrlp-funky'
let g:ctrlp_extensions = ['funky']



NeoBundle 'majutsushi/tagbar'           " Tagbar
nmap <leader>r :TagbarToggle<cr>

NeoBundle 'vim-scripts/cscope_macros.vim'   " cscope. Run cscope -R in code dir.

"" ListToggle
NeoBundle 'Valloric/ListToggle'         " Display quickfix/location lists.
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

NeoBundle 'terryma/vim-expand-region'   " Expand visual mode by region
"map K <Plug>(expand_region_expand)
"map J <Plug>(expand_region_shrink)

NeoBundle 'rking/ag.vim'                " Silver searcher

NeoBundle 'bling/vim-airline'           " Vim Airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='simple'

" pytest.vim
NeoBundle 'alfredodeza/pytest.vim'
nmap <silent><Leader>f <Esc>:Pytest file<CR>
nmap <silent><Leader>c <Esc>:Pytest class<CR>
nmap <silent><Leader>m <Esc>:Pytest method<CR>
map <leader>s <Esc>:Pytest session<CR>

"" jedi python autocompletion
"NeoBundle 'davidhalter/jedi-vim'
"let g:jedi#popup_on_dot = 0
"let g:jedi#use_splits_not_buffers = "left"

NeoBundle 'mattn/emmet-vim'             " emmet.io. HTML/CSS toolkit

NeoBundle 'zah/nimrod.vim'                  " Nim language support

NeoBundle 'nathanaelkane/vim-indent-guides'
" <leader>ig is default binding for toggling indentation guides

NeoBundle 'jaxbot/selective-undo.vim'

NeoBundle 'Wolfy87/vim-enmasse'

"NeoBundle 'FriedSock/smeargle'     " Might be useful in combo w/ rain_parens

" NOTE: Requires installation of node packages in order to work.
" cd to tern_for_vim dir and run npm install
NeoBundle 'marijnh/tern_for_vim'

" XXX: Deprecate this and replace w/ ESLint at some point
NeoBundle 'Shutnik/jshint2.vim'
let jshint2_save = 1
let jshint2_confirm = 0
" jshint validation
nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> <C-O>:JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
nnoremap <silent><F2> :lnext<CR>
inoremap <silent><F2> <C-O>:lnext<CR>
vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> <C-O>:lprevious<CR>
vnoremap <silent><F3> :lprevious<CR>

NeoBundle 'godlygeek/tabular'

NeoBundle 'einars/js-beautify'
NeoBundle 'maksimr/vim-jsbeautify'
map <leader>b :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <leader>b :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <leader>b :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <leader>b :call CSSBeautify()<cr>


NeoBundle 'rhysd/vim-clang-format'
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

NeoBundle 'terryma/vim-multiple-cursors'

NeoBundle 'editorconfig/editorconfig-vim'

NeoBundle 'junegunn/goyo.vim'   " Distraction-free writing in Vim
" Switch to distraction-free mode with leader-G
nmap <leader>g :Goyo<CR>

NeoBundle 'KabbAmine/zeavim.vim'        " Zeal for vim

NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'osyo-manga/vim-anzu'
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

" anzu statusline
set statusline=%{anzu#search_status()}


call neobundle#end()

filetype plugin indent on      " Enable indent plugin - Required by NeoBundle/Vundle

"let g:mapleader = "\"          " Use \ as leader key. Disabled.
set encoding=utf-8              " Necessary for unicode glyphs
set t_Co=256                    " 256 color terminal support



"let g:Powerline_symbols = 'fancy' " Requires a patched font.
"let g:Powerline_symbols = 'unicode'
"let g:Powerline_symbols = 'compatible'


syntax enable
set modeline

" Tabs/spaces/etc.
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
filetype plugin on             " Enable
"set omnifunc=syntaxcomplete#Complete
set linespace=3                 " Num pixel lines inserted between characters.

set breakindent                 " Continue linebreaks at correct indentation
set linebreak                   " Wrap lines at 'breakat' char.

" Set 'jj' to Esc. Good for computers w/o capslock rebinding.
inoremap jj <Esc>

" Enable mouse scrolling in terminal vim
set mouse=a

" Eliminate windows line endings: %s/<Ctrl-V><Ctrl-M>//g

" Fast saving. Press leader+w to write changes to file
nmap <leader>w :w!<cr>
" Fast editing of .vimrc. Press leader+e to edit vimrc.
map <leader>e :e! $MYVIMRC<cr>
"nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr> " Steve Losh's binding for
"above command. Opens it in a new split window.

" Vertically split window switch cursor focus with leader+v.
set splitright
set splitbelow
nnoremap <leader>v <C-w>v<C-w>l

" Cycle through buffers
"map <F2> :bprevious<CR>
"map <F3> :bnext<CR>


" ctags file
" Requires that ctags is installed, and that you run ctags -R in the root of
" your code directory
set tags=./tags;$HOME/programming/

" When vimrc is edited and saved, automatically reload it
 autocmd! bufwritepost vimrc source ~/.vimrc

" Disable italic/etc attributes from color schemes
" set gui=NONE
" set cterm=NONE
" set term=NONE
":sp $VIMRUNTIME/syntax/hitest.vim | source %       " Display all colors

" GUI options
if has('gui_running')
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
endif

" run python script
map ,t :w\|:!python %<CR>

" close buffer
map <leader>x :bdelete<CR>

" Tpope's sensible.vim handles
" autoindent, backspace, complete, smarttab, nrformats, ttimeout,
" ttimeoutlen=100, incsearch, laststatus, history, etc.
" Move defaults from here to there.

set autowrite                   " Writes on make/shell commands
set autoread
set timeoutlen=250              " Time to wait after ESC, 0 bugs out some keypresses
set clipboard+=unnamed          " Yanks go on clipboard instead.

" Toggle hlsearch off with leader+h, or just type :noh.
set hlsearch
map <leader>h :nohlsearch<CR>

"set nowrap
"set textwidth=0                 " Don't wrap lines by default

" Enable wrapping with:
 set wrap
 set linebreak                   " Only wrap at a character in 'breakat' option
 set nolist                      " Disables adding linebreaks where there shouldn't be any
 set wrapmargin=0

" set wildmode=list:longest " Makes the autocompletion take up much more
" screen space
set ttyfast " Indicates fast terminal connection. See :help ttyfast
set relativenumber " Show relative line numbers. Allows faster vertical motion
set number " Show actual line number of cursor instead of just '0'.
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
"set colorcolumn=120 " Show colored column after 85 chars.

nnoremap j gj
nnoremap k gk

" Rebind q and use . for repeating instead.
nnoremap q <nop>

" Disable help on F1 keypress. Avoids accidentally hitting it if you press Esc.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Neovim terminal bindings
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
endif

" Easier split swaps
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Automatically write changes to file after losing focus.
au FocusLost * :wa

" Strip all trailing whitespace from current file
nnoremap <leader>W :%s/\s\+%//<cr>:let @/=''<cr>

" Command and Auto commands " {{{
" Sudo write - just type :W if you edit a file without root permissions
" it'll prompt for your sudo password, then write the file as root.
comm! W exec 'w !sudo tee % > /dev/null' | e!

" Use <leader>l to toggle display of whitespace
nmap <leader>, :set list!<CR>
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~,eol:¬"

" Show arrow at beginning of wrapped lines.
let &showbreak='↪ '


" from Damian Conway
"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)

function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction


" Always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['Darkblue',    'SeaGreen3'],
    \ ['magenta',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkyellow',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkblue',       'firebrick3'],
    \ ['blue',        'RoyalBlue3'],
    \ ['cyan',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['magenta',    'firebrick3'],
    \ ['yellow',       'RoyalBlue3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkblue',    'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ]

"map <leader>R :RainbowParenthesesToggle<cr>

NeoBundleCheck

colorscheme molokai
