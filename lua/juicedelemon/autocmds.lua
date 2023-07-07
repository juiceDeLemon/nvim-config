local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Augroups
local aug_common = augroup("common", {})
local aug_minifiles = augroup("minifiles", {})

-- Autocommands
autocmd("TextYankPost", {
	group = aug_common,
	desc = "Flash yanked content",
	callback = function()
		vim.highlight.on_yank { higroup = "Visual", timeout = 100 }
	end,
})

autocmd("BufWinEnter", {
	group = aug_common,
	pattern = { "*" },
	desc = "Check for dupe files in other buffers",
	callback = function()
		vim.cmd "checktime"
	end,
})

autocmd("FileType", {
	group = aug_common,
	desc = "I want to see the long line without scrolling",
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
		vim.opt_local.colorcolumn = ""
	end,
})

autocmd("FileType", {
	group = aug_common,
	desc = "no listchars for help files",
	pattern = { "help" },
	callback = function()
		vim.opt_local.list = false
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

autocmd("BufEnter", {
	group = aug_common,
	callback = function()
		vim.opt.formatoptions:remove { "c", "r", "o" }
	end,
	desc = "Disable New Line Comment",
})

-- stolen from https://github.com/thedenisnikulin/nvim
autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("timestamp_backupext", { clear = true }),
	desc = "Add timestamp to backup extension",
	pattern = "*",
	callback = function()
		vim.opt.backupext = "-" .. vim.fn.strftime "%Y%m%d%H%M"
	end,
})

autocmd("User", {
	group = aug_minifiles,
	pattern = "MiniFilesWindowOpen",
	callback = function(args)
		local win_id = args.data.win_id
		vim.api.nvim_win_set_config(win_id, { border = "rounded" })
	end,
	desc = "rounded border for minifiles",
})

-- autocmd({ "UserGettingBored" }, {
--    group = aug_common,
--    desc = "disable the 4 primitive movement keys to teach the user a lesson",
--    callback = function()
--       vim.api.nvim_set_keymap({ "n", "x" }, "h", "<nop>", { noremap = true, silent = true })
--       vim.api.nvim_set_keymap({ "n", "x" }, "l", "<nop>", { noremap = true, silent = true })
--       vim.api.nvim_set_keymap({ "n", "x" }, "j", "<nop>", { noremap = true, silent = true })
--       vim.api.nvim_set_keymap({ "n", "x" }, "k", "<nop>", { noremap = true, silent = true })
--    end,
-- })
