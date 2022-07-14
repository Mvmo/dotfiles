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
end)
