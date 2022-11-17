-- ██╗███╗░░██╗██╗████████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██║████╗░██║██║╚══██╔══╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║██╔██╗██║██║░░░██║░░░░░░██║░░░░░██║░░░██║███████║
-- ██║██║╚████║██║░░░██║░░░░░░██║░░░░░██║░░░██║██╔══██║
-- ██║██║░╚███║██║░░░██║░░░██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝╚═╝░░╚══╝╚═╝░░░╚═╝░░░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
require "options"
require "plugins"
require "plugin-settings"
require "keymaps"
require "autocommands"
-- require"luasnip.loaders.from_vscode".lazy_load("")
if vim.fn.exists("g:neovide") == 1 then require "neovide" end
