require("mvmo.opts")
require("mvmo.keymap")
-- require("mvmo.packer")
require("mvmo.lazy")

local augroup = vim.api.nvim_create_augroup
local mvmo_augroup = augroup("mvmo", {})
local yank_augroup = augroup("HighlightYank", {})

local autocmd = vim.api.nvim_create_autocmd

function r(name)
    require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
    group = yank_augroup,
    pattern = "*",
    callback = function()
	    vim.highlight.on_yank({
		    higroup = "IncSearch",
		    timeout = 40,
	    })
    end
})

-- remove every trailing whitspace
autocmd({"BufWritePre"}, {
    group = mvmo_augroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- custom line nr color
vim.cmd("highlight LineNrCustom guifg=#e78a4e")
-- override theme
autocmd("ColorScheme", {
    group = mvmo_augroup,
    pattern = "*",
    command = "highlight! link LineNr LineNrCustom"
})

vim.cmd([[
    set cursorline
    hi CursorLine term=bold cterm=bold guibg=Grey30
]])

