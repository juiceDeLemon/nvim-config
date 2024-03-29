return {
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			invert_selection = true,
			dim_inactive = true,
			overrides = {
				TreesitterContext = { bold = true },
				TreesitterContextLineNumber = { fg = "#ebdbb2" },
				TreesitterContextBottom = { underline = true },
			},
		},
		config = function(_, opts)
			require("gruvbox").setup(opts)
			vim.cmd.colorscheme "gruvbox"
		end,
		lazy = false,
	},
}
