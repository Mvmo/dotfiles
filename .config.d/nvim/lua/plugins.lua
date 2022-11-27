vim.cmd [[
packadd packer.nvim
]]

return require("packer").startup(function()
    use { "wbthomason/packer.nvim" }

    use { "ellisonleao/gruvbox.nvim" }
    use { "nvim-lua/plenary.nvim" }
    use { "ThePrimeagen/harpoon" }
    use { "jiangmiao/auto-pairs" }

    use { "neovim/nvim-lspconfig" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/nvim-cmp" }

    use { 'feline-nvim/feline.nvim' } 

    use { "L3MON4D3/LuaSnip" }
    use { "saadparwaiz1/cmp_luasnip" }

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


    -- fill the gap in syntax highlighting done by treesitter
    use { "leafgarland/typescript-vim" }
    use { "peitalin/vim-jsx-typescript" }

    use { "windwp/nvim-ts-autotag" }

end)
