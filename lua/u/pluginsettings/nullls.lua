local nl = require "null-ls"

local d = nl.builtins.diagnostics
local f = nl.builtins.formatting

nl.setup {
	border = "rounded",
	debug = false,
	sources = {
		d.ruff,

		f.black,
		f.stylua,
		f.prettier, -- json
		f.shfmt,
	},
}
