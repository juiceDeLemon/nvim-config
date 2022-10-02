-- ░█████╗░░█████╗░██╗░░░░░░█████╗░██████╗░░██████╗░█████╗░██╗░░██╗███████╗███╗░░░███╗███████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔══██╗██╔══██╗██║░░░░░██╔══██╗██╔══██╗██╔════╝██╔══██╗██║░░██║██╔════╝████╗░████║██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║░░╚═╝██║░░██║██║░░░░░██║░░██║██████╔╝╚█████╗░██║░░╚═╝███████║█████╗░░██╔████╔██║█████╗░░░░░██║░░░░░██║░░░██║███████║
-- ██║░░██╗██║░░██║██║░░░░░██║░░██║██╔══██╗░╚═══██╗██║░░██╗██╔══██║██╔══╝░░██║╚██╔╝██║██╔══╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ╚█████╔╝╚█████╔╝███████╗╚█████╔╝██║░░██║██████╔╝╚█████╔╝██║░░██║███████╗██║░╚═╝░██║███████╗██╗███████╗╚██████╔╝██║░░██║
-- ░╚════╝░░╚════╝░╚══════╝░╚════╝░╚═╝░░╚═╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  return
end

local colours = require("colours")

onedark.setup({
    functionStyle = "underline",
    variableStyle = "bold",
    transparent = false,
    customTelescope = true,
})

-- custom highlights must be put after setup function
-- this overrides colourscheme default
-- otherwise the setup function will override the custom settings
local highlights = {
    -- change search highlight background colour
    IncSearch = {bg = colours.comment, fg = colours.bg}, -- searching
    Search = {bg = colours.comment, fg = colours.bg}, -- results
    -- change split separator colour
    VertSplit = {fg = colours.text},
    -- cmp
    -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
    -- (use nvim treesitter highlight group as reference)
    -- https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor (cursor change colour)
    -- CmpItemKindFunction = {bg = colours.blue, fg = colours.bg},
    -- CmpItemKindVariable = {bg = colours.yellow, fg = colours.bg},
    -- CmpItemKindKeyword = {bg = colours.purple, fg = colours.text},
    -- CmpItemKindFile = {bg = colours.green, fg = colours.text},
}

for k, v in pairs(highlights) do
    vim.api.nvim_set_hl(0, k, v)
end

