return {
	{
		"ThePrimeagen/harpoon",
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = {
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
			extensions = {
				lazy = { show_icon = false },
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension "lazy"
			require("telescope").load_extension "menufacture"
		end,
		dependencies = {
			"tsakirist/telescope-lazy.nvim",
			"molecule-man/telescope-menufacture",
		},
		event = "VeryLazy",
	},
	{ "mbbill/undotree", event = "VeryLazy" },
}
