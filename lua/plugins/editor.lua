return {
	{
		"echasnovski/mini.clue",
		config = function()
			local miniclue = require "mini.clue"
			miniclue.setup {
				triggers = {
					-- leader
					{ mode = "n", keys = "<leader>" },
					{ mode = "x", keys = "<leader>" },

					-- g
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					-- <c-w> (windows)
					{ mode = "n", keys = "<C-w>" },

					-- z aka useless
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
				},
				clues = {
					miniclue.gen_clues.g(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			}
		end,
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
		event = "VeryLazy",
	},
	{
		"Julian/vim-textobj-variable-segment",
		dependencies = "kana/vim-textobj-user",
		event = "VeryLazy",
	},
	{
		"kevinhwang91/nvim-fundo",
		dependencies = { "kevinhwang91/promise-async" },
		build = ":lua require 'fundo'.install()",
		config = true,
		event = "VeryLazy",
	},
}
