-- ░██╗░░░░░░░██╗██╗░░██╗██╗░█████╗░██╗░░██╗░░░░░░██╗░░██╗███████╗██╗░░░██╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ░██║░░██╗░░██║██║░░██║██║██╔══██╗██║░░██║░░░░░░██║░██╔╝██╔════╝╚██╗░██╔╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ░╚██╗████╗██╔╝███████║██║██║░░╚═╝███████║█████╗█████═╝░█████╗░░░╚████╔╝░░░░██║░░░░░██║░░░██║███████║
-- ░░████╔═████║░██╔══██║██║██║░░██╗██╔══██║╚════╝██╔═██╗░██╔══╝░░░░╚██╔╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ░░╚██╔╝░╚██╔╝░██║░░██║██║╚█████╔╝██║░░██║░░░░░░██║░╚██╗███████╗░░░██║░░░██╗███████╗╚██████╔╝██║░░██║
-- ░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝╚═╝░╚════╝░╚═╝░░╚═╝░░░░░░╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local wk = require "which-key"
local i = require "icons"

wk.setup {
    plugins = { spelling = { enabled = true, suggestions = 25 } },
    icons = { breadcrumb = i.ui.DivLineRight, separator = ":", group = "*" },
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
        d = {
            name = "SUSSY DUCK",
            d = {
                "<cmd>lua math.randomseed(os.time()); require'duck'.hatch('ඞ', math.random(1, 10))<cr>",
                "Join Lobby",
            },
            k = { "<cmd>lua require'duck'.cook()<cr>", "Eject Crewmate" },
        },
        m = { "<cmd>TSJToggle<cr>", "Toggle TSJ node" },
    },
}, { mode = "n", prefix = "<leader>" })

wk.register({
    s = {
        name = "Screenshot",
        c = {
            name = "To Clipboard",
            s = {
                "<cmd>lua require'silicon'.visualise_cmdline{ to_clip = true }<cr>",
                "Generate Selection",
            },
            b = {
                "<cmd>lua require'silicon'.visualise_cmdline{ to_clip = true, show_buf = true }<cr>",
                "Whole Buffer (highlighted selected)",
            },
        },
        s = { "<cmd>lua require'silicon'.visualise_cmdline{}<cr>", "Generate Selection" },
        b = {
            "<cmd>lua require'silicon'.visualise_cmdline{ show_buf = true }<cr>",
            "Whole Buffer (highlighted selected)",
        },
    },
}, { mode = "v", prefix = "<leader>" })
