local ll = require "lualine"
local noice = require "noice"
local b = require "barbecue"

ll.setup {
    options = {
        globalstatus = true,
        refresh = { statusline = 250 },
        ignore_focus = { "help", "NvimTree", "alpha" },
    },
    sections = {
        lualine_a = { { "mode", fmt = function(str) return "ඞ " .. str end } },
        lualine_b = { "filename", "filetype" },
        lualine_c = { "branch", "diff", "diagnostics" },
        lualine_x = {
            { noice.api.status.mode.get, cond = noice.api.status.mode.has },
            "filesize",
            "encoding",
        },
        lualine_y = { "location" },
        lualine_z = { "progress" },
    },
    inactive_sections = { lualine_a = { "filename" }, lualine_z = { "progress" } },
}
b.setup {
    modifiers = { dirname = ":~" },
    symbols = { separator = "", default_context = "..." },
    kinds = {
        Array = "",
        Boolean = "蘒",
        Class = "",
        Color = "",
        Constant = "",
        Constructor = "",
        Enum = "",
        EnumMember = "",
        Event = "",
        Field = "",
        File = "",
        Folder = "",
        Function = "",
        Interface = "",
        Key = "",
        Keyword = "",
        Method = "",
        Module = "",
        Namespace = "",
        Null = "ﳠ",
        Number = "",
        Object = "",
        Operator = "",
        Package = "",
        Property = "",
        Reference = "",
        Snippet = "",
        String = "",
        Struct = "",
        Text = "",
        TypeParameter = "",
        Unit = "",
        Value = "",
        Variable = "",
    },
}
