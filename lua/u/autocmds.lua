local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Augroups
-- there is none

-- Autocommands
autocmd("BufEnter", {
    desc = "idk",
    callback = function()
        vim.cmd [[
            if winnr('$') <= 1 && bufname() == 'NvimTree_' . tabpagenr() | endif
        ]]
    end,
})

autocmd("TextYankPost", {
    desc = "Flash yanked content",
    callback = function() vim.highlight.on_yank { higroup = "Visual", timeout = 100 } end,
})

autocmd("BufWinEnter", {
    pattern = { "*" },
    desc = "Check for dupe files in other buffers",
    callback = function() vim.cmd "checktime" end,
})

autocmd("FileType", {
    desc = "I want to see the long line without scrolling",
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
        vim.opt_local.colorcolumn = ""
    end,
})

autocmd("FileType", {
    desc = "no listchars for help files",
    pattern = { "help" },
    callback = function()
        vim.opt_local.list = false
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})

autocmd("BufEnter", {
    callback = function() vim.opt.formatoptions:remove { "c", "r", "o" } end,
    desc = "Disable New Line Comment",
})

-- autocmd({ "UserGettingBored" }, {
--     desc = "disable the 4 primitive movement keys to teach the user a lesson",
--     callback = function()
--         vim.api.nvim_set_keymap({"n", "x"}, "h", "<nop>", { noremap = true, silent = true })
--         vim.api.nvim_set_keymap({"n", "x"}, "l", "<nop>", { noremap = true, silent = true })
--         vim.api.nvim_set_keymap({"n", "x"}, "j", "<nop>", { noremap = true, silent = true })
--         vim.api.nvim_set_keymap({"n", "x"}, "k", "<nop>", { noremap = true, silent = true })
--     end,
-- })
