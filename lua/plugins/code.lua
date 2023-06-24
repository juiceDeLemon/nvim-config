return {
	{ "numToStr/Comment.nvim", opts = { ignore = "^$" }, event = "VeryLazy" },
	{
		"danymat/neogen",
		opts = { snippet_engine = "luasnip" },
		keys = {
			{ "<leader>a", "V<cmd>Neogen<cr><esc>", mode = { "n", "v" }, desc = "Neogen" }, -- a for annotation
		},
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
		config = true,
		keys = {
			{
				"<leader>re",
				"<esc><cmd>lua require('refactoring').refactor('Extract Function')<cr>",
				mode = "v",
				desc = "Extract Function",
			},
			{
				"<leader>rf",
				"<esc><cmd>lua require('refactoring').refactor('Extract Function To File')<cr>",
				mode = "v",
				desc = "Extract Function To File",
			},
			{
				"<leader>rv",
				"<esc><cmd>lua require('refactoring').refactor('Extract Variable')<cr>",
				mode = "v",
				desc = "Extract Variable",
			},
			{
				"<leader>ri",
				"<esc><cmd>lua require('refactoring').refactor('Inline Variable')<cr>",
				mode = "v",
				desc = "Inline Variable",
			},
			{
				"<leader>ri",
				"<cmd>lua require('refactoring').refactor('Inline Variable')<cr>",
				desc = "Inline Variable",
			},
			{ "<leader>rb", "<cmd>lua require('refactoring').refactor('Extract Block')<cr>", desc = "Extract Block" },
			{
				"<leader>rbf",
				"<cmd>lua require('refactoring').refactor('Extract Block To File')<cr>",
				desc = "Extract Block to File",
			},
			{
				"<leader>rp",
				"<cmd>lua require('refactoring').debug.printf({below = true})<cr>",
				desc = "Add Empty Print Statement",
			},
			{
				"<leader>rv",
				"<cmd>lua require('refactoring').debug.print_var({ normal = true })<cr>",
				desc = "Add Print Statement on Variable",
			},
			{
				"<leader>rpv",
				"<cmd>lua require('refactoring').debug.print_var({})<cr>",
				mode = "v",
				desc = "Add Print Statement on Selection",
			},
			{ "<leader>rc", "<cmd>lua require('refactoring').debug.cleanup{}<cr>", desc = "Clean Up Generated Prints" },
		},
	},
}
