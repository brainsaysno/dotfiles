-- Enable syntax highlighting
-- syntax on
-- filetype plugin indent on

-- Enable relative and absolute numbers in the sidebar (hybrid numbering)
vim.opt.number=true
vim.opt.relativenumber=true

-- Set cursor to square box in all modes
vim.opt.guicursor=true
vim.opt.hidden=true

-- Disable line wrapping
vim.opt.nowrap=true

-- Start scrolling vertically when 12 lines are left
vim.opt.scrolloff=12

-- Share system clipboard
vim.opt.clipboard='unnamed'

-- Use utf-8 encoding
vim.opt.encoding='utf-8'

-- Use 2 spaces for tabs
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab=true

-- Enable auto indenting
vim.opt.autoindent=true
vim.opt.smartindent=true

 -- Use dark mode
vim.opt.background='dark'

 -- Disable swap files
vim.opt.noswapfile=true

-- Disable highlighting in searches
vim.opt.nohlsearch=true

--  Hide default status line in favor of lualine
vim.opt.noshowmode=true
vim.opt.noruler=true
vim.opt.noshowcmd=true

vim.g.mapleader=' '
