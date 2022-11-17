-- ██╗░░░░░██╗░░░██╗░█████╗░░██████╗███╗░░██╗██╗██████╗░░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██║░░░░░██║░░░██║██╔══██╗██╔════╝████╗░██║██║██╔══██╗░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║░░░░░██║░░░██║███████║╚█████╗░██╔██╗██║██║██████╔╝░░░██║░░░░░██║░░░██║███████║
-- ██║░░░░░██║░░░██║██╔══██║░╚═══██╗██║╚████║██║██╔═══╝░░░░██║░░░░░██║░░░██║██╔══██║
-- ███████╗╚██████╔╝██║░░██║██████╔╝██║░╚███║██║██║░░░░░██╗███████╗╚██████╔╝██║░░██║
-- ╚══════╝░╚═════╝░╚═╝░░╚═╝╚═════╝░╚═╝░░╚══╝╚═╝╚═╝░░░░░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local ls = require "luasnip"
local types = require "luasnip.util.types"

-- Snippet Creator
local s = ls.s

-- insert node
-- sets a position for the cursor to jump to
-- placeholder can be ommited if no placeholder
-- i(pos, "placeholder") or i(pos)
local i = ls.insert_node

-- text node
-- puts literal string without formats
-- use a table of string to input multiple lines of string
-- t({"line 1", "line 2"}) or t("line 1")
local t = ls.text_node

-- choice node
-- sets a position for the cursor to jump to
-- and choose an option
-- c(pos, {node_1, node_2})
local c = ls.choice_node

-- function node
-- accepts a function that returns text
-- f(function() ... return ... end)
local f = ls.function_node

-- format node
-- text node but with formatting
-- fmt("something{}", {nodes_with_pos})
local fmt = require"luasnip.extras.fmt".fmt

-- format a node
-- fmt node but uses <> instead of {}
local fmta = require"luasnip.extras.fmt".fmta

-- repeat node
-- repeat node on pos provided
-- rep(pos)
local rep = require"luasnip.extras".rep

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    -- enable_autosnippets = true, -- TEST
    -- wait for other vid
    ext_opts = { [types.choiceNode] = { active = { virt_text = { { "<-", "Error" } } } } },
}

-- all
ls.add_snippets("all", {
    s("date", f(function() return vim.fn.strftime("%d/%m/%y") end
)),
})

ls.add_snippets("lua",
    { s("lreq", fmt("local {} = require \"{}\"", { i(1, "var"), i(2, "module") })) })

ls.add_snippets("cpp", {
    s("str", { t("std::string") }),
    s("trigger", fmta("for (size_t <>{<>}; <> << <>; <><>){\n\t<>\n}", {
        i(1, "i"),
        -- i(2, "val"),
        c(2, { t(""), i(1, "val") }),
        rep(1),
        i(3, "val"),
        rep(1),
        c(4, { t("++"), fmt(" += {}", { i(1, "val") }) }),
        i(0),
        -- i(4, "++"),
    })),
    s("r0", { t({ "", "", "return 0;" }) }),
})
