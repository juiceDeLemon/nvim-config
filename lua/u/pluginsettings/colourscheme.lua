require("tokyonight").setup {
    style = "night",
    styles = { functions = { bold = true }, sidebars = "transparent", floats = "transparent" },
    transparent = true,
    dim_inactive = true,
    lualine_bold = true,
    on_highlights = function(hi, c)
        -- colours refers to here:
        -- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua
        hi.TreesitterContextBottom = { bold = true, underline = true }
        hi.CursorLineNr = { fg = c.fg }
        hi.LineNr = { fg = c.dark5 }
        hi.Pmenu = { fg = c.border_highlight }
        hi.IndentBlanklineSpaceChar = { fg = c.Whitespace }
        hi.CmpItemAbbrMatch = { fg = c.blue1, bold = true }
        hi.CmpItemMenu = { fg = c.comment, italic = true }
        hi.Visual = { bold = true, reverse = true }
        hi.TelescopePreviewLine = { bg = c.bg_visual }
        hi.TelescopeSelection = { bg = c.bg_visual }
        hi.TelescopeSelectionCaret = { bg = c.bg_visual }
        hi.EndOfBuffer = { fg = c.comment }
        hi.WinSeparator = { fg = c.comment }
    end,
}

vim.cmd.colorscheme "tokyonight"
