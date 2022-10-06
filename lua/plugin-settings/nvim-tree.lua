-- ███╗░░██╗██╗░░░██╗██╗███╗░░░███╗░░░░░░████████╗██████╗░███████╗███████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ████╗░██║██║░░░██║██║████╗░████║░░░░░░╚══██╔══╝██╔══██╗██╔════╝██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██╔██╗██║╚██╗░██╔╝██║██╔████╔██║█████╗░░░██║░░░██████╔╝█████╗░░█████╗░░░░░██║░░░░░██║░░░██║███████║
-- ██║╚████║░╚████╔╝░██║██║╚██╔╝██║╚════╝░░░██║░░░██╔══██╗██╔══╝░░██╔══╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ██║░╚███║░░╚██╔╝░░██║██║░╚═╝░██║░░░░░░░░░██║░░░██║░░██║███████╗███████╗██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝░░░░░░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local nvim_tree = require "nvim-tree"

local colours = require("colours")

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- customise file font and colours
-- https://neovim.io/doc/user/api.html
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = colours.teal, bold = true, underline = true })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName",
                    { fg = colours.blue, italic = true, bold = true, underline = true })
vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = colours.comment, bold = true })

nvim_tree.setup {
    hijack_cursor = true,
    update_focused_file = { enable = true },
    diagnostics = { enable = true },

    git = { timeout = 5000 },
    view = { preserve_window_proportions = true, relativenumber = true },
    renderer = {
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "name",
        indent_markers = { enable = true, inline_arrows = true },
    },
    filters = { custom = { "^\\.git" } },
    trash = { cmd = "trash " },
}
