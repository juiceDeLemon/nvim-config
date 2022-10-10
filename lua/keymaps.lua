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

local keymap = vim.keymap.set -- shorten keymap function name

---------------
-- REMINDERS --
---------------
-- n: Display normal mode maps
-- i: Display insert mode maps
-- x: Display visual mode maps
-- c: Display command-line mode maps
-- o: Display operator pending mode maps (link: https://www.reddit.com/r/vim/comments/dx52ko/what_exactly_are_operator_keymappings/)
-- (no character): all mode

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
-- OTHER: 1.6 of link?

-------------------------------
-- NON-MODE-SPECIFIC KEYMAPS --
-------------------------------
-- space as leader key
keymap("", "<space>", "<Nop>", opts) -- reset
vim.g.mapleader = " " -- map
vim.g.maplocalleader = " " -- map

-- resize splits with arrows
keymap("", "<C-Up>", "<cmd>resize -2<cr>", opts)
keymap("", "<C-Down>", "<cmd>resize +2<cr>", opts)
keymap("", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- move line above / below
keymap("", "<C-j>", "<cmd>m .+1<cr>", opts)
keymap("", "<C-k>", "<cmd>m .-2<cr>", opts)

-------------------------
-- VISUAL MODE KEYMAPS --
-------------------------
-- continue to select text went indenting
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

----------------------------------------
-- OTHER KEYMAPS (PLUGINS AND OTHERS) --
----------------------------------------
-- tree
keymap({ "n", "x" }, "<leader>e", "<cmd>NvimTreeToggle<cr>", opts) -- e for explorer in vscode

-- renamer
-- if neovim version is 0.8
-- keymap({"n", "x"}, "<leader>r", function()
--     return ":IncRename " .. vim.fn.expand("<cword>")
-- end, { expr = true })
-- substitude
keymap({ "n", "x" }, "<leader>r", "<cmd>lua require(\"renamer\").rename()<cr>", opts) -- r for rename

-- dial
keymap("n", "<C-a>", require("dial.map").inc_normal(), opts)
keymap("n", "<C-x>", require("dial.map").dec_normal(), opts)
keymap("v", "<C-a>", require("dial.map").inc_visual(), opts)
keymap("v", "<C-x>", require("dial.map").dec_visual(), opts)
keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), opts)
keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), opts)

-- tab line and buffer related
-- previous
keymap({ "n", "x" }, "<leader>h", "<cmd>TablineBufferPrevious<cr>", opts) -- h for left in vim
-- next
keymap({ "n", "x" }, "<leader>l", "<cmd>TablineBufferNext<cr>", opts) -- l for right in vim
-- new
keymap({ "n", "x" }, "<leader>t", "<cmd>TablineTabNew<cr>", opts) -- t for conventional cmd-t / ctrl-t
-- close (doesn't have a plugin command)
keymap({ "n", "x" }, "<leader>w", "<cmd>Bdelete<cr>", opts) -- w for conventional cmd-w / ctrl-w
