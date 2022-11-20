-- ░█████╗░░█████╗░██╗░░░░░░█████╗░██████╗░░██████╗░█████╗░██╗░░██╗███████╗███╗░░░███╗███████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔══██╗██╔══██╗██║░░░░░██╔══██╗██╔══██╗██╔════╝██╔══██╗██║░░██║██╔════╝████╗░████║██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║░░╚═╝██║░░██║██║░░░░░██║░░██║██████╔╝╚█████╗░██║░░╚═╝███████║█████╗░░██╔████╔██║█████╗░░░░░██║░░░░░██║░░░██║███████║
-- ██║░░██╗██║░░██║██║░░░░░██║░░██║██╔══██╗░╚═══██╗██║░░██╗██╔══██║██╔══╝░░██║╚██╔╝██║██╔══╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ╚█████╔╝╚█████╔╝███████╗╚█████╔╝██║░░██║██████╔╝╚█████╔╝██║░░██║███████╗██║░╚═╝░██║███████╗██╗███████╗╚██████╔╝██║░░██║
-- ░╚════╝░░╚════╝░╚══════╝░╚════╝░╚═╝░░╚═╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local onedark = require "onedark"
local c = require "colours"

onedark.setup {
    functionStyle = "underline",
    variableStyle = "bold",
    transparent = not require "neovide",
}

-- custom highlights must be put after setup function
-- this overrides colourscheme default
-- otherwise the setup function will override the custom settings
local highlights = {
    ------------
    -- NATIVE --
    ------------
    -- change split separator colour
    VertSplit = { fg = c.comment },
    -- matching parenthesis (default plugin)
    MatchParen = { bg = c.hl, italic = true, bold = true },
    -- change search highlight background colour
    IncSearch = { bg = c.yellow, fg = c.dark_text }, -- searching
    Search = { bg = c.comment, fg = c.bg }, -- results
    -- cursor related
    Cursor = { bg = c.red, fg = c.text },
    CursorColumn = { bg = c.hl },
    CursorLine = { bg = c.hl },
    -- line numbers
    LineNrAbove = { fg = c.green },
    CursorLineNr = { fg = c.yellow, bold = true },
    LineNrBelow = { fg = c.blue },
    -- Popup menu
    Pmenu = { fg = c.comment },
    PmenuSbar = { fg = c.text },
    -- listchars
    Whitespace = { fg = c.hl },
    -- end of buffer ~
    EndOfBuffer = { fg = c.comment },
    -------------
    -- PLUGINS --
    -------------
    -- nvim-tree
    NvimTreeFolderName = { fg = c.teal, bold = true, underline = true },
    NvimTreeOpenedFolderName = { fg = c.blue, italic = true, bold = true, underline = true },
    NvimTreeEmptyFolderName = { fg = c.comment, bold = true },
    -- illuminate
    IlluminatedWordText = { bg = c.hl, italic = true },
    IlluminatedWordRead = { bg = c.hl, italic = true },
    IlluminatedWordWrite = { bg = c.hl, italic = true },
    -- scrollbar
    ScrollbarSearch = { fg = c.orange },
    -- cmp
    -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
    -- (use nvim treesitter highlight group as reference)
    CmpItemAbbrMatch = { fg = c.red, bold = true },
    CmpItemMenu = { fg = c.teal, italic = true }, -- [Lsp] tags
    -- CmpItemKindFunction = {bg = colours.blue, fg = colours.bg},
    -- CmpItemKindVariable = {bg = colours.yellow, fg = colours.bg},
    -- CmpItemKindKeyword = {bg = colours.purple, fg = colours.text},
    -- CmpItemKindFile = {bg = colours.green, fg = colours.text},
}

for k, v in pairs(highlights) do vim.api.nvim_set_hl(0, k, v) end
