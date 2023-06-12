require("gitsigns").setup {
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
}
