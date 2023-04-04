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

-- winsep
require("colorful-winsep").setup()

-- animate
require("mini.animate").setup { cursor = { enable = false } }

-- todo comments
require("todo-comments").setup { highlight = { before = "fg", keyword = "bg" } }

-- persisted
require("persisted").setup { use_git_branch = true, autosave = false }

-- navbuddy
require("nvim-navbuddy").setup {}

-- flight
require("flight").setup()
-- require("mini.jump").setup()
