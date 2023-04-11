-- comment
require("Comment").setup { ignore = "^$" } -- ignore blankline

-- lightbulb icon
require("nvim-lightbulb").setup { float = { enabled = true, text = "" } }

-- surround
require("nvim-surround").setup()

-- hlslens
require("hlslens").setup()

-- git conflict
require("git-conflict").setup {}

-- todo comments
require("todo-comments").setup { highlight = { before = "fg", keyword = "bg" } }

-- persisted
require("persisted").setup { use_git_branch = true, autosave = false }

-- navbuddy
require("nvim-navbuddy").setup()

-- neogen
require("neogen").setup { snippet_engine = "luasnip" }

-- inlayhints
require("lsp-inlayhints").setup()

-- flight
require("flight").setup()
-- require("mini.jump").setup()
