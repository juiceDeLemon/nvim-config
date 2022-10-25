-- ░█████╗░░█████╗░██╗░░░░░░█████╗░██████╗░░██████╗░█████╗░██╗░░██╗███████╗███╗░░░███╗███████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔══██╗██╔══██╗██║░░░░░██╔══██╗██╔══██╗██╔════╝██╔══██╗██║░░██║██╔════╝████╗░████║██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║░░╚═╝██║░░██║██║░░░░░██║░░██║██████╔╝╚█████╗░██║░░╚═╝███████║█████╗░░██╔████╔██║█████╗░░░░░██║░░░░░██║░░░██║███████║
-- ██║░░██╗██║░░██║██║░░░░░██║░░██║██╔══██╗░╚═══██╗██║░░██╗██╔══██║██╔══╝░░██║╚██╔╝██║██╔══╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ╚█████╔╝╚█████╔╝███████╗╚█████╔╝██║░░██║██████╔╝╚█████╔╝██║░░██║███████╗██║░╚═╝░██║███████╗██╗███████╗╚██████╔╝██║░░██║
-- ░╚════╝░░╚════╝░╚══════╝░╚════╝░╚═╝░░╚═╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local onedark = require "onedark"
local colours = require "colours"

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
    VertSplit = { fg = colours.text },
    -- matching parenthesis (default plugin)
    MatchParen = { bg = colours.hl, italic = true, bold = true },
    -- change search highlight background colour
    IncSearch = { bg = colours.yellow, fg = colours.dark_text }, -- searching
    Search = { bg = colours.comment, fg = colours.bg }, -- results
    -- cursor related
    Cursor = { bg = colours.red, fg = colours.text },
    CursorColumn = { bg = colours.hl },
    CursorLine = { bg = colours.hl },
    CursorLineNr = { fg = colours.green, bold = true },
    -------------
    -- PLUGINS --
    -------------
    -- illuminate
    IlluminatedWordText = { bg = colours.hl, italic = true },
    IlluminatedWordRead = { bg = colours.hl, italic = true },
    IlluminatedWordWrite = { bg = colours.hl, italic = true },
    -- cmp
    -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
    -- (use nvim treesitter highlight group as reference)
    CmpItemAbbrMatch = { fg = colours.red, bold = true },
    CmpItemMenu = { fg = colours.teal, italic = true }, -- [Lsp] tags
    -- CmpItemKindFunction = {bg = colours.blue, fg = colours.bg},
    -- CmpItemKindVariable = {bg = colours.yellow, fg = colours.bg},
    -- CmpItemKindKeyword = {bg = colours.purple, fg = colours.text},
    -- CmpItemKindFile = {bg = colours.green, fg = colours.text},
}

for k, v in pairs(highlights) do vim.api.nvim_set_hl(0, k, v) end
