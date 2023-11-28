-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local g = vim.g
local o = vim.o

-- Editor UI
o.number = true
o.relativenumber = false

-- Editing
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
o.mouse = ""

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"
