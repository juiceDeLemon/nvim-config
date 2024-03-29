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
			-- stylua: ignore start
			{ "<leader>g", "", mode = { "n", "v" }, desc = "Git" },
			{ "<leader>gb", function() vim.cmd.Gitsigns "blame_line" end, desc = "View Blame" },
			{ "<leader>gd", function() vim.cmd.Gitsigns "diffthis" end, desc = "Diff Current File" },
			{ "<leader>gh", function() vim.cmd.Gitsigns "prev_hunk" end, mode = { "n", "v" }, desc = "Previous Hunk" },
			{ "<leader>gl", function() vim.cmd.Gitsigns "next_hunk" end, mode = { "n", "v" }, desc = "Next Hunk" },
			{ "<leader>gp", function() vim.cmd.Gitsigns "preview_hunk" end, desc = "Preview Hunk"  },
			{ "<leader>gr", function() vim.cmd.Gitsigns "reset_hunk" end, desc = "Restore Hunk" },
			{ "<leader>gv", function() vim.cmd.Gitsigns "select_hunk" end, desc = "Select Hunk" },
			-- stylua: ignore end
		},
	},
}
