vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4

vim.keymap.set("n", "<leader><leader>w", function()
	vim.cmd.vsplit()
	vim.cmd.terminal "cargo-watch"
end, { desc = "Launch cargo-watch" })
