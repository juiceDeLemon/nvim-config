return {
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			invert_selection = true,
			transparent_mode = true,
		},
		config = function(_, opts)
			require("gruvbox").setup(opts)
			vim.cmd.colorscheme "gruvbox"
		end,
		lazy = false,
	},
}
