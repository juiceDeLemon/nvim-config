require("tokyonight").setup {
    style = "night",
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
    end,
}

vim.cmd [[ colorscheme tokyonight ]]
