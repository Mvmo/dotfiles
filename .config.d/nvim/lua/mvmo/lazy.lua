local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end
    },
    { "nvim-treesitter/nvim-treesitter-context" },
    {
        "sainnhe/everforest",
        config = function()
            vim.cmd.colorscheme("everforest")
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.4",
        dependencies = {
            { "nvim-lua/plenary.nvim" }
        }
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "saadparwaiz1/cmp_luasnip" },

            { "MunifTanjim/prettier.nvim" },

            { "hrsh7th/cmp-vsnip" },
            { "hrsh7th/vim-vsnip" },

             -- { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
            { "folke/trouble.nvim" }
        }
    },
    { "theprimeagen/harpoon",         },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    { "mbbill/undotree",        },
    { "gleam-lang/gleam.vim"    },
    { "pest-parser/pest.vim"    },
    { "windwp/nvim-ts-autotag"  },
    { "nvim-tree/nvim-tree.lua" },
    { "Apfelfrosch/jsxcomments.nvim" }
})
