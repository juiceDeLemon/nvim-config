-- comment
-- ignore blanklines
require("Comment").setup { ignore = "^$" }

-- animate
require("mini.animate").setup { cursor = { enable = false } }

-- lightbulb icon
require("nvim-lightbulb").setup { autocmd = { enabled = true } }
vim.fn.sign_define("LightBulbSign", { text = "" })

-- surround
require("nvim-surround").setup()

-- hlslens
require("hlslens").setup()
