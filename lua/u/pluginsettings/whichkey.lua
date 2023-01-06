local wk = require "which-key"

wk.setup {
    plugins = { spelling = { enabled = true, suggestions = 25 } },
    icons = { breadcrumb = "", separator = ":", group = "*" },
    popup_mappings = { scroll_down = "<c-j>", scroll_up = "<c-k>" },
    window = { border = "single", winblend = 30 },
}

wk.register({
    e = { "<cmd>NvimTreeToggle<cr>", "Toggle Tree" },
    g = {
        name = "Git",
        b = { "<cmd>lua require'gitsigns'.blame_line()<cr>", "View Blame" },
        c = {
            name = "Conflict",
            c = { "<Plug>(git-conflict-ours)", "Accept Current" },
            i = { "<Plug>(git-conflict-theirs)", "Accept Incoming Change" },
            b = { "<Plug>(git-conflict-both)", "Accept Both" },
            n = { "<Plug>(git-conflict-none)", "Accept None" },
            h = { "<Plug>(git-conflict-prev-conflict)", "Previous Conflict" },
            l = { "<Plug>(git-conflict-next-conflict)", "Next Conflict" },
        },
        g = { "<cmd>LazyGit<cr>", "Open LazyGit" },
        h = { "<cmd>Gitsigns prev_hunk<cr>", "Previous Hunk" },
        l = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
        p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
        r = { "<cmd>Gitsigns reset_hunk<cr>", "Restore Hunk" },
        v = { "<cmd>lua require'gitsigns'.select_hunk()<cr>", "Select Hunk" },
    },
    r = { ":IncRename ", "Rename Element" },
    s = {
        name = "Screenshot",
        c = {
            name = "To Clipboard",
            s = {
                "<cmd>lua require'silicon'.visualise_cmdline{ to_clip = true }<cr>",
                "Current Line",
            },
            v = {
                "<cmd>lua require'silicon'.visualise_cmdline{ to_clip = true, visible = true }<cr>",
                "Visible Area",
            },
        },
        v = {
            "<cmd>lua require'silicon'.visualise_cmdline{ to_clip = ture, visible = true }<cr>",
            "Visible Area",
        },
    },
    t = {
        name = "Tabs",
        t = { "<cmd>$tabnew<cr>", "New Tab" },
        w = { "<cmd>tabclose<cr>", "Close Tab" },
        h = { "gT", "Previous Tab" },
        l = { "gt", "Next Tab" },
        m = {
            name = "Move",
            h = { "<cmd>-tabmove<cr>", "Previous Position" },
            l = { "<cmd>+tabmove<cr>", "Next Position" },
        },
        ["1"] = { "1gt", "Goto Tab 1" },
        ["2"] = { "2gt", "Goto Tab 2" },
        ["3"] = { "3gt", "Goto Tab 3" },
        ["4"] = { "4gt", "Goto Tab 4" },
        ["5"] = { "5gt", "Goto Tab 5" },
        ["6"] = { "6gt", "Goto Tab 6" },
        ["7"] = { "7gt", "Goto Tab 7" },
        ["8"] = { "8gt", "Goto Tab 8" },
        ["9"] = { "9gt", "Goto Tab 9" },
    },
    ["<leader>"] = {
        name = "leader",
        m = { "<cmd>TSJToggle<cr>", "Toggle TSJ node" },
    },
}, { mode = "n", prefix = "<leader>" })

