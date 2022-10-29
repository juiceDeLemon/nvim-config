-- ░██╗░░░░░░░██╗██╗░░██╗██╗░█████╗░██╗░░██╗░░░░░░██╗░░██╗███████╗██╗░░░██╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ░██║░░██╗░░██║██║░░██║██║██╔══██╗██║░░██║░░░░░░██║░██╔╝██╔════╝╚██╗░██╔╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ░╚██╗████╗██╔╝███████║██║██║░░╚═╝███████║█████╗█████═╝░█████╗░░░╚████╔╝░░░░██║░░░░░██║░░░██║███████║
-- ░░████╔═████║░██╔══██║██║██║░░██╗██╔══██║╚════╝██╔═██╗░██╔══╝░░░░╚██╔╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ░░╚██╔╝░╚██╔╝░██║░░██║██║╚█████╔╝██║░░██║░░░░░░██║░╚██╗███████╗░░░██║░░░██╗███████╗╚██████╔╝██║░░██║
-- ░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝╚═╝░╚════╝░╚═╝░░╚═╝░░░░░░╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local wk = require "which-key"
-- 1 leader
wk.setup {
    plugins = { spelling = { enabled = true, suggestions = 25 } },
    icons = { breadcrumb = "", separator = ":", group = "*" },
    popup_mappings = { scroll_down = "<c-j>", scroll_up = "<c-k>" },
    window = { border = "single", winblend = 30 },
}
wk.register({
    g = {
        name = "Git",
        h = { "<cmd>Gitsigns prev_hunk<cr>", "Previous Hunk" },
        l = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
        p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
        g = { "<cmd>LazyGit<cr>", "Open LazyGit" },
    },
}, { mode = "n", prefix = "<leader>" })
wk.register({
    c = {
        name = "Conflict",
        c = { "<Plug>(git-conflict-ours)", "Accept Current" },
        i = { "<Plug>(git-conflict-theirs)", "Accept Incoming Change" },
        b = { "<Plug>(git-conflict-both)", "Accept Both" },
        n = { "<Plug>(git-conflict-none)", "Accept None" },
        h = { "<Plug>(git-conflict-prev-conflict)", "Previous Conflict" },
        l = { "<Plug>(git-conflict-next-conflict)", "Next Conflict" },
    },
}, { mode = "n", prefix = "<leader>g" })
wk.register({
    t = {
        name = "Tabs",
        h = { "<cmd>TablineBufferPrevious<cr>" },
        l = { "<cmd>TablineBufferNext<cr>" },
        t = { "<cmd>TablineTabNew<cr>" },
        w = { "<cmd>Bdelete<cr>" },
    },
}, { mode = "n", prefix = "<leader>" })
-- 2 leaders
wk.register({
    d = {
        name = "SUSSY DUCK",
        d = { "<cmd>lua require 'duck'.hatch('ඞ')<cr>" },
        c = { "<cmd>lua require 'duck'.cook()<cr>" },
    },
}, { mode = "n", prefix = "<leader><leader>" })
