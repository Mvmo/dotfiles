vim.cmd [[
    packadd packer.nvim
]]

return require("packer").startup(function()
    use "wbthomason/packer.nvim"
    use { "ellisonleao/gruvbox.nvim" }
    use { "neoclide/coc.nvim", branch = "release" }
    use { "jiangmiao/auto-pairs" }
    use { "jparise/vim-graphql" }

    use { 
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use { "nvim-treesitter/nvim-treesitter-refactor" }

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

    use "mxw/vim-jsx"
    use "pangloss/vim-javascript"

    use { 
        "preservim/nerdtree",
        requires = {
            { "Xuyuanp/nerdtree-git-plugin" },
            { "ryanoasis/vim-devicons" }
        }
    }

    use {
        "pantharshit00/vim-prisma"
    }

    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }

    use {
        "ThePrimeagen/harpoon"
    }

end)
