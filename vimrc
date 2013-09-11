set nocompatible                " vim only, not vi

" Vundle
"filetype off                    " required for vundle
"set runtimepath+=~/.vim/bundle/vundle/
"call vundle#rc()

" let Vundle manage Vundle (required)
"Bundle 'gmarik/vundle'

" NeoBundle
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Bundles

" Unite
NeoBundle 'Shougo/unite.vim'


" Git wrapper. See github page.
NeoBundle 'tpope/vim-fugitive'

" Moved to regular powerline via AUR package.
"Bundle 'Lokaltog/vim-powerline'
" Airline (powerline alternative)
"NeoBundle 'bling/vim-airline'

" Enhanced motion navigation
NeoBundle 'Lokaltog/vim-easymotion'

" Dark color scheme
NeoBundle 'Lokaltog/vim-distinguished'

NeoBundle 'scrooloose/nerdtree'
"let loaded_nerd_tree=0 " Load NERDTree at startup
let NERDChrismasTree=1 " Additional syntax highlighting
let NERDTreeDirArrows=0 " Current font is missing unicode arrows
map <leader>n :NERDTreeToggle<cr>

NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'scrooloose/syntastic'
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_python_checkers=['none']
"let g:syntastic_cpp_compiler_options = '-std=c++11'

" Interactive command features in split window
" Required for IPython integration
"Bundle 'rosenfeld/conque-term' 
" Integrate vim with IPython
"Bundle 'ivanov/vim-ipython'
"" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" Adds surround functionality
NeoBundle 'tpope/vim-surround' 

" repeat using .
NeoBundle 'tpope/vim-repeat'

 " vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'indentpython'
"Bundle 'wincent/Command-T'
"let g:CommandTMaxFiles=50000
"map <leader>T ??

"Bundle 'JavaRun'
"Bundle 'minibufexpl.vim'
NeoBundle 'mileszs/ack.vim'

NeoBundle 'krispritchard/molokai.vim'
NeoBundle 'evanmiller/nginx-vim-syntax'


" Clang-Complete
"Bundle 'Rip-Rip/clang_complete'
"set completeopt=menu,menuone,longest

" Bundle 'Scratch - find appropriate plugin'

" Python-mode. Additional python features.
NeoBundle 'klen/python-mode'
let g:pymode_lint_checker = "pyflakes"
let g:pymode_run_key = '<leader>a'
let g:pymode_folding = 0


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
NeoBundle 'kien/rainbow_parentheses.vim'
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

NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>t'
"let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {'dir': '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}
nmap <leader>y :CtrlPBuffer<cr>


NeoBundle 'tacahiroy/ctrlp-funky'
let g:ctrlp_extensions = ['funky']

nnoremap <Leader>fu :CtrlPFunky<cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky '.expand('<cword>')<cr>


" YankRing - Circular Yank
NeoBundle 'YankRing.vim'
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

" Gundo - Undo Tree
NeoBundle 'sjl/gundo.vim'
"nnoremap <F5> :GundoToggle<cr>

" Vim-orgmode
"Bundle 'jceb/vim-orgmode'

" Snipmate (and dependencies)
" Bundle 'MarcWeber/vim-addon-mw-utils'
" Bundle 'tomtom/tlib_vim'
" Bundle 'honza/snipmate-snippets'
" Bundle 'garbas/vim-snipmate'


NeoBundle 'spolu/dwm.vim'

" AsyncCommand
NeoBundle 'pydave/AsyncCommand'

" MakeGreen
NeoBundle 'reinh/vim-makegreen'

" TagList for ctags
"Bundle 'taglist.vim'

" Tagbar
NeoBundle 'majutsushi/tagbar'
nmap <leader>r :TagbarToggle<cr>

" cscope
" Requires that you run cscope -R in the root of your code directory.
NeoBundle 'vim-scripts/cscope_macros.vim'


" YouCompleteMe
NeoBundle 'Valloric/YouCompleteMe'
set completeopt+=preview
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" ListToggle
NeoBundle 'Valloric/ListToggle'
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

" cpplint.py: Download it from
" http://google-styleguide.googlecode.com/svn/trunk/cpplint/cpplint.py
" Rebind from <F7>
" autocmd FileType cpp map <buffer> <F3> :call Cpplint()<CR>
" Autolint when you save a cpp file - Requires my patches for .hpp extension
" support.
"autocmd BufWritePost *.h,*.cpp,*.hpp call Cpplint()
NeoBundle 'funorpain/vim-cpplint'

" Expand visual selection by region.
" Custom bindings
" map K <Plug>(expand_region_expand)
" map J <Plug>(expand_region_shrink)
NeoBundle 'terryma/vim-expand-region'


NeoBundle 'Glench/Vim-Jinja2-Syntax'


" silver_searcher
NeoBundle 'rking/ag.vim'

NeoBundle 'CCTree'
" UltiSnips (alternative to Snipmate)
" Bundle 'SirVer/ultisnips'


" Steve Losh recommends Sparkup for html completion
" non github repos
" Bundle 'git://git.wincent.com/command-t.git

" MakeGreen
"Bundle 'reinh/vim-makegreen'


filetype plugin indent on      " Enable indent plugin - Required by NeoBundle/Vundle

