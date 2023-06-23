local opts = { noremap = true }

local map = vim.keymap.set -- abbreviation
---neat function to simplify mappings with description
---@param mapping string
---@param command string | function
---@param desc string
---@param mode? string | table
local map_d = function(mapping, command, desc, mode)
	local inner_opts = vim.tbl_deep_extend("force", {}, opts, { desc = desc } or {})
	if mode == nil then
		mode = { "n", "v" }
	end
	map(mode, mapping, command, inner_opts)
end

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
map("n", "<c-tab>", "<cmd>bp<cr>")

-- <leader>
-- neogen (a for annotation)
map_d("<leader>a", "V<cmd>Neogen<cr><esc>", "Neogen")

-- dap
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { noremap = true, desc = "Set Breakpoint" })
map(
	"n",
	"<leader>dc",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
	{ noremap = true, desc = "Set Condition Breakpoint" }
)
map("n", "<leader>d5", "<cmd>lua require'dap'.continue()<cr>", { noremap = true, desc = "Continue" })
map("n", "<leader>d10", "<cmd>lua require'dap'.step_over()<cr>", { noremap = true, desc = "Step Over" })
map("n", "<leader>d11", "<cmd>lua require'dap'.step_into()<cr>", { noremap = true, desc = "Step Into" })
map("n", "<leader>d12", "<cmd>lua require'dap'.step_out()<cr>", { noremap = true, desc = "Step Out" })
map("n", "<leader>dd", "<cmd>lua require'dapui'.toggle()<cr>", { noremap = true, desc = "Toggle UI" })

-- explorer
map_d("<leader>e", "<cmd>lua MiniFiles.open()<cr>", "Toggle Explorer")

-- telescope
map_d("<leader>fb", require("telescope.builtin").buffers, "Buffers")
map_d("<leader>fc", require("telescope").extensions.menufacture.grep_string, "Search Cursor String")
map_d("<leader>ff", require("telescope").extensions.menufacture.find_files, "Find Files")
map_d("<leader>fg", require("telescope").extensions.menufacture.git_files, "Find in Git Files")
map_d("<leader>fh", require("telescope.builtin").help_tags, "Help Menu")
map_d("<leader>fp", require("telescope").extensions.lazy.lazy, "Plugin Links")
map_d("<leader>fo", require("telescope.builtin").oldfiles, "Recent Files")
map_d("<leader>fq", "<cmd>TodoTelescope<cr>", "Todo-Comments")
map_d("<leader>fr", require("telescope.builtin").resume, "Resume Prompt")
map_d("<leader>fs", require("telescope").extensions.menufacture.live_grep, "Search String")
map_d("<leader>ft", "<cmd>Telescope<cr>", "Telescope Menu")

-- git
map_d("<leader>gb", "<cmd>lua require'gitsigns'.blame_line()<cr>", "View Blame")
-- conflict
map_d("<leader>gcc", "<Plug>(git-conflict-ours)", "Accept Current")
map_d("<leader>gci", "<Plug>(git-conflict-theirs)", "Accept Incoming Change")
map_d("<leader>gcb", "<Plug>(git-conflict-both)", "Accept Both")
map_d("<leader>gcn", "<Plug>(git-conflict-none)", "Accept None")
map_d("<leader>gch", "<Plug>(git-conflict-prev-conflict)", "Previous Conflict")
map_d("<leader>gcl", "<Plug>(git-conflict-next-conflict)", "Next Conflict")
-- signs
map_d("<leader>gd", "<cmd>Gitsigns diffthis<cr>", "Diff Current File")
map_d("<leader>gh", "<cmd>Gitsigns prev_hunk<cr>", "Previous Hunk")
map_d("<leader>gl", "<cmd>Gitsigns next_hunk<cr>", "Next Hunk")
map_d("<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk")
map_d("<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", "Restore Hunk")
map_d("<leader>gv", "<cmd>lua require'gitsigns'.select_hunk()<cr>", "Select Hunk")

