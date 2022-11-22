-- ██╗███╗░░██╗██████╗░███████╗███╗░░██╗████████╗░░░░██████╗░██╗░░░░░░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██║████╗░██║██╔══██╗██╔════╝████╗░██║╚══██╔══╝░░░░██╔══██╗██║░░░░░░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║██╔██╗██║██║░░██║█████╗░░██╔██╗██║░░░██║░░░░░░░██████╦╝██║░░░░░░░░██║░░░░░██║░░░██║███████║
-- ██║██║╚████║██║░░██║██╔══╝░░██║╚████║░░░██║░░░░░░░██╔══██╗██║░░░░░░░░██║░░░░░██║░░░██║██╔══██║
-- ██║██║░╚███║██████╔╝███████╗██║░╚███║░░░██║░█████╗██████╦╝███████╗██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝╚═╝░░╚══╝╚═════╝░╚══════╝╚═╝░░╚══╝░░░╚═╝░╚════╝░╚═════╝░╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local indent_line = require "indent_blankline"

vim.g.indent_blankline_filetype_exclude = {
    "help",
    "packer",
    "neogitstatus",
    "Trouble",
    "text",
    "alpha",
}

vim.g.indent_blankline_char = "▏"

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
    show_current_context = true,
    show_current_context_start = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
