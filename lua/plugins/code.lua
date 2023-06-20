return {
	{ "numToStr/Comment.nvim", opts = { ignore = "^$" }, event = "VeryLazy" },
	{ "danymat/neogen", opts = { snippet_engine = "luasnip" }, event = "VeryLazy" },
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
		config = true,
		event = "VeryLazy",
	},
}
