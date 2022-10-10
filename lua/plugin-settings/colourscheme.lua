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
local highlights = { -- TODO: hi link https://neovim.io/doc/user/api.html
    -- Which Key
    WhichKeyborder = { fg = colours.text },
    -- change search highlight background colour
    IncSearch = { bg = colours.yellow, fg = colours.dark_text }, -- searching
    Search = { bg = colours.comment, fg = colours.bg }, -- results
    -- change split separator colour
    VertSplit = { fg = colours.text },
    -- change cursorline and cursorcolumn highlight
    CursorColumn = { bg = "#2D313B" },
    CursorLine = { bg = "#2D313B" },
    CursorLineNr = { fg = colours.green, bold = true },
    -- cmp
    -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
    -- (use nvim treesitter highlight group as reference)
    CmpItemAbbrMatch = { fg = colours.red, bold = true },
    CmpItemMenu = { fg = colours.teal, italic = true }, -- [Lsp] tags
    -- https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor (cursor change colour)
    -- CmpItemKindFunction = {bg = colours.blue, fg = colours.bg},
    -- CmpItemKindVariable = {bg = colours.yellow, fg = colours.bg},
    -- CmpItemKindKeyword = {bg = colours.purple, fg = colours.text},
    -- CmpItemKindFile = {bg = colours.green, fg = colours.text},
}

for k, v in pairs(highlights) do vim.api.nvim_set_hl(0, k, v) end
