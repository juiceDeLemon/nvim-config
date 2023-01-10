-- comment
require("Comment").setup {
    ignore = "^$", -- ignore blanklines
}

-- animate
require("mini.animate").setup { cursor = { enable = false } }

-- lightbulb icon
require("nvim-lightbulb").setup {
    autocmd = { enabled = true },
}
vim.fn.sign_define("LightBulbSign", { text = "" })
