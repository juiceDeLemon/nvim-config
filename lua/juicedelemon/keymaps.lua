local opts = { noremap = true }

local map = vim.keymap.set -- abbreviation

-- n = normal
-- i = insert
-- v = visual and select
-- s = select
-- x = visual
-- c = command-line
-- o = operator pending

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

-- put new line above/below
map("n", "<m-o>", "<esc>o<esc>") -- above
map("n", "<m-O>", "<esc>O<esc>") -- below
map("i", "<m-o>", "<esc>o") -- above
map("i", "<m-O>", "<esc>O") -- below
map("v", "<m-o>", "<esc>o<esc>gv") -- above
map("v", "<m-O>", "<esc>O<esc>gv") -- below

-- cycle buffers
map("n", "<tab>", "<cmd>bn<cr>")
map("n", "<s-tab>", "<cmd>bp<cr>")

-- centre when G
map("n", "G", "Gzz")

-- fuck you evil devil
map("n", "q:", "<nop>")

-- semi-useless things
-- print alphabet
map("n", "<leader><leader>a", function()
	print "abcdefghijklmnopqrstuvwxyz"
end, { desc = "alphabet" })

-- toggle mouse
map(
	"n",
	"<leader><leader>m",
	':exec &mouse!=""? "set mouse=" : "set mouse=a"<cr>:set mouse?<cr>',
	{ desc = "Toggle Mouse", noremap = true }
)

map("n", "<leader><leader>n", vim.cmd.nohlsearch, { noremap = true, desc = "NOH" })

-- <leader><leader>p is mapped (markdown preview) in markdown
-- if mapping is needed, ensure it is useless for markdown

-- inputs the SUS symbol
map("n", "<leader><leader>s", "iඞ<esc>", { desc = "SUS" })

-- auto fix spelling
map("n", "<leader><leader>z", "z=1<cr>", { desc = "Auto fix Spelling" })

-- :Sexplorer the SPLIT explorer
map("n", "<leader><leader>69", vim.cmd.Sex, { noremap = true, desc = "Hmmm sex" })
