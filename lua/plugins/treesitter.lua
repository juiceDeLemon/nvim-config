return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{
				"CKolkey/ts-node-action",
				config = function()
					-- moded from lua/ts-node-action/actions/ in the repo
					local helpers = require "ts-node-action.helpers"

					local toggle_boolean = function(boolean_pair_override)
						local boolean_pair = vim.tbl_deep_extend(
							"force",
							{ ["and"] = "or", ["or"] = "and" },
							boolean_pair_override or {}
						)
						local function action(node)
							return boolean_pair[helpers.node_text(node)] or helpers.node_text(node)
						end
						return { { action, name = "Toggle Boolean" } }
					end

					require("ts-node-action").setup { ["*"] = { ["boolean_operator"] = toggle_boolean() } }
				end,
				event = "VeryLazy",
				dependencies = "tpope/vim-repeat",
			},
			{ "nvim-treesitter/nvim-treesitter-context", event = "VeryLazy" },
		},
		opts = {
			-- configs
			ensure_installed = {
				"bash",
				"comment",
				"dap_repl",
				"fennel",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"rust",
				"vim",
				"vimdoc",
				"yaml",
			},
			sync_install = true,
			auto_install = true,

			-- modules
			highlight = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<cr>", -- set to `false` to disable one of the mappings
					scope_incremental = "<cr>",
					node_incremental = "<tab>",
					node_decremental = "<s-tab>",
				},
			},
		},
		main = "nvim-treesitter.configs",
		build = "<cmd>TSUpdate<cr>",
		event = "VeryLazy",
	},
}
