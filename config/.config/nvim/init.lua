local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('jiangmiao/auto-pairs')
Plug('m4xshen/hardtime.nvim')
vim.call('plug#end')

require("hardtime").setup()

home = os.getenv("HOME")
package.path = home .. "/.config/nvim/?.lua;" .. package.path
require"common"
require"theme"
require"treesitter"
require"lsp"
