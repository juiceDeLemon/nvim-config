require("hlchunk").setup {
	chunk = {
		chars = { right_arrow = "─" },
		style = { vim.api.nvim_get_hl(0, { name = "Comment" }) },
	},
	indent = { style = { vim.api.nvim_get_hl(0, { name = "Whitespace" }) } },
	line_num = { enable = false },
	blank = { enabled = false },
}