-- harpoon
map_d("<leader>hq", "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File") -- q for queue file?
map_d("<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Menu") -- m for menu
map_d("<leader>ha", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon 1") -- home row in dvorak
map_d("<leader>ho", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon 2")
map_d("<leader>he", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon 3")
map_d("<leader>hu", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Harpoon 4")
map_d("<leader>hi", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "Harpoon 5")
map_d("<leader>hd", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "Harpoon 6")
map_d("<leader>hh", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", "Harpoon 7")
map_d("<leader>ht", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", "Harpoon 8")
map_d("<leader>hn", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", "Harpoon 9")
map_d("<leader>hs", "<cmd>lua require('harpoon.ui').nav_file(10)<cr>", "Harpoon 10")
-- qwerty version
-- map_d("<leader>ha", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon 1")
-- map_d("<leader>hs", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon 2")
-- map_d("<leader>hd", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon 3")
-- map_d("<leader>hf", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Harpoon 4")
-- map_d("<leader>hg", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "Harpoon 5")
-- map_d("<leader>hh", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "Harpoon 6")
-- map_d("<leader>hj", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", "Harpoon 7")
-- map_d("<leader>hk", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", "Harpoon 8")
-- map_d("<leader>hl", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", "Harpoon 9")
-- map_d("<leader>h;", "<cmd>lua require('harpoon.ui').nav_file(10)<cr>", "Harpoon 10")

-- ts-Node-action
map_d("<leader>n", "<cmd>NodeAction<cr>", "Trigger Node Action", "n")

-- <leader>p is mapped (markdown preview) in markdown
-- if mapping is needed, ensure it is useless for markdown

-- refactoring
-- stylua: ignore start
map_d("<leader>re", "<esc><cmd>lua require('refactoring').refactor('Extract Function')<cr>", "Extract Function", "v")
map_d("<leader>rf", "<esc><cmd>lua require('refactoring').refactor('Extract Function To File')<cr>", "Extract Function To File", "v")
map_d("<leader>rv", "<esc><cmd>lua require('refactoring').refactor('Extract Variable')<cr> ", "Extract Variable", "v")
map_d("<leader>ri", "<esc><cmd>lua require('refactoring').refactor('Inline Variable')<cr>", "Inline Variable", "v")
map_d("<leader>ri", "<Cmd>lua require('refactoring').refactor('Inline Variable')<cr>", "Inline Variable", "n")
map_d("<leader>rb", "<cmd>lua require('refactoring').refactor('Extract Block')<cr>", "Extract Block", "n")
map_d("<leader>rbf", "<cmd>lua require('refactoring').refactor('Extract Block To File')<cr>", "Extract Block to File", "n")
map_d("<leader>rp", "<cmd>lua require('refactoring').debug.printf({below = true})<cr>", "Add Empty Print Statement", "n")
map_d("<leader>rv", "<cmd>lua require('refactoring').debug.print_var({ normal = true })<cr>", "Add Print Statement on Variable", "n")
map_d("<leader>rpv", "<cmd>lua require('refactoring').debug.print_var({})<cr>", "Add Print Statement on Selection", "v")
map_d("<leader>rc", "<cmd>lua require('refactoring').debug.cleanup{}<cr>", "Clean Up Generated Prints", "n")
-- stylua: ignore end

map_d("<leader>u", "<cmd>UndotreeToggle<cr><c-w>h", "Toggle Undo Tree")

-- <leader><leader> (useless things)
-- print alphabet
map_d("<leader><leader>a", "<cmd>lua print'abcdefghijklmnopqrstuvwxyz'<cr>", "alphabet")

-- blackjack
map_d("<leader><leader>b", "<cmd>BlackJackNewGame<cr>", "BlackJack Addiction")

-- cellular automaton
map_d("<leader><leader>cc", "<cmd>CellularAutomaton game_of_life<cr>", "Conway Game of Life") -- c for conway.
map_d("<leader><leader>cr", "<cmd>CellularAutomaton make_it_rain<cr>", "Your code is raining")

-- catppuccin palette
map_d("<leader><leader>h", "<cmd>lua pp(require'catppuccin.palettes'.get_palette'mocha')<cr>", "Get Palette")

-- toggle mouse
map(
	"n",
	"<leader><leader>m",
	':exec &mouse!=""? "set mouse=" : "set mouse=a"<cr>:set mouse?<cr>',
	{ desc = "Toggle Mouse", noremap = true }
)

-- lua document (hence the lua)
map_d("<leader><leader>l", "<cmd>lua MiniDoc.generate()<cr>", "Generate Docs for Plugin")

-- inputs the SUS symbol
map_d("<leader><leader>s", "iඞ<esc>", "SUS", "n")

-- tetris
map_d("<leader><leader>t", "<cmd>Tetris<cr>", "Tetris Addiction")

-- :Sexplorer the SPLIT explorer
map("n", "<leader><leader>69", vim.cmd.Sex, { noremap = true, desc = "Hmmm sex" })
