-- ░██╗░░░░░░░██╗██╗███╗░░██╗░░░░░░░██████╗███████╗██████╗░░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ░██║░░██╗░░██║██║████╗░██║░░░░░░██╔════╝██╔════╝██╔══██╗░░░██║░░░░░██║░░░██║██╔══██╗
-- ░╚██╗████╗██╔╝██║██╔██╗██║█████╗╚█████╗░█████╗░░██████╔╝░░░██║░░░░░██║░░░██║███████║
-- ░░████╔═████║░██║██║╚████║╚════╝░╚═══██╗██╔══╝░░██╔═══╝░░░░██║░░░░░██║░░░██║██╔══██║
-- ░░╚██╔╝░╚██╔╝░██║██║░╚███║░░░░░░██████╔╝███████╗██║░░░░░██╗███████╗╚██████╔╝██║░░██║
-- ░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝░░░░░░╚═════╝░╚══════╝╚═╝░░░░░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local ws = require "colorful-winsep"
local c = require "colours"

ws.setup {
    highlight = { guibg = c.bg, guifg = c.red },
    create_event = function()
        if vim.fn.winnr("$") == 3 then
            local win_id = vim.fn.win_getid(vim.fn.winnr("h"))
            local filetype = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win_id),
                                 "filetype")
            if filetype == "NvimTree" then ws.NvimSeparatorDel() end
        end
    end
,
}
