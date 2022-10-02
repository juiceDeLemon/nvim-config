-- ░█████╗░██╗░░░██╗████████╗░█████╗░░█████╗░███╗░░░███╗██████╗░░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔══██╗██║░░░██║╚══██╔══╝██╔══██╗██╔══██╗████╗░████║██╔══██╗░░░██║░░░░░██║░░░██║██╔══██╗
-- ███████║██║░░░██║░░░██║░░░██║░░██║██║░░╚═╝██╔████╔██║██║░░██║░░░██║░░░░░██║░░░██║███████║
-- ██╔══██║██║░░░██║░░░██║░░░██║░░██║██║░░██╗██║╚██╔╝██║██║░░██║░░░██║░░░░░██║░░░██║██╔══██║
-- ██║░░██║╚██████╔╝░░░██║░░░╚█████╔╝╚█████╔╝██║░╚═╝░██║██████╔╝██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝░░╚═╝░╚═════╝░░░░╚═╝░░░░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚═════╝░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufEnter" }, {
    desc = "keeps nvimtree on the left",
    callback = function()
        vim.cmd [[
            if winnr('$') <= 1 && bufname() == 'NvimTree_' . tabpagenr() | endif
        ]]
    end,
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

