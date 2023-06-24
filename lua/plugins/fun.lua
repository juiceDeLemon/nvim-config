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
			{ "<leader><leader>cc", "<cmd>CellularAutomaton game_of_life<cr>", desc = "Conway Game of Life" }, -- c for conway.
			{ "<leader><leader>cr", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Your code is raining" },
		},
	},
}
