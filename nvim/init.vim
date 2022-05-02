" Current vim annoyances (April 2022)
" (mostly due to lack of time to investigate good neovim plugins)
" no intelligent suggestions for importing files
" no mypy hinting / suggestions on invalid lines - fixed with lsp & coc
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

lua <<EOF
require('basic')
EOF


" Code
" " Plug 'jaxbot/selective-undo.vim'

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
"nnoremap <tab> %
"vnoremap <tab> %

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
" TODO: Currently disabled.
" let g:dart_style_guide=1
" nnoremap <leader>fa :FlutterRun<cr>
" nnoremap <leader>fq :FlutterQuit<cr>
" nnoremap <leader>fr :FlutterHotReload<cr>
" nnoremap <leader>fR :FlutterHotRestart<cr>
" nnoremap <leader>fD :FlutterVisualDebug<cr>

" Completion
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']



" CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" TODO: Conflict with editing nvimrc
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>




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
