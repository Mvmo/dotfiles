vim.cmd [[
    packadd packer.nvim
]]

return require("packer").startup(function()
    use 'wbthomason/packer.nvim'
    use { "ellisonleao/gruvbox.nvim" }
    use { "neoclide/coc.nvim", branch = "release" }
    use { "jiangmiao/auto-pairs" }
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {
            { "nvim-lua/plenary.nvim" }
        }
    }
    use {
        "s1n7ax/nvim-terminal",
        config = function()
            vim.o.hidden = true
            require('nvim-terminal').setup()
        end,
    }
    use { "ziglang/zig.vim" }
    use "pangloss/vim-javascript"
    use "leafgarland/typescript-vim"
    use "peitalin/vim-jsx-typescript"
    use { "styled-components/vim-styled-components", branch = "main" }
    use "jparise/vim-graphql"
end)
