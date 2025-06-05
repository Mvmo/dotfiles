-- this function will be called at the end of the file
local function init()
	setup_options()
	init_autocommands()
	init_package_manager()
	install_packages()
    configure_lsp()
    configure_treesitter()
    configure_telescope()
    configure_nvimtree()
    configure_prettier()
    finalize_keymap()
end

function setup_options()
    vim.opt.encoding = "utf-8"
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.background = "dark"
    vim.opt.wildmenu = true
    vim.opt.wildmode = "longest:full,full"
    vim.opt.wrap = false
    vim.opt.hidden = true
    vim.opt.hlsearch = false
    vim.opt.scrolloff = 9
    vim.opt.swapfile = false
    vim.opt.backup = false
    vim.opt.undofile = true
    vim.opt.undodir = "/home/mvmo/.nvim/undodir"
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 0
    vim.opt.shiftwidth = 4
    vim.opt.termguicolors = true
    vim.opt.cursorline = true

    vim.o.updatetime = 300
    vim.o.incsearch = false

    vim.wo.signcolumn = "yes"

    vim.g.mapleader = " "
    vim.g.maplocalleader = "\\"

    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#4D4D4D", bold = true })
end


function init_autocommands()
    local autocommand_group = vim.api.nvim_create_augroup("mv_autogroup", {})

    local on = vim.api.nvim_create_autocmd

    on("TextYankPost", {
        group = autocommand_group,
        pattern = "*",
        callback = function()
            vim.highlight.on_yank({
                higroup = "IncSearch",
                timeout = 40,
            })
        end
    })

    on("BufWritePre", {
        group = autocommand_group,
        pattern = "*",
        command = [[%s/\s\+$//e]],
    })

end

function init_package_manager()
    -- this is directyl duplicated from the
    -- Bootstrap lazy.nvim
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
                { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                { out, "WarningMsg" },
                { "\nPress any key to exit..." },
            }, true, {})
            vim.fn.getchar()
            os.exit(1)
        end
    end
    vim.opt.rtp:prepend(lazypath)
end

function install_packages()
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
            branch = "v3.x",
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
end

function configure_lsp()
    local lsp = require("lsp-zero")

    lsp.preset("recommended")

    require("mason").setup({})
    require("mason-lspconfig").setup({
        ensure_installed = { "rust_analyzer", "lua_ls" },
        handlers = {
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end
        }
    })

    lsp.nvim_lua_ls()

    local cmp = require("cmp")

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    cmp.setup({
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<Tab>"] = nil,
        }),
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        sources = {
            { name}
        }
    })

    lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
            error = 'E',
            warn = 'W',
            hint = 'H',
            info = 'I'
        }
    })

    lsp.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vof", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "fmt", function() vim.lsp.buf.format() end, opts)
    end)

    lsp.setup()

    vim.diagnostic.config({
        virtual_text = true
    })

    vim.api.nvim_create_autocmd({"BufWritePost"}, {
        pattern = { "*.tsx", "*.ts", "*.json" },
        callback = function() vim.lsp.buf.format() end,
    })

    require'lspconfig'.sourcekit.setup{}
end

function configure_treesitter()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "vimdoc", "javascript", "typescript", "css", "html", "c", "lua", "rust", "java", "tsx" },
        refactor = {
            highlight_definitions = {
                enable = true,
                clear_on_cursor_move = true,
            },
            smart_rename = {
                enable = true,
                keymaps = {
                    smart_rename = "grr",
                },
            },
        },
        autotag = {
            enable = true,
            enable_rename = true,
        },
    })

    local treesitter_context = require("treesitter-context")

    treesitter_context.setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    })

    vim.keymap.set("n", "[c", function()
        treesitter_context.go_to_context()
    end, { silent = true })

    require('nvim-ts-autotag').setup({
        opts = {
            -- Defaults
            enable_close = true, -- Auto close tags
            enable_rename = true, -- Auto rename pairs of tags
            enable_close_on_slash = true -- Auto close on trailing </
        },
        filetypes = { "html", "tsx", "jsx", "xml" }
    })
end

function configure_telescope()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
        defaults = {
            file_ignore_patterns = { "node_modules", ".next", ".git", ".dist", "target" }
        }
    })

    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fs", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
end

function configure_nvimtree()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- OR setup with some options
    require("nvim-tree").setup({
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = false,
        },
    })
end

function configure_prettier()
    local prettier = require("prettier")

    prettier.setup({
        bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
        filetypes = {
            "css",
            "graphql",
            "html",
            "javascript",
            "javascriptreact",
            "json",
            "less",
            "markdown",
            "scss",
            "typescript",
            "typescriptreact",
            "yaml",
        },
        ["null_ls"] = {
            condition = function()
                return prettier.config_exists({
                    -- if `false`, skips checking `package.json` for `"prettier"` key
                    check_package_json = true,
                })
            end,
            runtime_condition = function(params)
                -- return false to skip running prettier
                return true
            end,
            timeout = 5000,
        }
    })
end

function finalize_keymap()
    vim.g.mapleader = " "

    vim.keymap.set("n", "x", '"_x')
    vim.keymap.set("n", "<leader>d", '"_d')

    vim.keymap.set("n", "<leader>w", '<cmd>w<cr>')
    vim.keymap.set("n", "<leader>q", '<cmd>q<cr>')

    vim.keymap.set("n", "<C-j>", '<cmd>m+<cr>')
    vim.keymap.set("n", "<C-k>", '<cmd>m-2<cr>')

    vim.keymap.set("n", "<Up>", '<cmd>wincmd k<cr>')
    vim.keymap.set("n", "<Down>", '<cmd>wincmd j<cr>')
    vim.keymap.set("n", "<Left>", '<cmd>wincmd h<cr>')
    vim.keymap.set("n", "<Right>", '<cmd>wincmd l<cr>')

    vim.keymap.set("n", "<leader>y", '"+y')
    vim.keymap.set("n", "<leader>Y", '"+yy')
    vim.keymap.set("v", "<leader>y", '"+y')

    vim.keymap.set("x", "<leader>p", '"_dP')

    vim.keymap.set("x", "<leader>xc", "<Esc><cmd>JsxCommentVisual<cr>")

    vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<cr>")
end

init()

