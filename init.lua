-- lazy.nvim shenanigans
-- space as leader key
vim.keymap.set("", " ", "<nop>", { noremap = true, silent = true }) -- reset
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require "juicedelemon.lazy"
require "juicedelemon.options"
require "juicedelemon.keymaps"
require "juicedelemon.autocmds"
require "juicedelemon.modules"
