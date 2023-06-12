local nl = require "null-ls"

local d = nl.builtins.diagnostics
local f = nl.builtins.formatting

nl.setup {
	border = "rounded",
	debug = false,
	sources = {
		d.pylint.with {
			extra_args = {
				"--ignored-modules=pygame",
				"--good-names=x,y,z,i,j,n,f",
			},
		},

		f.black,
		f.stylua,
		f.prettier, -- json
		f.shfmt,
	},
}
