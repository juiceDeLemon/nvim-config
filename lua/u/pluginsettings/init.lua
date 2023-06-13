require "u.pluginsettings.ai"
require "u.pluginsettings.alpha"
require "u.pluginsettings.colorizer"
require "u.pluginsettings.colourscheme"
require "u.pluginsettings.completion"
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
require("fidget").setup { text = { spinner = "bouncing_bar" } }
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
