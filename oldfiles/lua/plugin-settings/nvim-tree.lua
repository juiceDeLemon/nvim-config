-- ███╗░░██╗██╗░░░██╗██╗███╗░░░███╗░░░░░░████████╗██████╗░███████╗███████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ████╗░██║██║░░░██║██║████╗░████║░░░░░░╚══██╔══╝██╔══██╗██╔════╝██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██╔██╗██║╚██╗░██╔╝██║██╔████╔██║█████╗░░░██║░░░██████╔╝█████╗░░█████╗░░░░░██║░░░░░██║░░░██║███████║
-- ██║╚████║░╚████╔╝░██║██║╚██╔╝██║╚════╝░░░██║░░░██╔══██╗██╔══╝░░██╔══╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ██║░╚███║░░╚██╔╝░░██║██║░╚═╝░██║░░░░░░░░░██║░░░██║░░██║███████╗███████╗██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝░░░░░░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local nvim_tree = require "nvim-tree"

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

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
    filters = { custom = { "^\\.git", ".DS_Store" } },
    trash = { cmd = "trash " },
}
