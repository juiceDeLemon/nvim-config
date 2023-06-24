return {
	-- markdown
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = "markdown",
		keys = {
			{ "<leader>p", "<plug>MarkdownPreviewToggle", desc = "Preview Markdown" },
		},
	},
	{
		"ajorgensen/vim-markdown-toc",
		ft = "markdown",
		keys = {
			{ "<leader>a", vim.cmd.GenerateMarkdownTOC, desc = "Generate Index" },
		},
	},
	{
		"echasnovski/mini.doc",
		config = true,
		ft = "lua",
		keys = {
			{ "<leader><leader>l", "<cmd>lua MiniDoc.generate()<cr>", desc = "Generate Docs for Plugin" },
		},
	},
}
