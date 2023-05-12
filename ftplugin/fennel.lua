vim.g.autopair = 1
vim.api.nvim_buf_set_keymap(0, "i", "(", [[ g:autopair ? "()<left>" : "(" ]], { noremap = true, expr = true })
vim.api.nvim_buf_set_keymap(0, "i", "[", [[ g:autopair ? "[]<left>" : "[" ]], { noremap = true, expr = true })
vim.api.nvim_buf_set_keymap(0, "i", "{", [[ g:autopair ? "{}<left>" : "{" ]], { noremap = true, expr = true })
