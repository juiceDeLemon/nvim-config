require("mini.move").setup {
    mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = "<c-h>",
        right = "<c-l>",
        down = "<c-j>",
        up = "<c-k>",

        -- cove current line in Normal mode
        line_left = "<c-h>",
        line_right = "<c-l>",
        line_down = "<c-j>",
        line_up = "<c-k>",
    },
}
