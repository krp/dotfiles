-- local use = require('packer').use
-- require('packer').startup(function ()
--   use 'wbthomason/packer.nvim' -- Package manager
--   use 'neovim/nvim-lspconfig' -- Collection of configurations
-- end)

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- depends on neovim v0.6+
print('hello from ~/.config/nvim/lua/basic.lua')


vim.g.mapleader = ' '


-- lua helpers
Plug 'nvim-lua/plenary.nvim'

-- LSP
Plug 'neovim/nvim-lspconfig'

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
--TODO: Plug('scrooloose/nerdtree', {on= 'NERDTreeToggle'})

-- Plug('junegunn/fzf', {dir: '~/.fzf', do: './install --all'})
--TODO: Plug('junegunn/fzf', {['do'] = '-> fzf#install()'})
--TODO: Plug 'junegunn/fzf.vim'

-- and this
-- Plug 'justinmk/vim-gtfo'

-- Treesitter
-- Then use TSInstall <language> to use. See repo for languages
--TODO: Plug('nvim-treesitter/nvim-treesitter', {['do']= ':TSUpdate'})

-- Syntax
--TODO: Plug 'pangloss/vim-javascript'
--TODO: Plug 'mxw/vim-jsx'
--TODO: Plug 'moll/vim-node'
--TODO: Plug 'elzr/vim-json'
--TODO: Plug 'rust-lang/rust.vim'
--TODO: Plug('python-mode/python-mode', {branch= 'develop'})
--TODO: Plug 'leafgarland/typescript-vim'
--TODO: Plug 'peitalin/vim-jsx-typescript'
--TODO: Plug 'neomake/neomake'
--TODO: Plug 'dart-lang/dart-vim-plugin'
--TODO: Plug 'thosakwe/vim-flutter'

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
--TODO: Reenable Plug 'vim-airline/vim-airline'
--TODO: Reenable Plug 'vim-airline/vim-airline-themes'


-- Movement
-- maybe remove:
-- Plug 'sjl/gundo.vim'
--TODO: Plug 'tpope/vim-surround'
--TODO: Plug 'tpope/vim-repeat'
--TODO: Plug 'terryma/vim-expand-region'
-- remove? Plug 'terryma/vim-multiple-cursors'
-- search for .editorconfig file
--TODO: Plug 'editorconfig/editorconfig-vim'
--Plug 'junegunn/vim-after-object'
--TODO: Plug 'junegunn/vim-easy-align'


-- Docs
--TODO: Plug 'KabbAmine/zeavim.vim'


-- Docker
--TODO: Plug 'ekalinin/Dockerfile.vim'


-- Some new colorschemes
Plug 'andreasvc/vim-256noir'
Plug 'danilo-augusto/vim-afterglow'
Plug 'ayu-theme/ayu-vim'
Plug 'nightsense/carbonized'
Plug 'ajmwagar/vim-deus'
Plug 'jaredgorski/fogbell.vim'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'fmoralesc/molokayo'
Plug('joshdick/onedark.vim', {branch='main'})
Plug('kyoz/purify', {rtp='vim'})
Plug 'sainnhe/sonokai'
Plug 'huyvohcmc/atlas.vim'
Plug 'LuRsT/austere.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'Lokaltog/vim-monotone'
--


-- Misc
--TODO: Plug 'junegunn/goyo.vim'
--TODO: Plug 'tpope/vim-rsi'
--TODO: Plug 'glepnir/dashboard-nvim'


vim.call('plug#end')


-- LSP Setup. Must come after plug#end
require('lsp_setup')

-- Settings:
require('settings')

--vim.call('neomake#configure#automake("w")')

-- Enable colorscheme
-- vim.cmd('colorscheme molokai')

vim.cmd [[
  syntax enable
  colorscheme molokai
  command! Hello echom "hello!!"
]]

require('binds')
-- can also load from regular vim script
-- vim.cmd 'source ~/.config/nvim/keymap.vim'

