vim.keymap.set("n", "<leader><leader>p", vim.cmd.MarkdownPreviewToggle, { desc = "Toggle Markdown Preview" })
vim.keymap.set("n", "<leader>a", vim.cmd.GenerateMarkdownTOC, { desc = "Generate Markdown Table of Context" })

vim.b.lsp_format_activate = false
vim.keymap.set("n", "<leader>lf", function()
	vim.cmd "!prettier %"
end, { noremap = true, desc = "Format File" })
