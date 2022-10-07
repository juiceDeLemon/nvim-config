-- ░█████╗░███╗░░░███╗██████╗░░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔══██╗████╗░████║██╔══██╗░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║░░╚═╝██╔████╔██║██████╔╝░░░██║░░░░░██║░░░██║███████║
-- ██║░░██╗██║╚██╔╝██║██╔═══╝░░░░██║░░░░░██║░░░██║██╔══██║
-- ╚█████╔╝██║░╚═╝░██║██║░░░░░██╗███████╗╚██████╔╝██║░░██║
-- ░╚════╝░╚═╝░░░░░╚═╝╚═╝░░░░░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
-- Set up nvim-cmp.
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then return end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then return end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then return end

require("luasnip.loaders.from_vscode").lazy_load()

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
               and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
               == nil
end


cmp.setup({
    enabled = true,
    preselect = cmp.PreselectMode.Item, -- TODO
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args) require("luasnip").lsp_expand(args.body) end
,
    },
    window = {
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
        },
        documentation = { border = "rounded" },
    },
    mapping = cmp.mapping.preset.insert({
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
            -- LuaFormatter off
        end, { "i", "s" }),
        -- LuaFormatter on
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
            -- LuaFormatter off
        end, { "i", "s" }),
        -- LuaFormatter on
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
            -- LuaFormatter off
        end, { "i", "s" }),
        -- LuaFormatter on
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
            mode = "symbol", -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            menu = ({
                nvim_lsp = "[Lsp]",
                nvim_lua = "[Vim]",
                luasnip = "[Snips]",
                buffer = "[Buf]",
                path = "[Path]",
                emoji = "[:)]",
            }),
        }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp", group_index = 1 },
        { name = "nvim_lua", group_index = 1 },
        { name = "path", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 3 },
        { name = "emoji", group_index = 4 },
    }),
    experimental = { ghost_text = true },
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    }, { { name = "buffer" } }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" },
                  { mapping = cmp.mapping.preset.cmdline(), sources = { { name = "buffer" } } })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})
