vim.g.mapleader = " "

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<leader>d", '"_d')

vim.keymap.set("n", "<leader>w", '<cmd>w<cr>')
vim.keymap.set("n", "<leader>q", '<cmd>q<cr>')

vim.keymap.set("n", "<C-j>", '<cmd>m+<cr>')
vim.keymap.set("n", "<C-k>", '<cmd>m-2<cr>')

vim.keymap.set("n", "<Up>", '<cmd>wincmd k<cr>')
vim.keymap.set("n", "<Down>", '<cmd>wincmd j<cr>')
vim.keymap.set("n", "<Left>", '<cmd>wincmd h<cr>')
vim.keymap.set("n", "<Right>", '<cmd>wincmd l<cr>')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+yy')
vim.keymap.set("v", "<leader>y", '"+y')

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("x", "<leader>xc", "<Esc><cmd>JsxCommentVisual<cr>")

vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<cr>")
