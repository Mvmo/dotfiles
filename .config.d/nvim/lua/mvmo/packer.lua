return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end
    }
    use "nvim-treesitter/nvim-treesitter-context"

    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {
            { "nvim-lua/plenary.nvim" }
        }
    }

    use {
        "ellisonleao/gruvbox.nvim",
        as = "gruvbox",
        config = function()
            vim.cmd([[
                colorscheme gruvbox
            ]])
        end
    }

    -- lsp
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "saadparwaiz1/cmp_luasnip" },

            { "jose-elias-alvarez/null-ls.nvim" },
            { "MunifTanjim/prettier.nvim" },

            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" }
        }
    }


    use "theprimeagen/harpoon"
    use "jiangmiao/auto-pairs"

    use "leafgarland/typescript-vim"
    use "peitalin/vim-jsx-typescript"

    use "mbbill/undotree"
end)
