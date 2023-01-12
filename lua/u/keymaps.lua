local opts = { noremap = true, silent = true }

local map = vim.keymap.set

-- n = normal mode
-- i = insert mode
-- v = visual and select mode
-- s = select mode
-- x = visual mode
-- c = command-line mode
-- o = operator pending mode

-- space as leader key
map("", "<space>", "<nop>", opts) -- reset
vim.g.mapleader = " " -- map
vim.g.maplocalleader = " " -- map

-- resize splits with arrows
map("", "<C-Up>", "<cmd>resize -2<cr>", opts)
map("", "<C-Down>", "<cmd>resize +2<cr>", opts)
map("", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
map("", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- continue to select text went indenting
map("x", "<", "<gv", opts)
map("x", ">", ">gv", opts)

-- replace paste without occupying paste register
map("x", "p", '"_dP')

-- system clipboard yanking
map("n", "Y", '"+y')
map("n", "<c-y>", '"+yy')
map("n", "D", '"+d')
map("n", "<c-d>", '"+dd')
map("v", "Y", '"+y')
map("v", "D", '"+d')

-- dial
-- keymap("n", "<C-a>", require"dial.map".inc_normal(), opts)
-- keymap("n", "<C-x>", require"dial.map".dec_normal(), opts)
-- keymap("v", "<C-a>", require"dial.map".inc_visual(), opts)
-- keymap("v", "<C-x>", require"dial.map".dec_visual(), opts)
-- keymap("v", "g<C-a>", require"dial.map".inc_gvisual(), opts)
-- keymap("v", "g<C-x>", require"dial.map".dec_gvisual(), opts)

-- move.nvim
map({ "n", "i" }, "<C-j>", "<cmd>MoveLine(1)<CR>", opts)
map({ "n", "i" }, "<C-k>", "<cmd>MoveLine(-1)<CR>", opts)
map({ "n", "i" }, "<C-h>", "<cmd>MoveHChar(-1)<CR>", opts)
map({ "n", "i" }, "<C-l>", "<cmd>MoveHChar(1)<CR>", opts)
map("v", "<C-j>", "<cmd>MoveBlock(1)<CR>", opts)
map("v", "<C-k>", "<cmd>MoveBlock(-1)<CR>", opts)
map("v", "<C-h>", "<cmd>MoveHBlock(-1)<CR>", opts)
map("v", "<C-l>", "<cmd>MoveHBlock(1)<CR>", opts)
