_G.cursorword_blocklist = function()
	local curword = vim.fn.expand "<cword>"
	local filetype = vim.api.nvim_buf_get_option(0, "filetype")

	-- Add any disabling global or filetype-specific logic here
	local blocklist = {}
	if filetype == "lua" then
		blocklist = { "--", "---", "true", "false" }
	end

	vim.b.minicursorword_disable = vim.tbl_contains(blocklist, curword)
end

-- Make sure to add this autocommand *before* calling module's `setup()`.
vim.api.nvim_create_autocmd("CursorMoved", {
	pattern = "*",
	callback = function()
		_G.cursorword_blocklist()
	end,
})
require("mini.cursorword").setup { delay = 600 }
