require("zsidanyi")

-- Basic options
local opt = vim.opt
local g = vim.g

-- Lualine
require("lualine").setup()

-- NetRW (builtin)
-- File explorer
g.netrw_special_syntax = 1
g.netrw_fastbrowse = 2
g.netrw_liststyle = 3
g.netrw_altv = 1
g.netrw_banner= 0
g.netrw_winsize = 25

-- Just a bulk of useful options
g.nocompatible = true -- no compatibility with old Vi
g.virtualedit = block -- virtualedit for block selection (actual rectangle is used)
g.fileformat = "unix"
g.timeoutlen = 150

opt.cmdheight = 2
opt.laststatus = 3 -- statusline always on
opt.showcmd = true -- show partial commands in the last line
opt.ruler = true -- display cursor position

opt.number = true
opt.relativenumber = true
opt.visualbell = true
opt.mouse = "a"
vim.cmd[[set path+=**]] -- path to be able to search fuzzy down in the tree
opt.autoindent = true -- autoindent (keep indenting while new line isert)
opt.smartindent = true
opt.listchars= {
    space = '·',
    eol = '¬',
    tab = '»»',
    trail = '·',
    extends = '>',
    precedes = '<',
    nbsp = '%'
}

opt.completeopt = 'menu' -- omnicompletion only in menu not in separate buffer

vim.cmd[[colorscheme tokyonight-storm]]

-- Search options
opt.wildmenu = true -- tab complete on command line
opt.ignorecase = true -- case insensitive
opt.smartcase = true -- except when using capital letters
opt.hlsearch = false -- highlight matching text
opt.incsearch = true -- update highlight when typing
opt.showmatch = true
opt.gdefault = true -- default global substitution

-- Indentation options
-- Use 4 spaces instead of tabs
local numSpaces = 2
opt.tabstop = numSpaces
opt.shiftwidth = numSpaces
opt.softtabstop = numSpaces
opt.expandtab = true
opt.smarttab = true

