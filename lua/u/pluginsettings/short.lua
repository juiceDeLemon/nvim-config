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

-- neogen
require("neogen").setup { snippet_engine = "luasnip" }

-- inlayhints
require("lsp-inlayhints").setup()

-- pets
require("pets").setup()

-- docs
require("mini.doc").setup()

-- refactoring
require("refactoring").setup()

-- flight
require("flight").setup()
-- require("mini.jump").setup()
