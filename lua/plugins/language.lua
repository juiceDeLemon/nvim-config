return {
	-- markdown
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = "markdown",
	},
	{
		"ajorgensen/vim-markdown-toc",
		ft = "markdown",
	},
	{
		"echasnovski/mini.doc",
		config = true,
		ft = "lua",
	},
}
