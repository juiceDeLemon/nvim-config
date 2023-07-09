vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4

vim.b.lsp_format_activate = false
vim.keymap.set("n", "<leader>lf", function()
	vim.cmd "!black %"
end, { noremap = true, desc = "Format File" })