set laststatus=2                " Always show status line
"let g:mapleader = "\"          " Use \ as leader key. Disabled.
set encoding=utf-8              " Necessary for unicode glyphs
set t_Co=256                    " 256 color terminal support
"let g:Powerline_symbols = 'fancy' " Requires a patched font.
"let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols = 'compatible'



syntax enable
set modeline

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
filetype plugin on             " Enable 
"set ofu=syntaxcomplete#Complete
set linespace=3


" Set 'jj' to Esc
inoremap jj <Esc>

" Enable mouse scrolling in terminal vim
set mouse=a

" Eliminate windows line endings: %s/<Ctrl-V><Ctrl-M>//g

let mapleader = ' '             " Bind <leader> key to space.
" Fast saving. Press leader+w to write changes to file
nmap <leader>w :w!<cr>
" Fast editing of the .vimrc. Press leader+e to edit vimrc.
map <leader>e :e! $MYVIMRC<cr>
"nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr> " Steve Losh's binding for
"above command. Opens it in a new split window.

" Vertically split window switch cursor focus with leader+v.
nnoremap <leader>v <C-w>v<C-w>l
" Navigate splits easily using Ctrl+hjkl.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
map <leader>h :nohlsearch<CR>
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

" Stop using arrow keys! - Enabled for now, to avoid crippling those new to vim
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
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

" Store swap files in one location
"set dir^=$HOME/.vim/swap//

"" Store undo files in one location
"set undodir^=$HOME/.vim/undo//

" Make GUI use console colors
" set background=dark
" hi SpecialKey guifg=Blue
" hi MoreMsg guifg=Green
" hi Visual guifg=NONE guibg=NONE
" hi Folded ctermbg=4 guibg=Blue
" hi FoldColumn ctermbg=7
" hi DiffAdd guibg=Blue
" hi DiffChange guibg=Magenta
" hi DiffDelete guibg=Cyan
" hi Normal guifg=Gray guibg=Black
" hi Cursor guibg=White
" hi lCursor guibg=White
" hi Comment guifg=Cyan
" hi Constant guifg=Magenta
" hi Special guifg=Red
" hi Identifier guifg=Cyan
" hi Statement guifg=Yellow
" hi PreProc guifg=Blue
" hi Type guifg=Green
" hi Underlined guifg=Blue
" hi Todo guifg=Black


" " Function which strips all bold from colorschemes. May need an if() for terminals.
" function! Highlight_remove_attr(attr)
"     " save selection registers
"     new
"     silent! put
" 
"     " get current highlight configuration
"     redir @x
"     silent! highlight
"     redir END
"     " open temp buffer
"     new
"     " paste in
"     silent! put x
" 
"     " convert to vim syntax (from Mkcolorscheme.vim,
"     "   http://vim.sourceforge.net/scripts/script.php?script_id=85)
"     " delete empty,"links" and "cleared" lines
"     silent! g/^$\| links \| cleared/d
"     " join any lines wrapped by the highlight command output
"     silent! %s/\n \+/ /
"     " remove the xxx's
"     silent! %s/ xxx / /
"     " add highlight commands
"     silent! %s/^/highlight /
"     " protect spaces in some font names
"     silent! %s/font=\(.*\)/font='\1'/
" 
"     " substitute bold with "NONE"
"     execute 'silent! %s/' . a:attr . '\([\w,]*\)/NONE\1/geI'
"     " yank entire buffer
"     normal ggVG
"     " copy
"     silent! normal "xy
"     " run
"     execute @x
" 
"     " remove temp buffer
"     bwipeout!
" 
"     " restore selection registers
"     silent! normal ggVGy
"     bwipeout!
" endfunction
" autocmd BufNewFile,BufRead * call Highlight_remove_attr("bold")
" " Note adding ,Syntax above messes up the syntax loading
" " See :help syntax-loading for more info




" Colorschemes (Nice ones worth keeping):
" anotherdark
" asu1dark
" autumn
" autumn2
" autumnleaf
" baycomb
" bclear
" brookstream
" candycode
" chela_light
" colorer
" dante
" darkspectrum
" dawn
" delek
" desertEx
" dw_green
" dw_orange
" dw_yellow
" earendel
" evening (for bg colors)
" fineblue (not seeing any difference w/ fineblue2
" fnaqevan (good base)
" fruit
" habilight
" herald
" molokai
" delete moria (it sucks and is incomplete)
" motus
" mustang
" neon vs habilight, appears to be some negative spacing on 'n' characters
" nuvola
" print_bw
" pyte
" railscasts (and 2)
" rdark
" settlemyer
" sienna
" silent (cool line highlighting)
" simpleandfriendly (cool underlining of current line)
" slate
" summerfruit256
" tango
" tango2
" taqua (nice string colors)
" vc
" vibrantink
" vividchalk (same as vibrantink, but colors the data types)
" wombat256
" xemacs
"
" Worth Keeping :
" anotherdark
" candycode
" chela_light
" colorer
" darkspectrum
" earendel
" fruit
" habilight
" herald
" molokai
" mustang
" nuvola
" print_bw
" railscasts
" rdark
" silent
" solarized
" summerfruit256
" tango
" tango2
" taqua
" vibrantink
" vividchalk
" wombat256
"
"
"
" Installation check.
NeoBundleCheck

colorscheme molokai



