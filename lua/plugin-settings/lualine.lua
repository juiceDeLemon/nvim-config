-- ██╗░░░░░██╗░░░██╗░█████╗░██╗░░░░░██╗███╗░░██╗███████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██║░░░░░██║░░░██║██╔══██╗██║░░░░░██║████╗░██║██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║░░░░░██║░░░██║███████║██║░░░░░██║██╔██╗██║█████╗░░░░░██║░░░░░██║░░░██║███████║
-- ██║░░░░░██║░░░██║██╔══██║██║░░░░░██║██║╚████║██╔══╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ███████╗╚██████╔╝██║░░██║███████╗██║██║░╚███║███████╗██╗███████╗╚██████╔╝██║░░██║
-- ╚══════╝░╚═════╝░╚═╝░░╚═╝╚══════╝╚═╝╚═╝░░╚══╝╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local ll = require "lualine"
local tl = require "tabline"
local navic = require "nvim-navic"

ll.setup {
    options = { globalstatus = true, refresh = { statusline = 250 } },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename", "filetype" },
        lualine_c = { "branch", "diff", "diagnostics" },
        lualine_x = { "encoding" },
        lualine_y = { "location" },
        lualine_z = { "progress" },
    },
    inactive_sections = { lualine_a = { "filename" }, lualine_z = { "progress" } },
    tabline = {
        lualine_a = { tl.tabline_buffers },
        lualine_x = { tl.tabline_tabs },
        lualine_z = { "vim.fn.strftime(\"%H:%M\")" }, -- time
    },
    winbar = { lualine_b = { { "filename", path = 3 }, navic.get_location } },
    extensions = {},
}
