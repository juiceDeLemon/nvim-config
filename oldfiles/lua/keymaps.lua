-- ██╗░░██╗███████╗██╗░░░██╗███╗░░░███╗░█████╗░██████╗░░██████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██║░██╔╝██╔════╝╚██╗░██╔╝████╗░████║██╔══██╗██╔══██╗██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- █████═╝░█████╗░░░╚████╔╝░██╔████╔██║███████║██████╔╝╚█████╗░░░░██║░░░░░██║░░░██║███████║
-- ██╔═██╗░██╔══╝░░░░╚██╔╝░░██║╚██╔╝██║██╔══██║██╔═══╝░░╚═══██╗░░░██║░░░░░██║░░░██║██╔══██║
-- ██║░╚██╗███████╗░░░██║░░░██║░╚═╝░██║██║░░██║██║░░░░░██████╔╝██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═════╝░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
------------------------
-- COMMONLY USED CODE --
------------------------
local opts = { noremap = true, silent = true }

-- idk what this does
-- local term_opts = { silent = true }

local keymap = vim.keymap.set

---------------
-- REMINDERS --
---------------
-- n = normal mode
-- i = insert mode
-- v = visual and select mode
-- s = select mode
-- x = visual mode
-- c = command-line mode
-- o = operator pending mode

-- put character in the place of *
-- CTRL = <c-*> (alt = a, meta = m)
-- FUNCTION = <F*>
-- ESCAPE = <ESC>
-- RETURN(ENTER) = <cr>
-- SPACE = <space>
-- ENTER COMMAND = <cmd>
-- LEADER = <leader>
-- TAB = <tab> NOTE: you can't use modifier keys like ctrl, alt and meta
-- NO MAPPING = <nop>

-------------------------------
-- NON-MODE-SPECIFIC KEYMAPS --
-------------------------------
-- space as leader key
keymap("", "<space>", "<Nop>", opts) -- reset
vim.g.mapleader = " " -- map
vim.g.maplocalleader = " " -- map

-- code 
keymap("", "<M-cr>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

-- resize splits with arrows
keymap("", "<C-Up>", "<cmd>resize -2<cr>", opts)
keymap("", "<C-Down>", "<cmd>resize +2<cr>", opts)
keymap("", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-------------------------
-- VISUAL MODE KEYMAPS --
-------------------------
-- continue to select text went indenting
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

----------------------------------------
-- OTHER KEYMAPS (PLUGINS AND OTHERS) --
----------------------------------------
-- dial
keymap("n", "<C-a>", require"dial.map".inc_normal(), opts)
keymap("n", "<C-x>", require"dial.map".dec_normal(), opts)
keymap("v", "<C-a>", require"dial.map".inc_visual(), opts)
keymap("v", "<C-x>", require"dial.map".dec_visual(), opts)
keymap("v", "g<C-a>", require"dial.map".inc_gvisual(), opts)
keymap("v", "g<C-x>", require"dial.map".dec_gvisual(), opts)

-- move.nvim
keymap({ "n", "i" }, "<C-j>", "<cmd>MoveLine(1)<CR>", opts)
keymap({ "n", "i" }, "<C-k>", "<cmd>MoveLine(-1)<CR>", opts)
keymap({ "n", "i" }, "<C-h>", "<cmd>MoveHChar(-1)<CR>", opts)
keymap({ "n", "i" }, "<C-l>", "<cmd>MoveHChar(1)<CR>", opts)
keymap("v", "<C-j>", "<cmd>MoveBlock(1)<CR>", opts)
keymap("v", "<C-k>", "<cmd>MoveBlock(-1)<CR>", opts)
keymap("v", "<C-h>", "<cmd>MoveHBlock(-1)<CR>", opts)
keymap("v", "<C-l>", "<cmd>MoveHBlock(1)<CR>", opts)
