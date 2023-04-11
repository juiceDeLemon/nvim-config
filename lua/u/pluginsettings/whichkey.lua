local wk = require "which-key"

wk.setup {
   plugins = { spelling = { enabled = true, suggestions = 25 } },
   icons = { breadcrumb = "", separator = ":", group = "*" },
   popup_mappings = { scroll_down = "<c-j>", scroll_up = "<c-k>" },
   window = { border = "rounded" },
}
