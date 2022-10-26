-- ░█████╗░██╗░░░░░██████╗░██╗░░██╗░█████╗░░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔══██╗██║░░░░░██╔══██╗██║░░██║██╔══██╗░░░██║░░░░░██║░░░██║██╔══██╗
-- ███████║██║░░░░░██████╔╝███████║███████║░░░██║░░░░░██║░░░██║███████║
-- ██╔══██║██║░░░░░██╔═══╝░██╔══██║██╔══██║░░░██║░░░░░██║░░░██║██╔══██║
-- ██║░░██║███████╗██║░░░░░██║░░██║██║░░██║██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local alpha = require "alpha"

alpha.setup(require"alpha.themes.dashboard".config)

local dashboard = require "alpha.themes.dashboard"

local M = {}

dashboard.section.header.val = {
    "░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗██╗",
    "░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝██║",
    "░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░██║",
    " ░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░╚═╝",
    " ░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗██╗",
    "  ░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝╚═╝",
}
dashboard.section.header.opts.hl = "Function"

dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
    dashboard.button("n", "  New file", "<cmd>ene <BAR> startinsert<CR>"),
    -- dashboard.button("p", "  Find project", "<cmd>Telescope projects<CR>"),
    dashboard.button("r", "  Recently used files", "<cmd>Telescope oldfiles<CR>"),
    dashboard.button("t", "  Find text", "<cmd>Telescope live_grep<CR>"),
    dashboard.button("e", "פּ  Open Tree", "<cmd>e .<CR>"),
    dashboard.button("c", "  Configuration", "<cmd>e ~/.config/nvim/<CR>"),
    dashboard.button("p", "  Install plugins", "<cmd>PackerUpdate<CR>"),
    dashboard.button("q", "  Quit Neovim", "<cmd>qa<CR>"),
}

local function footer()
    local datetime = os.date "%d-%m-%Y %H:%M:%S"
    -- LuaFormatter off
    local plugins_text = "  v"
        .. vim.version().major
        .. "."
        .. vim.version().minor
        .. "."
        .. vim.version().patch
        .. "   "
        .. datetime
    -- LuaFormatter on
    -- Quote
    local fortune = require "alpha.fortune"
    local quote = table.concat(fortune(), "\n")

    return plugins_text .. "\n" .. quote
end


dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

return M
