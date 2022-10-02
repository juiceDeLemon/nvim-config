-- ██╗███╗░░██╗██████╗░███████╗███╗░░██╗████████╗░░░░██████╗░██╗░░░░░░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██║████╗░██║██╔══██╗██╔════╝████╗░██║╚══██╔══╝░░░░██╔══██╗██║░░░░░░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║██╔██╗██║██║░░██║█████╗░░██╔██╗██║░░░██║░░░░░░░██████╦╝██║░░░░░░░░██║░░░░░██║░░░██║███████║
-- ██║██║╚████║██║░░██║██╔══╝░░██║╚████║░░░██║░░░░░░░██╔══██╗██║░░░░░░░░██║░░░░░██║░░░██║██╔══██║
-- ██║██║░╚███║██████╔╝███████╗██║░╚███║░░░██║░█████╗██████╦╝███████╗██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝╚═╝░░╚══╝╚═════╝░╚══════╝╚═╝░░╚══╝░░░╚═╝░╚════╝░╚═════╝░╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

local status_ok, indent_line = pcall(require, "indent_blankline")
if not status_ok then
    return
end

local colours = require("colours")

-- https://neovim.io/doc/user/api.html
vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", {fg=colours.red, nocombine=true})
vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", {fg=colours.yellow, nocombine=true})
vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", {fg=colours.green, nocombine=true})
vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", {fg=colours.teal, nocombine=true})
vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", {fg=colours.blue, nocombine=true})
vim.api.nvim_set_hl(0, "IndentBlanklineIndent6", {fg=colours.purple, nocombine=true})

-- vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
    "help",
    "startify",
    "packer",
    "neogitstatus",
    "Trouble",
    "text",
    "alpha"
}

vim.g.indent_blankline_char = "▏" -- thin left
-- vim.g.indent_blankline_char = "▎" -- thick left

vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_use_treesitter_scope = 1
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
}

indent_line.setup {
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}

