local alpha = require "alpha"

alpha.setup(require("alpha.themes.dashboard").config)

local dashboard = require "alpha.themes.dashboard"

local M = {}

dashboard.section.header.val = {
   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣤⢤⠀",
   "⠀⠀⢀⠠⡀⠠⠠⢀⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⣸⠆⠀⣟⠆",
   "⠀⡘⢀⠂⠐⡀⡑⢀⠑⠋⠚⠀⠁⠈⠀⠁⠈⠀⠁⠓⠊⠤⢤⠢⢄⡿⠀⠰⠛⠀",
   "⠐⠡⡀⠡⠀⡆⠐⡀⢁⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⢎⣠⢓⠀⠀⠀",
   "⠈⡄⠠⠂⢀⠅⠙⡐⠒⠠⣄⣀⣀⣀⣀⣀⣀⣀⣀⢤⠢⠋⠊⣴⠁⡀⢜⠀⠀⠀",
   "⠀⠂⢑⢐⠀⠂⠄⡈⠐⠤⡁⠈⠀⠈⠀⠁⠈⠀⠈⢀⠤⠒⠪⡅⢉⢀⡸⠀⠀⠀",
   "⠀⠀⠀⠸⣀⠑⠰⡀⠌⡀⢐⠅⡈⠈⢄⠁⠌⢰⠁⡀⠂⢡⡋⠂⠄⢄⡇⠀⠀⠀",
   "⠀⠀⠀⠀⡇⠐⠀⡪⠀⢂⠀⢣⠐⠀⠂⠐⡀⡸⠀⠄⠁⡜⠆⢈⠀⢮⠀⠀⠀⠀",
   "⠀⠀⠀⠀⠧⡈⠄⠐⡅⢀⠀⢸⠀⡁⠌⠠⠀⡇⠐⡈⢰⠍⠂⠄⢠⠓⠀⠀⠀⠀",
   "⠀⠀⠀⠀⠀⡇⢈⠀⢸⠀⡀⠈⡆⠐⡀⠂⢀⠇⠠⠐⡎⠆⢁⠂⢸⠀⠀⠀⠀⠀",
   "⠀⠀⠀⠀⠀⢇⠠⡀⠈⡆⠠⠐⡅⠐⠀⠂⢆⠁⢂⠎⢱⠀⠢⠀⡸⠀⠀⠀⠀⠀",
   "⠀⠀⠀⠀⠀⢧⠀⠌⡀⢸⠀⠂⢸⠀⠡⡀⠦⠀⡼⠀⡇⠠⡁⢀⠇⠀⠀⠀⠀⠀",
   "⠀⠀⠀⠀⠀⠀⡇⠐⠠⠀⡒⠀⠰⡀⠂⢠⠃⢠⠃⡪⠀⡐⠀⣸⠀⠀⠀⠀⠀⠀",
   "⠀⠀⠀⠀⠀⠀⠸⡀⠡⠀⠡⠊⡀⠕⢀⠸⢀⡝⠰⠈⢄⠐⣀⠇⠀⠀⠀⠀⠀⠀",
   "⠀⠀⠀⠀⠀⠀⠀⢻⡀⠂⡐⢀⠄⡀⠢⠀⡧⢀⠊⠐⠀⣘⠜⠀⠀⠀⠀⠀⠀⠀",
   "⠀⠀⠀⠀⠀⠀⠀⠀⠁⠙⠐⢢⡰⡠⣌⢜⢤⡠⡪⠪⠃⠈⠀⠀⠀⠀⠀⠀⠀⠀",
}
dashboard.section.header.opts.hl = "Function"

local random_games_list = {
   "<cmd>BlackJackNewGame<cr>",
   "<cmd>Tetris<cr>",
   ":e ~/.config/nvim/random_words.txt<cr>:lua require'keylab'.start()<cr>i",
}
math.randomseed(os.time())
local the_chosen_game = random_games_list[math.random(#random_games_list)]
dashboard.section.buttons.val = {
   dashboard.button("f", "Find file", "<cmd>Telescope find_files<cr>"),
   dashboard.button("e", "ranger", "<cmd>lua require('ranger-nvim').open(false)<cr>"),
   dashboard.button("n", "New file", "<cmd>ene <BAR> startinsert<cr>"),
   dashboard.button("o", "recently used files", "<cmd>Telescope oldfiles<cr>"),
   dashboard.button("r", "Restore session", "<cmd>SessionLoadLast<cr>"),
   dashboard.button("s", "find String", "<cmd>Telescope live_grep<cr>"),
   dashboard.button("h", "Help tags", "<cmd>Telescope help_tags<cr>"),
   dashboard.button("u", "hapOOn", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>"),
   dashboard.button("g", "Random Game", the_chosen_game),
   dashboard.button("q", "too lazy to :q XD", "<cmd>qa<cr>"),
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
