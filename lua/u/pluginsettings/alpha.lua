local alpha = require "alpha"

alpha.setup(require("alpha.themes.dashboard").config)

local dashboard = require "alpha.themes.dashboard"

local M = {}

dashboard.section.header.val = {
    "                                 ╔╬╙╟▌,",
    ' ,∩ƒ≥≥≥≤ƒ≤ ,╔╦╦╦╦╦╦╦╦╦╦╦╦       ]╩  ║╬"',
    ';]░░░░░░░»╙`               "²Φ╦╗╣▌  ╜  ',
    '░░░░░╔░²╙╙░"                  ,▒▒╠╬    ',
    "¡░░≥≥░╚╚╩Å╩.,           .╓╓êê╬╠╙╙ ╠    ",
    "]]░░≥░▒░░░Ç ╙╙╙╙╙╙╙╜╙╙╙╙╙└ ,,╗╩≥ê░╠    ",
    "  ╙╙▒░░░░▒░░Å≤╓╓╔≡≡≡≡≡╓╓╓#░░░╠░░░▐╜    ",
    "    ╠▒░░╩░░░░╠░░░░░░░░╠░░░░░╬▒░░░╝⌐    ",
    "    ▐▒░░░▒░░░░╠░░░░░░░╠░░░░╬╬▒░░░▒     ",
    '    ▐╬░░░╠▒ ""╠"░░░░░╠░░░░╔╬╬░░░▒╩     ',
    "     ▐░░░░╠  Γ╙╦░░░░╙╠░░░╔╬╬░░░░▒      ",
    "     ▐░░░ ╚▒░ ,╠░░░;≥╠░░░╠╬░░░░░▒      ",
    '      ▒░░░,╠░▒░╠░░░"╚╩╚╚▒▒╠░░░░╠`      ',
    "      ╬▒░░░░╬╙╚░╬╚╚▒▒▒░▒╚╠▒╚≥░╔╠       ",
    "       ╬░░░░░▒░░╬░░╙▒▒╔╩▒▒░░░]╠        ",
    "       '╬░░ ░╠░░▒▒░,╬╔╚░▒░░░░╠▒        ",
    "        ╚▒░░ ╙╚░░,Å░Å╬░≥≥≥╚░╬╩         ",
    "         ╙╩╦▒▒▒≥▒▒░░╬▒░░░╔╦╬╙          ",
    "              ╙╙╙╙╙╙╙╙╙╩╙`             ",
}
dashboard.section.header.opts.hl = "Function"

dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
    dashboard.button("n", "  New file", "<cmd>ene <BAR> startinsert<cr>"),
    dashboard.button("o", "  recently used files", "<cmd>Telescope oldfiles<cr>"),
    dashboard.button("s", "  find String", "<cmd>Telescope live_grep<cr>"),
    dashboard.button("e", "  open tree", "<cmd>e .<cr>"),
    dashboard.button("g", "  open lazyGit", "<cmd>LazyGit<cr>"),
    dashboard.button("c", "  Configuration", "<cmd>e ~/.config/nvim/<cr>"),
    dashboard.button("h", "  Help command", "<cmd>Telescope help_tags<cr>"),
    dashboard.button("q", "  Quit neovim", "<cmd>qa<cr>"),
}

local function footer()
    local datetime = os.date "%d-%m-%Y %H:%M:%S"
    local plugins_text = "  v"
        .. vim.version().major
        .. "."
        .. vim.version().minor
        .. "."
        .. vim.version().patch
        .. "   "
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
