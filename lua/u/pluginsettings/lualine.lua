require("lualine").setup {
	options = {
		globalstatus = true,
		refresh = { statusline = 250 },
	},
	sections = {
		lualine_a = { {
			"mode",
			fmt = function(str)
				return "ඞ " .. str
			end,
		} },
		lualine_b = { "filename", "filetype" },
		lualine_c = { "branch", "diff", "diagnostics" },
		lualine_x = { "filesize", "encoding" },
		lualine_y = { "location" },
		lualine_z = { "progress" },
	},
	tabline = {
		lualine_a = { { "buffers", mode = 2 } },
		lualine_z = { "tabs" },
	},
}
require("barbecue").setup {
	modifiers = { dirname = ":~" },
	symbols = { separator = "", default_context = "..." },
	kinds = {
		-- from ? (possibly neovim from scratch)
		Array = "",
		Boolean = "蘒",
		Key = "",
		Namespace = "",
		Null = "ﳠ",
		Number = "",
		Object = "",
		Package = "",
		String = "",
		-- from lspkind
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "ﰠ",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "塞",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "פּ",
		Event = "",
		Operator = "",
		TypeParameter = "",
	},
}
