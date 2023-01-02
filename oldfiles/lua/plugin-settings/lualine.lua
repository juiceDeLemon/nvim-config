-- ██╗░░░░░██╗░░░██╗░█████╗░██╗░░░░░██╗███╗░░██╗███████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██║░░░░░██║░░░██║██╔══██╗██║░░░░░██║████╗░██║██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║░░░░░██║░░░██║███████║██║░░░░░██║██╔██╗██║█████╗░░░░░██║░░░░░██║░░░██║███████║
-- ██║░░░░░██║░░░██║██╔══██║██║░░░░░██║██║╚████║██╔══╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ███████╗╚██████╔╝██║░░██║███████╗██║██║░╚███║███████╗██╗███████╗╚██████╔╝██║░░██║
-- ╚══════╝░╚═════╝░╚═╝░░╚═╝╚══════╝╚═╝╚═╝░░╚══╝╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local ll = require "lualine"
local noice = require "noice"
local b = require "barbecue"
local i = require "icons"

ll.setup {
    options = {
        globalstatus = true,
        refresh = { statusline = 250 },
        ignore_focus = { "help", "NvimTree", "alpha" },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename", "filetype" },
        lualine_c = { "branch", "diff", "diagnostics" },
        lualine_x = {
            { noice.api.status.mode.get, cond = noice.api.status.mode.has },
            "filesize",
            "encoding",
        },
        lualine_y = { "location" },
        lualine_z = { "progress" },
    },
    inactive_sections = { lualine_a = { "filename" }, lualine_z = { "progress" } },
}
b.setup {
    modifiers = { dirname = ":~" },
    symbols = { separator = i.ui.DivLineRight, default_context = "..." },
    kinds = i.kinds,
}
