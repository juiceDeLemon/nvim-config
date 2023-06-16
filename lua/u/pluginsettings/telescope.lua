require("telescope").setup {
	defaults = {
		path_display = { shorten = 4 },
		file_ignore_patterns = {
			".git/",
			"__pycache__/*",
			"__pycache__/",
			"%.otf",
			"%.ttf",
			".idea/",
			".vscode/",
			"venv/*",
			"~/.config/nvim/random_words.txt",
		},
	},
	extensions = { lazy = { show_icon = false } },
}

require("telescope").load_extension "fzf"
require("telescope").load_extension "lazy"
require("telescope").load_extension "menufacture"
