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
		"martineausimon/nvim-lilypond-suite",
		opts = {
			lilypond = {
				options = {
					diagnostics = true,
				},
			},
		},
		ft = { "lilypond" },
		dependencies = { "MunifTanjim/nui.nvim" },
	},
}
