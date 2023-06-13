require "u.pluginsettings.ai"
require "u.pluginsettings.alpha"
require "u.pluginsettings.colorizer"
require "u.pluginsettings.colourscheme"
require "u.pluginsettings.completion"
require "u.pluginsettings.cursorword"
require "u.pluginsettings.dap" -- must be before treesitter.lua
require "u.pluginsettings.gitsigns"
require "u.pluginsettings.lsp"
require "u.pluginsettings.navbuddy"
require "u.pluginsettings.nullls"
require "u.pluginsettings.statuscolumn"
require "u.pluginsettings.statuslines"
require "u.pluginsettings.telescope"
require "u.pluginsettings.treesitter"
require "u.pluginsettings.ts-node-action"
require "u.pluginsettings.whichkey"

require("Comment").setup { ignore = "^$" } -- ignore blankline
require("git-conflict").setup {}
require("hlslens").setup()
require("lsp-inlayhints").setup()
require("neogen").setup { snippet_engine = "luasnip" }
require("mini.doc").setup()
require("nvim-surround").setup()
require("pets").setup()
require("ranger-nvim").setup { replace_netrw = true }
require("refactoring").setup()
require("todo-comments").setup { signs = false, highlight = { before = "fg", keyword = "bg" } }

-- require("flight").setup()
-- require("mini.jump").setup()
-- local hop = require "hop"
-- hop.setup()
-- local directions = require("hop.hint").HintDirection
-- vim.keymap.set(
--    "",
--    "f",
--    function() hop.hint_char1 { direction = directions.AFTER_CURSOR,  } end,
--    { remap = true }
-- )
-- vim.keymap.set(
--    "",
--    "F",
--    function() hop.hint_char1 { direction = directions.BEFORE_CURSOR,  } end,
--    { remap = true }
-- )
-- vim.keymap.set(
--    "",
--    "t",
--    function() hop.hint_char1 { direction = directions.AFTER_CURSOR,  hint_offset = -1 } end,
--    { remap = true }
-- )
-- vim.keymap.set(
--    "",
--    "T",
--    function() hop.hint_char1 { direction = directions.BEFORE_CURSOR,  hint_offset = 1 } end,
--    { remap = true }
-- )
