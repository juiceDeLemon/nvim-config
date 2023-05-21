require "u.pluginsettings.ai"
require "u.pluginsettings.alpha"
require "u.pluginsettings.colorizer"
require "u.pluginsettings.colourscheme"
require "u.pluginsettings.completion"
require "u.pluginsettings.cursorword"
require "u.pluginsettings.gitsigns"
require "u.pluginsettings.hlchunk"
require "u.pluginsettings.lsp"
require "u.pluginsettings.navbuddy"
require "u.pluginsettings.nullls"
require "u.pluginsettings.scrollbar"
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
require("persisted").setup { use_git_branch = true, autosave = false }
require("pets").setup()
require("ranger-nvim").setup { replace_netrw = true }
require("refactoring").setup()
require("todo-comments").setup { highlight = { before = "fg", keyword = "bg" } }

require("flight").setup()
-- require("mini.jump").setup()
