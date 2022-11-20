vim.cmd [[
packadd packer.nvim
]]

return require("packer").startup(function()
    use { "wbthomason/packer.nvim" }

    use { "ellisonleao/gruvbox.nvim" }
    use { "nvim-lua/plenary.nvim" }

    use { 
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {
            { "nvim-lua/plenary.nvim" }
        }
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
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

    use {
        'tanvirtin/vgit.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

end)
