local cmp = require "cmp"
local snip = require "luasnip"
local lspkind = require "lspkind"

-- friendly-snip
-- copied from https://github.com/L3MON4D3/LuaSnip/issues/37
vim.o.runtimepath = vim.o.runtimepath .. "~/.config/nvim/lua/friendly-snippets"
require("luasnip.loaders.from_vscode").lazy_load()

-- local has_words_before = function()
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0
--                and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
--                == nil
-- end

-- lspkind.init { preset = "codicons" }

cmp.setup {
    enabled = true,
    preselect = cmp.PreselectMode.Item,
    snippet = {
        expand = function(args) snip.lsp_expand(args.body) end,
    },
    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -2,
            side_padding = 0,
        },
        documentation = {
            border = "rounded",
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        },
    },
    mapping = cmp.mapping.preset.insert {
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-CR>"] = cmp.mapping.confirm { select = true },
        ["<C-Space>"] = cmp.mapping(function()
            local isVisible = cmp.visible()
            if isVisible then
                cmp.abort()
            else
                cmp.complete()
            end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif snip.expand_or_jumpable() then
                snip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif snip.jumpable(-1) then
                snip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = cmp.config.sources {
        { name = "luasnip", group_index = 1 },
        { name = "nvim_lsp", group_index = 2 },
        { name = "nvim_lua", group_index = 2, keyword_length = 3 },
        { name = "path", group_index = 3, keyword_length = 3 },
        { name = "buffer", group_index = 4, keyword_length = 5 },
        { name = "issues", group_index = 6 },
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format {
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            mode = "symbol_text",
            menu = {
                luasnip = "[Snips]",
                nvim_lsp = "[Lsp]",
                nvim_lua = "[Vim]",
                buffer = "[Buf]",
                path = "[Path]",
                issues = "[Issues]",
            },
        },
    },
    experimental = { ghost_text = true },
}

cmp.setup.cmdline({ "/", "?" }, { mapping = cmp.mapping.preset.cmdline(), sources = { { name = "buffer" } } })

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "nvim_lua" }, { name = "path" } }, { { name = "cmdline" } }),
})

-- plugin capabilities are in somewhere in lsp.lua
