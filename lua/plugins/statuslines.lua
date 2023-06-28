return {
	{
		"juiceDeLemon/schitoozleen.nvim",
		config = true,
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"mfussenegger/nvim-dap",
			"ThePrimeagen/harpoon",
		},
		event = "VeryLazy",
	},
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require "statuscol.builtin"
			require("statuscol").setup {
				bt_ignore = { "terminal", "nofile" },
				segments = {
					{
						sign = { name = { "Diagnostic" }, maxwidth = 1, colwidth = 3, auto = true },
					},
					{
						text = { builtin.lnumfunc },
					},
					{
						sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, wrap = true, auto = true },
					},
					{
						sign = { name = { "Dap" } },
						maxwidth = 1,
						colwidth = 1,
						auto = true,
					},
					{
						sign = { name = { "GitSigns" }, maxwidth = 2, colwidth = 1, auto = true },
					},
					{
						text = { " " },
					},
				},
			}
		end,
		dependencies = { "mfussenegger/nvim-dap", "lewis6991/gitsigns.nvim" },
		event = "VeryLazy",
	},
}
