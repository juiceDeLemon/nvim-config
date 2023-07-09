return {
	{
		"catppuccin/nvim",
		opts = {
			transparent_background = true,
			show_end_of_buffer = true,
			styles = {
				loops = { "italic" },
				functions = { "bold" },
				keywords = { "italic" },
			},
			color_overrides = {
				mocha = {
					-- css colours
					base = "#242424", -- black + 12 + 12
					blue = "#4169e1", -- royalblue
					crust = "#000000", -- black
					flamingo = "#ffffe0", -- lightyellow
					green = "#00ff00", -- greenyellow
					lavender = "#fff0f5", -- lavenderblush
					mantle = "#121212", -- black + 12
					maroon = "#ff4500", -- orangered
					mauve = "#ee2fee", -- violet
					overlay0 = "#a9a9a9", -- darkgray
					overlay1 = "#808080", -- gray
					overlay2 = "#696969", -- dimgray
					peach = "#ffa500", -- orange
					pink = "#ffc0cb", -- pink
					red = "#ff0000", -- red
					rosewater = "#ffffff", -- white
					sapphire = "#00bfff", -- deepskyblue
					sky = "#87ceeb", -- skyblue
					subtext0 = "#a6adc8",
					subtext1 = "#bac2de",
					surface0 = "#313244",
					surface1 = "#45475a",
					surface2 = "#585b70",
					teal = "#00ffff", -- cyan
					text = "#ffffff", -- white
					yellow = "#ffff00", -- yellow
				},
			},
			custom_highlights = function(c)
				return {
					TreesitterContextBottom = { bold = true, underline = true },
					LineNrAbove = { fg = c.overlay0 },
					LineNrBelow = { fg = c.overlay0 },
					Pmenu = { fg = c.pink },
					CmpItemAbbrMatch = { fg = c.maroon, bold = true },
					CmpItemMenu = { italic = true },
					Visual = { bold = true, reverse = true },
					TelescopeSelection = { bg = c.surface1, style = { "bold" } },
					TelescopeSelectionCaret = { bg = c.surface1, style = { "bold" } },
					TelescopeBorder = { fg = c.pink },
					GitSignsChangedelete = { fg = c.blue },
					EndOfBuffer = { fg = c.overlay0 },
					Whitespace = { fg = c.overlay0 },
					VertSplit = { fg = c.overlay0 },
					TabLine = { fg = c.text, bg = "None" },
					TabLineSel = { fg = c.text, bg = "None", reverse = true },
				}
			end,
			integrations = {
				alpha = false,
				aerial = false,
				barbar = false,
				beacon = false,
				cmp = true,
				coc_nvim = false,
				dashboard = false,
				fern = false,
				fidget = true,
				gitgutter = false,
				gitsigns = true,
				harpoon = true,
				headlines = false,
				hop = false,
				illuminate = false,
				leap = false,
				lightspeed = false,
				lsp_saga = false,
				lsp_trouble = true,
				markdown = true,
				mason = false,
				mini = true,
				neogit = false,
				neotest = false,
				neotree = false,
				noice = false,
				notify = false,
				nvimtree = false,
				octo = false,
				overseer = false,
				pounce = false,
				sandwich = false,
				semantic_tokens = true,
				symbols_outline = false,
				telekasten = false,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				ts_rainbow = false,
				ts_rainbow2 = false,
				vim_sneak = false,
				vimwiki = false,
				which_key = false,
				dap = { enabled = true, enable_ui = true },
				indent_blankline = { enabled = false, colored_indent_levels = false },
				native_lsp = { enabled = true },
				navic = { enabled = true },
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme "catppuccin"

			-- print palette
			vim.keymap.set(
				"n",
				"<leader><leader>h",
				"<cmd>lua pp(require('catppuccin.palettes').get_palette 'mocha')<cr>",
				{ desc = "Get Palette" }
			)
		end,
		lazy = false,
		priority = 1000,
	},
}
