require "u.pluginsettings.alpha"
require "u.pluginsettings.colorizer"
require "u.pluginsettings.colourscheme"
require("Comment").setup { ignore = "^$" } -- ignore blankline
require "u.pluginsettings.completion"
require "u.pluginsettings.cursorword"
require "u.pluginsettings.gitsigns"
require("git-conflict").setup {}
require("hlslens").setup()
require "u.pluginsettings.indentline"
require "u.pluginsettings.lsp"
require("lsp-inlayhints").setup()
require "u.pluginsettings.navbuddy"
require("neogen").setup { snippet_engine = "luasnip" }
require "u.pluginsettings.move"
require("mini.doc").setup()
require "u.pluginsettings.nullls"
require "u.pluginsettings.nvimtree"
require("nvim-surround").setup()
require("nvim-lightbulb").setup { float = { enabled = true, text = "" } }
require("persisted").setup { use_git_branch = true, autosave = false }
require("pets").setup()
require("refactoring").setup()
require "u.pluginsettings.scrollbar"
require "u.pluginsettings.statuslines"
require "u.pluginsettings.telescope"
require("todo-comments").setup { highlight = { before = "fg", keyword = "bg" } }
require "u.pluginsettings.treesitter"
require "u.pluginsettings.ts-node-action"
require "u.pluginsettings.whichkey"

require("flight").setup()
-- require("mini.jump").setup()
