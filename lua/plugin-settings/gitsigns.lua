-- ░██████╗░██╗████████╗░██████╗██╗░██████╗░███╗░░██╗░██████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔════╝░██║╚══██╔══╝██╔════╝██║██╔════╝░████╗░██║██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║░░██╗░██║░░░██║░░░╚█████╗░██║██║░░██╗░██╔██╗██║╚█████╗░░░░██║░░░░░██║░░░██║███████║
-- ██║░░╚██╗██║░░░██║░░░░╚═══██╗██║██║░░╚██╗██║╚████║░╚═══██╗░░░██║░░░░░██║░░░██║██╔══██║
-- ╚██████╔╝██║░░░██║░░░██████╔╝██║╚██████╔╝██║░╚███║██████╔╝██╗███████╗╚██████╔╝██║░░██║
-- ░╚═════╝░╚═╝░░░╚═╝░░░╚═════╝░╚═╝░╚═════╝░╚═╝░░╚══╝╚═════╝░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local gs = require "gitsigns"

gs.setup {
    signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = {
            hl = "GitSignsAdd",
            text = "▎",
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn",
        },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
    word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 3000,
    },
    preview_config = {
        -- Options passed to nvim_open_win
        border = "rounded",
        style = "minimal",
        relative = "cursor",
    },
    yadm = { enable = true },
}
