-- install lazy if not installed
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	defaults = { lazy = true },
	install = { colorscheme = { "gruvbox" } },
	dev = { path = os.getenv "HOME" .. "/Repos/neovim_plugins/" },
	change_detection = { notify = false },
	performance = {
		rtp = {
			reset = true,
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
				"tutor",
				"matchit",
				"spellfile",
			},
		},
	},
})
