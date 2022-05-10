-- local use = require('packer').use
-- require('packer').startup(function ()
--   use 'wbthomason/packer.nvim' -- Package manager
--   use 'neovim/nvim-lspconfig' -- Collection of configurations
-- end)

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- depends on neovim v0.6+
--print('hello from ~/.config/nvim/lua/basic.lua')


vim.g.mapleader = ' '


-- lua helpers
Plug 'nvim-lua/plenary.nvim'

-- LSP: Further configuration after plug#end
Plug 'neovim/nvim-lspconfig'

-- Completion
Plug('neoclide/coc.nvim', {branch= 'release'})

-- Telescope
Plug 'nvim-telescope/telescope.nvim'

-- File management
-- Plug('scrooloose/nerdtree', {on= 'NERDTreeToggle'})
Plug 'kyazdani42/nvim-tree.lua'
-- For file icons
Plug 'kyazdani42/nvim-web-devicons'

-- FZF / Fuzzy Finder
Plug('junegunn/fzf', {['do'] = '-> fzf#install()'})
Plug 'junegunn/fzf.vim'

-- and this
-- Plug 'justinmk/vim-gtfo'

-- Treesitter
-- Then use TSInstall <language> to use. See repo for languages
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

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


-- Languages
Plug('fatih/vim-go', {['do'] = ':GoUpdateBinaries' })

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

-- Notifications
Plug 'rcarriga/nvim-notify'


-- Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


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


-- Colors
Plug 'krp/molokai.vim'
-- styles: nightfox, nordfox, dayfox, dawnfox, duskfox, randfox
Plug 'EdenEast/nightfox.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'rmehri01/onenord.nvim'
Plug 'wilmanbarrios/palenight.nvim'
-- Plug 'luissiacc/gruvbox-baby'
Plug 'embark-theme/vim'
Plug 'tiagovla/tokyodark.nvim'


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
-- 'Focus' plugin. :Goyo
Plug 'junegunn/goyo.vim'
--TODO: Plug 'tpope/vim-rsi'
Plug 'glepnir/dashboard-nvim'


vim.call('plug#end')


-- LSP Setup. Must come after plug#end
require('lsp_setup')

-- Treesitter Setup
require('treesitter_setup')

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

-- Theme settings
local theme = require('theme')

theme.init()


-- require("notify")("My super important message")
vim.notify = require("notify")

require("testplugin")





require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
    }
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
} -- END_DEFAULT_OPTS
