-- ██╗░░░░░██╗░░░██╗░█████╗░██╗░░░░░██╗███╗░░██╗███████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██║░░░░░██║░░░██║██╔══██╗██║░░░░░██║████╗░██║██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║░░░░░██║░░░██║███████║██║░░░░░██║██╔██╗██║█████╗░░░░░██║░░░░░██║░░░██║███████║
-- ██║░░░░░██║░░░██║██╔══██║██║░░░░░██║██║╚████║██╔══╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ███████╗╚██████╔╝██║░░██║███████╗██║██║░╚███║███████╗██╗███████╗╚██████╔╝██║░░██║
-- ╚══════╝░╚═════╝░╚═╝░░╚═╝╚══════╝╚═╝╚═╝░░╚══╝╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local tabline = require("tabline")

lualine.setup({
    options = {
        globalstatus = true,
        refresh = {
            statusline = 250,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename", "filetype" },
        lualine_c = { "branch", "diff", "diagnostics" },
        lualine_x = { "encoding" },
        lualine_y = { "location" },
        lualine_z = { "progress" },
    },
    inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
    },
    tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { tabline.tabline_buffers }, -- tabline.nvim
        lualine_x = { tabline.tabline_tabs }, -- tabline.nvim
        -- lualine_y = { "aerial" },
        lualine_y = {},
        lualine_z = { "vim.fn.strftime(\"%H:%M\")" }, -- time
    },
    extensions = {},
})

