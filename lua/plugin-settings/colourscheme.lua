-- ░█████╗░░█████╗░██╗░░░░░░█████╗░██████╗░░██████╗░█████╗░██╗░░██╗███████╗███╗░░░███╗███████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔══██╗██╔══██╗██║░░░░░██╔══██╗██╔══██╗██╔════╝██╔══██╗██║░░██║██╔════╝████╗░████║██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║░░╚═╝██║░░██║██║░░░░░██║░░██║██████╔╝╚█████╗░██║░░╚═╝███████║█████╗░░██╔████╔██║█████╗░░░░░██║░░░░░██║░░░██║███████║
-- ██║░░██╗██║░░██║██║░░░░░██║░░██║██╔══██╗░╚═══██╗██║░░██╗██╔══██║██╔══╝░░██║╚██╔╝██║██╔══╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ╚█████╔╝╚█████╔╝███████╗╚█████╔╝██║░░██║██████╔╝╚█████╔╝██║░░██║███████╗██║░╚═╝░██║███████╗██╗███████╗╚██████╔╝██║░░██║
-- ░╚════╝░░╚════╝░╚══════╝░╚════╝░╚═╝░░╚═╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local o = require "onedark"
local c = require "colours"

o.setup { functionStyle = "underline", variableStyle = "bold", transparent = not require "neovide" }

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
    -- scrollbar
    ScrollbarSearch = { fg = c.orange },
    -- barbecue (basically navic)
    BarbecueSeparator = { fg = c.text },
    CodewindowBackground = { bg = c.dark_bg },
    -- FSRead
    FSPrefix = { fg = c.text },
    FSSuffix = { fg = "#6C7086" },
    -- nvim-tree
    NvimTreeFolderName = { fg = c.teal, bold = true, underline = true },
    NvimTreeOpenedFolderName = { fg = c.blue, italic = true, bold = true, underline = true },
    NvimTreeEmptyFolderName = { fg = c.comment, bold = true },
    -- illuminate
    IlluminatedWordText = { bg = c.hl, italic = true },
    IlluminatedWordRead = { bg = c.hl, italic = true },
    IlluminatedWordWrite = { bg = c.hl, italic = true },
    -- indent blank line
    IndentBlanklineIndent1 = { fg = c.red, nocombine = true },
    IndentBlanklineIndent2 = { fg = c.yellow, nocombine = true },
    IndentBlanklineIndent3 = { fg = c.green, nocombine = true },
    IndentBlanklineIndent4 = { fg = c.teal, nocombine = true },
    IndentBlanklineIndent5 = { fg = c.blue, nocombine = true },
    IndentBlanklineIndent6 = { fg = c.purple, nocombine = true },
    -- cmp
    CmpItemAbbrMatch = { fg = c.red, bold = true },
    CmpItemMenu = { fg = c.teal, italic = true }, -- [Lsp] tags
    -- treesitter
    ["@operator"] = { fg = c.teal },
    ["@keyword"] = { fg = c.purple, italic = true },
    ["@include"] = { fg = c.purple, italic = true },
    ["@constructor"] = { fg = c.teal, italic = true },
    ["@variable.builtin"] = { fg = c.yellow },
    ["@parameter"] = { italic = true },
}

for k, v in pairs(highlights) do vim.api.nvim_set_hl(0, k, v) end
