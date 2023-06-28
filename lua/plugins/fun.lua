return {
	{
		"alanfortlink/blackjack.nvim",
		cmd = { "BlackJackNewGame", "BlackJackResetScores" },
		keys = {
			{ "<leader><leader>b", vim.cmd.BlackJackNewGame, desc = "BlackJack Addiction" },
		},
	},
	{
		"alec-gibson/nvim-tetris",
		cmd = "Tetris",
		keys = {
			{ "<leader><leader>t", vim.cmd.Tetris, desc = "Tetris Addiction" },
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
		opts = { disabled_filetypes = { "qf", "netrw", "lazy", "minifiles", "Navbuddy" } },
	},
}
