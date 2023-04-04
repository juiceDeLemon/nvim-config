-- lazy.nvim things
-- space as leader key
vim.keymap.set("", "<space>", "<nop>", { noremap = true, silent = true }) -- reset
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require "u.plugins"
require "u.pluginsettings"
require "u.options"
require "u.keymaps"
require "u.autocmds"
require "u.misc"
