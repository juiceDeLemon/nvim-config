require"tokyonight".setup {
    style = "night",
    transparent = true,
    dim_inactive = true,
    on_highlights = function(hi, c)
        -- colours refers to here:
        -- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua
        hi.TreesitterContextBottom = { bold = true, underline = true }
        hi.CursorLineNr = { fg = c.fg }
        hi.LineNr = { fg = c.dark5 }
    end
}

vim.cmd [[ colorscheme tokyonight-night ]]
