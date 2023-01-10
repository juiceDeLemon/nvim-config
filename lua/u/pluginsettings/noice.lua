require("noice").setup {
    messages = { view_search = false },
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },

    presets = { inc_rename = true, lsp_doc_border = true },
}

require("notify").setup { stages = "slide", background_colour = nil }
