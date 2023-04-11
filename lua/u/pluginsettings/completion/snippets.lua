local snip = require "luasnip"

-- choice node selection
vim.keymap.set("i", "<c-l>", function()
   if snip.choice_active() then snip.change_choice(1) end
end)

-- snip creator
-- s(<trigger>, <nodes>)
local s = snip.s

-- text node
-- t(<line1>, <line2> etc)
local t = snip.text_node

local i = snip.insert_node

-- fmt mode
-- fmt(<string>, { nodes })
local fmt = require("luasnip.extras.fmt").fmt

-- choice node
-- c(<pos>, { nodes })
local c = snip.choice_node

snip.add_snippets("all", {
   -- NOTE: todo comments filled
   s(
      "todo-comments",
      fmt("{}: ", { c(1, { t "FIX", t "BUG", t "TODO", t "INFO", t "WARN", t "OPTIMIZE", t "NOTE", t "TEST" }) })
   ),
})
snip.add_snippets("lua", {
   -- stylua comments
   s("styluaignore", fmt("-- stylua: ignore {}", { c(1, { t "start", t "end", t "" }) })),
   -- the keymap thing
   s("<cmd>", fmt("<cmd>{}<cr>", { i(1) })),
})
