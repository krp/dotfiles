print('loading settings')
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

-- coc.nvim settings
vim.opt.cmdheight = 2
vim.opt.updatetime = 200
-- vim.opt.shortmess += 'c'
vim.opt.signcolumn = 'number'


