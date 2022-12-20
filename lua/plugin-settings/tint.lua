-- ████████╗██╗███╗░░██╗████████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ╚══██╔══╝██║████╗░██║╚══██╔══╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ░░░██║░░░██║██╔██╗██║░░░██║░░░░░░██║░░░░░██║░░░██║███████║
-- ░░░██║░░░██║██║╚████║░░░██║░░░░░░██║░░░░░██║░░░██║██╔══██║
-- ░░░██║░░░██║██║░╚███║░░░██║░░░██╗███████╗╚██████╔╝██║░░██║
-- ░░░╚═╝░░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local t = require "tint"

t.setup {
    tint = -50,
    highlight_ignore_patterns = { "Whitespace", "FSSuffix", "@comment" },
    window_ignore_function = function(winid)
        local bufid = vim.api.nvim_win_get_buf(winid)
        local buftype = vim.api.nvim_buf_get_option(bufid, "buftype")
        local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

        local filetype = vim.bo.filetype

        -- Do not tint `terminal` or floating windows, tint everything else
        return (buftype == "terminal" or floating) or (filetype == "NvimTree")
    end
,
}
