-- ░█████╗░██╗░░░░░██████╗░██╗░░██╗░█████╗░░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔══██╗██║░░░░░██╔══██╗██║░░██║██╔══██╗░░░██║░░░░░██║░░░██║██╔══██╗
-- ███████║██║░░░░░██████╔╝███████║███████║░░░██║░░░░░██║░░░██║███████║
-- ██╔══██║██║░░░░░██╔═══╝░██╔══██║██╔══██║░░░██║░░░░░██║░░░██║██╔══██║
-- ██║░░██║███████╗██║░░░░░██║░░██║██║░░██║██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

alpha.setup(require'alpha.themes.dashboard'.config)

local dashboard = require "alpha.themes.dashboard"

local M = { }

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
    dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
    -- dashboard.button("p", "  Find project", ":Telescope projects<CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles<CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep<CR>"),
    dashboard.button("c", "  Configuration", ":e ~/.config/nvim/<CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
    local datetime = os.date "%d-%m-%Y %H:%M:%S"
    local plugins_text = "  v"
        .. vim.version().major
        .. "."
        .. vim.version().minor
        .. "."
        .. vim.version().patch
        .. "   "
        .. datetime

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

