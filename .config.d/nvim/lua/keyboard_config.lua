vim.cmd [[
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    nnoremap <leader>t  <cmd>lua NTGlobal["terminal"]:toggle()<cr>

    nnoremap <leader>n  <cmd>NERDTreeFocus<cr>
    nnoremap <C-n> :NERDTree<cr>
    nnoremap <C-t> :NERDTreeToggle<cr>
    nnoremap <C-f> :NERDTreeFind<cr>
]]
