return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "-" },
				changedelete = { text = "=" },
				untracked = { text = "|" },
			},
			signcolumn = true,
			preview_config = {
				border = "rounded",
				style = "minimal",
				relative = "cursor",
			},
		},
		event = "VeryLazy",
		keys = {
			{ "<leader>gb", "<cmd>lua require'gitsigns'.blame_line()<cr>", desc = "View Blame" },
			{ "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff Current File" },
			{ "<leader>gh", "<cmd>Gitsigns prev_hunk<cr>", mode = { "n", "v" }, desc = "Previous Hunk" },
			{ "<leader>gl", "<cmd>Gitsigns next_hunk<cr>", mode = { "n", "v" }, desc = "Next Hunk" },
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
			{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Restore Hunk" },
			{ "<leader>gv", "<cmd>lua require'gitsigns'.select_hunk()<cr>", desc = "Select Hunk" },
		},
	},
	{
		"akinsho/git-conflict.nvim",
		keys = {
			{ "<leader>gcc", "<Plug>(git-conflict-ours)", desc = "Accept Current" },
			{ "<leader>gci", "<Plug>(git-conflict-theirs)", desc = "Accept Incoming Change" },
			{ "<leader>gcb", "<Plug>(git-conflict-both)", desc = "Accept Both" },
			{ "<leader>gcn", "<Plug>(git-conflict-none)", desc = "Accept None" },
			{ "<leader>gch", "<Plug>(git-conflict-prev-conflict)", desc = "Previous Conflict" },
			{ "<leader>gcl", "<Plug>(git-conflict-next-conflict)", desc = "Next Conflict" },
		},
		config = true,
	},
}
