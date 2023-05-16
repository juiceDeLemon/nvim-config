local opts = { noremap = true }

local map = vim.keymap.set -- abbreviation
---neat function to simplify mappings with description
---@param mapping string
---@param command string
---@param desc string
---@param mode string | table | nil
local map_d = function(mapping, command, desc, mode)
   opts = vim.tbl_deep_extend("force", {}, opts, { desc = desc } or {})
   if mode == nil then mode = { "n", "v" } end
   map(mode, mapping, command, opts)
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

-- ranger
map_d("<leader>e", "<cmd>lua require('ranger-nvim').open(true)<cr>", "Toggle Explorer")

-- telescope
map_d("<leader>fb", "<cmd>Telescope buffers<cr>", "Buffers")
map_d("<leader>fc", "<cmd>Telescope grep_string<cr>", "Search Cursor String")
map_d("<leader>ff", "<cmd>Telescope find_files<cr>", "Find Files")
map_d("<leader>fh", "<cmd>Telescope help_tags<cr>", "Help Menu")
map_d("<leader>fp", "<cmd>Telescope lazy<cr>", "Plugin Links")
map_d("<leader>fo", "<cmd>Telescope oldfiles<cr>", "Recent Files")
map_d("<leader>fq", "<cmd>TodoTelescope<cr>", "Todo-Comments")
map_d("<leader>fr", "<cmd>Telescope resume<cr>", "Resume Prompt")
map_d("<leader>fs", "<cmd>Telescope live_grep<cr>", "Search String")
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

map_d("<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File")
map_d("<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Menu")

-- ts-Node-action
map_d("<leader>n", "<cmd>NodeAction<cr>", "Trigger Node Action", "n")

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

-- persisted
map_d("<leader>ss", "<cmd>SessionSave<cr>", "Save Session")
map_d("<leader>st", "<cmd>Telescope persisted<cr>", "Telescope")

-- silicon
--    c = {
--       name = "To Clipboard",
--       s = {
--          "<cmd>lua require'silicon'.visualise_cmdline{ to_clip = true }<cr>",
--          "Current Line",
--       },
--       v = {
--          "<cmd>lua require'silicon'.visualise_cmdline{ to_clip = true, visible = true }<cr>",
--          "Visible Area",
--       },
--    },
--    v = {
--       "<cmd>lua require'silicon'.visualise_cmdline{ to_clip = ture, visible = true }<cr>",
--       "Visible Area",
--    },
-- },

map_d("<leader>u", "<cmd>UndotreeToggle<cr><c-w>h", "Toggle Undo Tree")

-- <leader><leader> (useless things)
-- print alphabet
map_d("<leader><leader>a", "<cmd>lua print'abcdefghijklmnopqrstuvwxyz'<cr>", "alphabet")

-- blackjack
map_d("<leader><leader>b", "<cmd>BlackJackNewGame<cr>", "BlackJack Addiction")

-- pets
map_d("<leader><leader>pd", "<cmd>PetsKillAll<cr>", "please don't kill me :(")
map_d("<leader><leader>pp", ":PetsNewCustom crab red ", "OMFG IT'S A CRAB!!!!")
map_d("<leader><leader>pr", ":PetsNew ", "Random Pet")

-- lua document (hence the lua)
map_d("<leader><leader>l", "<cmd>lua MiniDoc.generate()<cr>", "Generate Docs for Plugin")

-- inputs the SUS symbol
map_d("<leader><leader>s", "iඞ<esc>", "SUS", "n")

-- tetris
map_d("<leader><leader>t", "<cmd>Tetris<cr>", "Tetris Addiction")
