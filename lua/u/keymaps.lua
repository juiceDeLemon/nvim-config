local opts = { noremap = true }

local map = vim.keymap.set -- abbreviation
local map_d = function(mapping, command, desc, mode) -- map with desc
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
map("n", "<m-k>", "<cmd>call append(line('.') - 1, repeat([''], v:count1))<cr>") -- above
map("n", "<m-j>", "<cmd>call append(line('.'), repeat([''], v:count1))<cr>") -- below

-- <leader>
-- neogen (a for annotation)
map_d("<leader>a", "V<cmd>Neogen<cr>", "Neogen")

-- nvim tree
map_d("<leader>e", "<cmd>NvimTreeToggle<cr>", "Toggle Explorer")

-- telescope
map_d("<leader>fc", "<cmd>Telescope grep_string<cr>", "Search Cursor String")
map_d("<leader>ff", "<cmd>Telescope find_files<cr>", "Find Files")
map_d("<leader>fh", "<cmd>Telescope help_tags<cr>", "Help Menu")
map_d("<leader>fp", "<cmd>Telescope lazy<cr>", "Plugin Links")
map_d("<leader>fo", "<cmd>Telescope oldfiles<cr>", "Recent Files")
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
map_d("<leader>gh", "<cmd>Gitsigns prev_hunk<cr>", "Previous Hunk")
map_d("<leader>gl", "<cmd>Gitsigns next_hunk<cr>", "Next Hunk")
map_d("<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk")
map_d("<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", "Restore Hunk")
map_d("<leader>gv", "<cmd>lua require'gitsigns'.select_hunk()<cr>", "Select Hunk")

-- ts-Node-action
map_d("<leader>n", "<cmd>NodeAction<cr>", "Trigger Node Action", "n")

-- navbuddy
map_d("<leader>o", "<cmd>Navbuddy<cr>", "Navbuddy")

-- persisted
map_d("<leader>rr", "<cmd>SessionSave<cr>", "Save Session")
map_d("<leader>rt", "<cmd>Telescope persisted<cr>", "Telescope")

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
map_d("<leader><leader>b", "<cmd>BlackJackNewGame<cr>", "BlackJack Addiction")
map_d("<leader><leader>t", "<cmd>Tetris<cr>", "Tetris Addiction")
map_d("<leader><leader>a", "<cmd>lua print'abcdefghijklmnopqrstuvwxyz'<cr>", "alphabet")
