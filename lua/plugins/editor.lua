return {
	{
		"folke/which-key.nvim",
		opts = {
			plugins = { spelling = { enabled = true, suggestions = 25 } },
			icons = { breadcrumb = "", separator = ":", group = "*" },
			popup_mappings = { scroll_down = "<c-j>", scroll_up = "<c-k>" },
			window = { border = "rounded" },
		},
		event = "VeryLazy",
	},
	{
		"folke/todo-comments.nvim",
		opts = {
			signs = false,
			highlight = { before = "fg", keyword = "bg" },
		},
		dependencies = "nvim-lua/plenary.nvim",
		event = "VeryLazy",
	},
	{
		"echasnovski/mini.ai",
		opts = {
			mappings = {
				around_next = "al",
				inside_next = "il",
				around_last = "ah",
				inside_last = "ih",
			},
		},
		event = "VeryLazy",
	},
	{ "kylechui/nvim-surround", config = true, event = "VeryLazy" },
	{ "kevinhwang91/nvim-hlslens", config = true, event = "VeryLazy" },
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			filetypes = { "*" },
			user_default_options = {
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				RGB = false,
				names = false, -- name codes like teal, purple, pink, or even navy
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			},
			-- all the sub-options of filetypes apply to buftypes
			buftypes = {},
		},
		-- main = "colorizer",
		event = "VeryLazy",
	},
	{
		"Julian/vim-textobj-variable-segment",
		dependencies = "kana/vim-textobj-user",
		event = "VeryLazy",
	},
	{ "weilbith/nvim-code-action-menu", event = "VeryLazy" },
}
