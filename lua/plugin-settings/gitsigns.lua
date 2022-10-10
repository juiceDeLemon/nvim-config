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
    signcolumn = true,
    numhl = true,
    current_line_blame = true,
    current_line_blame_opts = { virt_text = true, virt_text_pos = "eol", delay = 3000 },
    preview_config = {
        -- Options passed to nvim_open_win
        border = "rounded",
        style = "minimal",
        relative = "cursor",
    },
    yadm = { enable = true },
}
