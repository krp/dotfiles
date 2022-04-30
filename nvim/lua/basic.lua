-- depends on neovim v0.6+
print('hello from ~/.config/nvim/lua/basic.lua')

vim.g.mapleader = ' '


local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- lua helpers
Plug 'nvim-lua/plenary.nvim'

-- Colors
Plug 'krp/molokai.vim'
-- styles: nightfox, nordfox, dayfox, dawnfox, duskfox, randfox
Plug 'EdenEast/nightfox.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'wilmanbarrios/palenight.nvim'
-- Plug 'luissiacc/gruvbox-baby'
Plug 'embark-theme/vim'
Plug 'tiagovla/tokyodark.nvim'


-- File management
Plug('scrooloose/nerdtree', {on= 'NERDTreeToggle'})

-- Plug('junegunn/fzf', {dir: '~/.fzf', do: './install --all'})
Plug('junegunn/fzf', {['do'] = '-> fzf#install()'})
Plug 'junegunn/fzf.vim'

-- and this
-- Plug 'justinmk/vim-gtfo'

-- Treesitter
-- Then use TSInstall <language> to use. See repo for languages
Plug('nvim-treesitter/nvim-treesitter', {['do']= ':TSUpdate'})

-- Syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'elzr/vim-json'
Plug 'rust-lang/rust.vim'
Plug('python-mode/python-mode', {branch= 'develop'})
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neomake/neomake'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

-- Plug 'posva/vim-vue'


-- Rainbow parentheses
-- Plug 'junegunn/rainbow_parentheses.vim'
-- Plug 'p00f/nvim-ts-rainbow'


-- Version Control
-- possibly remove this
-- Plug 'Xuyuanp/nerdtree-git-plugin'
-- Plug 'tpope/vim-fugitive'
-- Plug 'airblade/vim-gitgutter'
-- Plug 'lewis6991/gitsigns.nvim'
-- Plug 'junegunn/gv.vim'


-- Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


-- Movement
-- maybe remove:
-- Plug 'sjl/gundo.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-expand-region'
-- remove? Plug 'terryma/vim-multiple-cursors'
-- search for .editorconfig file
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-after-object'
Plug 'junegunn/vim-easy-align'


-- Docs
Plug 'KabbAmine/zeavim.vim'


-- Docker
Plug 'ekalinin/Dockerfile.vim'


-- Some new colorschemes
-- andreasvc/vim-256noir
-- danilo-augusto/vim-afterglow
-- ayu-theme/ayu-vim
-- nightsense/carbonized
-- ajmwagar/vim-deus
-- jaredgorski/fogbell.vim
-- morhetz/gruvbox
-- NLKNguyen/papercolor-theme
-- fmoralesc/molokayo
-- joshdick/onedark.vim
-- kyoz/purify, { 'rtp': 'vim' }
-- sainnhe/sonokai
-- huyvohcmc/atlas.vim
-- LuRsT/austere.vim
-- reedes/vim-colors-pencil
-- Lokaltog/vim-monotone
--


-- Misc
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-rsi'
Plug 'glepnir/dashboard-nvim'


vim.call('plug#end')


--vim.call('neomake#configure#automake("w")')

-- vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'

-- buffer scoped
vim.opt.autoindent = true

-- window-scoped
vim.opt.cursorline = true

-- global scope
vim.opt.autowrite = true


-- Settings
-- Necessary for unicode glyphs
vim.opt.encoding = 'utf-8'

-- " Num of pixels inserted between adjacent lines
vim.opt.linespace=3

-- Continue linebreaks at correct indentation
vim.opt.breakindent  = true

-- Wrap lines at 'breakat' char
vim.opt.linebreak = true

-- Autowrite on make/shell commands
vim.opt.autowrite = true

vim.opt.autoread = true

-- Time to wait after ESC. 0 bugs out some keypresses
vim.opt.timeoutlen=250

-- Yanks go on clipboard instead
-- vim.opt.clipboard += unnamed

-- Highlight current line
vim.opt.cursorline = true

-- Highlight search
vim.opt.hlsearch = true

-- Wrap lines
vim.opt.wrap = true

-- Show relative line numbers
vim.opt.relativenumber = true

-- vim 7.3+ can create <FILENAME>.un~ for persistent undo
vim.opt.undofile = true

-- With :s/foo/bar/g, globally substitute all matches on line without needing /g
vim.opt.gdefault = true

-- Briefly show where matching paren/bracket is when inserted
vim.opt.showmatch = true

-- Wrap at 79 chars except in paste mode
vim.opt.textwidth=79

-- Wrapping options. See :help fo-table
vim.opt.formatoptions = 'qrn1'

-- Show colored column after 120 chars
vim.opt.colorcolumn = '120'

-- vim.opt.background = 'dark'

vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true


vim.opt.wildignore = {'*/cache/*', '*/tmp/*'}

vim.opt.errorformat = vim.opt.errorformat + '%f|%l col %c|%m'
-- vim.opt.errorformat:append('%f|%l col %c|%m')

vim.opt.listchars = {
  eol = '',
  tab = '->',
  trail = '?',
  nbsp = '~',
  eol = '¬'
}

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

vim.o.hidden = true
vim.o.history = 5000

vim.o.shiftwidth = vim.o.tabstop


-- Enable colorscheme
-- vim.cmd('colorscheme molokai')

vim.cmd [[
  syntax enable
  colorscheme molokai
  command! Hello echom "hello!!"
]]


local map = vim.api.nvim_set_keymap

-- Fast file-saving
-- map('n', '<Leader>w', ':write<CR>', {noremap = true})

local map2 = function(key)
  -- get the extra options
  local opts = {noremap = true}
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  -- basic support for buffer-scoped keybindings
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
  end
end


map2 {'n', '<Leader>w', ':write<CR>'}


local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.smart_tab = function()
  if vim.fn.pumvisible() == 1 then
    return t'<C-n>'
  else
    return t'<Tab>'
  end
end

vim.api.nvim_set_keymap(
  'i',
  '<Tab>',
  'v:lua.smart_tab()',
  {noremap = true, expr = true}
)

-- can also load from regular vim script
-- vim.cmd 'source ~/.config/nvim/keymap.vim'

