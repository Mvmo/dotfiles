vim.cmd [[
    nnoremap <leader>w  <cmd>w<cr>
    nnoremap <leader>q  <cmd>q<cr>

    nnoremap <C-j>  <cmd>m+<cr>
    nnoremap <C-k>  <cmd>m-2<cr>

    nmap <Up> :wincmd k<cr>
    nmap <Down> :wincmd j<cr>
    nmap <Left> :wincmd h<cr>
    nmap <Right> :wincmd l<cr>

    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    nnoremap <leader>t  <cmd>lua NTGlobal["terminal"]:toggle()<cr>

    nnoremap <leader>n  <cmd>NERDTreeFocus<cr>
    nnoremap <C-n> :NERDTree<cr>
    nnoremap <C-t> :NERDTreeToggle<cr>
    nnoremap <C-f> :NERDTreeFind<cr>

    vnoremap <leader>rr <Esc><cmd>lua require("telescope").extensions.refactoring.refactors()<cr>

    nnoremap <C-h> <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>
    nnoremap <leader>a <cmd>lua require("harpoon.mark").add_file()<cr>
    nnoremap <leader>j <cmd>lua require("harpoon.ui").nav_file(1)<cr>
    nnoremap <leader>k <cmd>lua require("harpoon.ui").nav_file(2)<cr>
    nnoremap <leader>l <cmd>lua require("harpoon.ui").nav_file(3)<cr>
    nnoremap <leader>ö <cmd>lua require("harpoon.ui").nav_file(4)<cr>

    nnoremap <leader>r gd[{V%::s/<C-R>///gc<left><left><left>
    nnoremap <leader>R gD:%s/<C-R>///gc<left><left><left>

    inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
]]
