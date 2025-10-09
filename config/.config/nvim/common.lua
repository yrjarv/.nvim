-- Relative numbers
vim.wo.number         = true
vim.wo.relativenumber = true

-- Indentation
vim.opt.tabstop       = 8 -- Tabs should be wider than spaces indenting
vim.opt.softtabstop   = 8 -- Tabs should be wider than spaces indenting
vim.opt.shiftwidth    = 4 -- The size of an indent
vim.opt.smarttab      = true
vim.opt.expandtab     = true -- Always use spaces for indenting
vim.opt.autoindent    = true

-- Making nvim interact nicely with my system
vim.opt.fileformat    = "unix"
vim.opt.clipboard     = 'unnamedplus'
vim.g.mouse           = 'a'
vim.opt.encoding      = "utf-8"
vim.opt.swapfile      = false

-- Line length
vim.opt.colorcolumn   = '80'
vim.opt.textwidth     = 80
vim.opt.formatoptions = vim.opt.formatoptions + "t"

-- Misc
vim.opt.scrolloff     = 7 -- Start scrolling 7 lines before end of screen
