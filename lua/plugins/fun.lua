return {
	{
		"alanfortlink/blackjack.nvim",
		cmd = { "BlackJackNewGame", "BlackJackResetScores" },
		keys = {
			{ "<leader><leader>b", vim.cmd.BlackJackNewGame, desc = "BlackJack Addiction" },
		},
	},
	{
		"eandrju/cellular-automaton.nvim",
		keys = {
			-- stylua: ignore start
			{ "<leader><leader>cc", function() vim.cmd.CellularAutomaton("game_of_life") end, desc = "Conway Game of Life" }, -- c for conway.
			{ "<leader><leader>cr", function() vim.cmd.CellularAutomaton("make_it_rain") end, desc = "Your code is raining" },
			-- stylua: ignore end
		},
	},
	{
		"m4xshen/hardtime.nvim",
		event = "VeryLazy",
		opts = {
			max_count = 100, -- don't. I want to spam
			disabled_keys = {},
			disabled_filetypes = {
				"qf",
				"netrw",
				"lazy",
				"minifiles",
				"Navbuddy",
				"help",
				"undotree",
				"diff",
			},
		},
	},
}
