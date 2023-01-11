require("indent_blankline").setup {
    indent_blankline_char = "▏",
    indent_blankline_filetype_exclude = {
        "help",
        "Trouble",
        "text",
        "alpha",
    },
    indent_blankline_context_patterns = {
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
    },
}
