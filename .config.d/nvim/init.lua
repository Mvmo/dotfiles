vim.g.mapleader = " "

vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.background = "dark"
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wrap = false
vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.scrolloff = 10
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = "/Users/mvmo/.vim/undodir"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.termguicolors = true
vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = 'yes'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("plugins")

vim.cmd [[
    colorscheme gruvbox
]]

vim.cmd [[hi LineNr guifg=#e78a4e]]

vim.cmd [[
    set cursorline
    hi CursorLine term=bold cterm=bold guibg=Grey30
]]

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

vim.cmd([[
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
]])

require("keyboard_config")
require("treesitter_config")
require("nvimtree_config")
require("lsp-config")

require('nvim-ts-autotag').setup()
