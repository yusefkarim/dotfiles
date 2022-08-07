local U = require('utils')
local api = vim.api
local cmd = api.nvim_command
local g = vim.g
local o = vim.o

-- cmd('syntax on')
cmd('filetype plugin indent on')

o.termguicolors = true
o.background = 'dark'


-- Do not save when switching buffers
o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Configure folding
o.foldmethod = 'syntax'
o.foldlevel = 99
g.markdown_folding = 1
g.tex_fold_enabled = 1
U.map('n', '<Space>', 'za')

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = 6
o.relativenumber = false
o.completeopt = 'menuone,noinsert,noselect'
o.shortmess = 'c'
o.signcolumn = 'yes'
o.cursorline = true
o.colorcolumn = '81'
o.showmatch = true

-- Better editing experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.smartindent = true
o.wrap = true
o.linebreak = true
o.breakindent = true
-- o.textwidth = 300
o.tabstop = 8
o.shiftwidth = 4
o.softtabstop = -1 -- If negative, shiftwidth value is used

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

--- Search
o.incsearch = true
o.wrapscan = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
o.backupdir = '/tmp/'
o.directory = '/tmp/'
o.undodir = '/tmp/'

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen, which greatly speeds it up, upto 6-7x faster
o.lazyredraw = true
