-- add execute perm
vim.keymap.set("n", "<leader><leader>x", "<cmd>!chmod +x %<CR>", { desc = "Add Execute Permission" })
