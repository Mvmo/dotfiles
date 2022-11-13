require("nvim-tree").setup()

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            custom_only = true,
            list = {
                { key = "a", action = "create" },
                { key = "d", action = "remove" },
                { key = "c", action = "copy" },
                { key = "x", action = "cut" },
                { key = "p", action = "paste" },
                { key = "r", action = "rename" },
                { key = "<C-r>", action = "full_rename" },
                { key = "R", action = "refresh" },
                { key = "<cr>", action = "edit" },
                { key ="`", action = "preview" }
            },
        },
    },
    renderer = {
        group_empty = true,
    },
})
