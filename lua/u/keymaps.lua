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

-- navigate splits
map("n", "<up>", "<c-w>k", opts)
map("n", "<down>", "<c-w>j", opts)
map("n", "<left>", "<c-w>h", opts)
map("n", "<right>", "<c-w>l", opts)

-- continue to select text went indenting
map("x", "<", "<gv", opts)
map("x", ">", ">gv", opts)

-- replace paste without occupying paste register
map("x", "p", '"_dP')

-- system clipboard yanking
map("n", "Y", "<nop>")
map({ "n", "x" }, "+y", '"+y')
map("n", "+Y", '"+yy')
map("v", "Y", '"+y')
map("n", "D", "<nop>")
map({ "n", "x" }, "+d", '"+d')
map("n", "+D", '"+dd')
map("v", "D", '"+d')
map("n", "+p", '"+p')
map("n", "+P", '"+P')

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

-- useless things
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

-- <leader><leader>p is mapped (markdown preview) in markdown
-- if mapping is needed, ensure it is useless for markdown


-- inputs the SUS symbol
map("n", "<leader><leader>s", "iඞ<esc>", { desc = "SUS" })

-- :Sexplorer the SPLIT explorer
map("n", "<leader><leader>69", vim.cmd.Sex, { noremap = true, desc = "Hmmm sex" })
