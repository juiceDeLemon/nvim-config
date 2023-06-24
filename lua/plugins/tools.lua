return {
	{
		"ThePrimeagen/harpoon",
		keys = {
			{ "<leader>hq", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add File" }, -- q for queue file?
			{ "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Menu" }, -- m for menu
			{ "<leader>ha", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon 1" }, -- home row in dvorak
			{ "<leader>ho", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon 2" },
			{ "<leader>he", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon 3" },
			{ "<leader>hu", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Harpoon 4" },
			{ "<leader>hi", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "Harpoon 5" },
			{ "<leader>hd", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", desc = "Harpoon 6" },
			{ "<leader>hh", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", desc = "Harpoon 7" },
			{ "<leader>ht", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", desc = "Harpoon 8" },
			{ "<leader>hn", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", desc = "Harpoon 9" },
			{ "<leader>hs", "<cmd>lua require('harpoon.ui').nav_file(10)<cr>", desc = "Harpoon 10" },
			-- qwerty version
			-- { "<leader>ha", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon 1" },
			-- { "<leader>hs", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon 2" },
			-- { "<leader>hd", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon 3" },
			-- { "<leader>hf", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Harpoon 4" },
			-- { "<leader>hg", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "Harpoon 5" },
			-- { "<leader>hh", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", desc = "Harpoon 6" },
			-- { "<leader>hj", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", desc = "Harpoon 7" },
			-- { "<leader>hk", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", desc = "Harpoon 8" },
			-- { "<leader>hl", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", desc = "Harpoon 9" },
			-- { "<leader>h;", "<cmd>lua require('harpoon.ui').nav_file(10)<cr>", desc = "Harpoon 10" },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				path_display = { shorten = 4 },
				file_ignore_patterns = {
					".git/",
					"__pycache__/*",
					"__pycache__/",
					"%.otf",
					"%.ttf",
					".idea/",
					".vscode/",
					"venv/*",
					"~/.config/nvim/random_words.txt",
				},
			},
			extensions = {
				lazy = { show_icon = false },
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension "lazy"
			require("telescope").load_extension "menufacture"
		end,
		dependencies = {
			"tsakirist/telescope-lazy.nvim",
			"molecule-man/telescope-menufacture",
		},
		event = "VeryLazy",
		keys = {
			{
				"<leader>fb",
				function()
					vim.cmd.Telescope "buffers"
				end,
				desc = "Buffers",
			},
			{
				"<leader>fc",
				function()
					require("telescope").extensions.menufacture.grep_string()
				end,
				mode = { "n", "v" },
				desc = "Search cword or Visual Selection",
			},
			{
				"<leader>ff",
				function()
					require("telescope").extensions.menufacture.find_files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					require("telescope").extensions.menufacture.git_files()
				end,
				desc = "Find in Git Files",
			},
			{
				"<leader>fh",
				function()
					vim.cmd.Telescope "help_tags"
				end,
				desc = "Help Menu",
			},
			{
				"<leader>fp",
				function()
					require("telescope").extensions.lazy.lazy()
				end,
				desc = "Plugin Links",
			},
			{
				"<leader>fo",
				function()
					vim.cmd.Telescope "oldfiles"
				end,
				desc = "Recent Files",
			},
			{ "<leader>fq", vim.cmd.TodoTelescope, desc = "Todo-Comments" },
			{
				"<leader>fr",
				function()
					vim.cmd.Telescope "resume"
				end,
				desc = "Resume Prompt",
			},
			{
				"<leader>fs",
				function()
					require("telescope").extensions.menufacture.live_grep()
				end,
				desc = "Search String",
			},
			{ "<leader>ft", vim.cmd.Telescope, desc = "Telescope Menu" },
		},
	},
	{
		"echasnovski/mini.files",
		opts = {
			mappings = {
				go_in = "",
				go_in_plus = "L",
				go_out = "",
				go_out_plus = "H",
				synchronize = "<cr>",
			},
			windows = { preview = true },
		},
		keys = {
			{ "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Toggle Explorer" },
		},
	},
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr><c-w>h", desc = "Toggle Undo Tree" },
		},
	},
}
