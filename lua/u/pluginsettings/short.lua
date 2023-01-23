-- comment
require("Comment").setup { ignore = "^$" } -- ignore blankline

-- lightbulb icon
require("nvim-lightbulb").setup { float = { enabled = true, text = "" } }

-- surround
require("nvim-surround").setup()

-- hlslens
require("hlslens").setup()

-- git conflict
require("git-conflict").setup()

-- renamer
require("inc_rename").setup()

-- winsep
require("colorful-winsep").setup()

-- cursorword
require("mini.cursorword").setup { delay = 600 }

-- animate
require("mini.animate").setup { cursor = { enable = false } }

-- chafa
require("chafa").setup()

-- todo comments
require("todo-comments").setup()
