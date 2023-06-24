return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
		"LiadOz/nvim-dap-repl-highlights",
	},
	config = function()
		local dap = require "dap"
		local dapui = require "dapui"

		dapui.setup()
		require("nvim-dap-repl-highlights").setup()
		require("nvim-dap-virtual-text").setup()

		-- catppuccin, sign stuff
		local sign = vim.fn.sign_define
		sign("DapBreakpoint", { text = "ඞ", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		sign("DapBreakpointCondition", { text = "C", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
		sign("DapLogPoint", { text = "L", texthl = "DapLogPoint", linehl = "", numhl = "" })

		-- automagically open/cloes dapui when listen do something
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- python
		local map = vim.keymap.set
		require("dap-python").setup(os.getenv "HOME" .. "/.venv/nvim-python/bin/python")
		-- stylua: ignore start
		map("", "<leader>dn", "<cmd>lua require('dap-python').test_method()<cr>", { noremap = true, desc = "Test Method" })
		map("n", "<leader>df", "<cmd>lua require('dap-python').test_class()<cr>", { noremap = true, desc = "Test Class" })
		map("v", "<leader>ds", "<esc><cmd>lua require('dap-python').debug_selection()<cr>", { noremap = true, desc = "Debug Selection" })
		-- stylua: ignore end
	end,
	-- event = "VeryLazy", -- keys won't matter unless i no longer use the heirline
	keys = {
		{ "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Set Breakpoint" },
		{
			"<leader>dc",
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
			desc = "Set Condition Breakpoint",
		},
		{ "<leader>d5", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
		{ "<leader>d10", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
		{ "<leader>d11", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
		{ "<leader>d12", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
		{ "<leader>dd", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI" },
	},
}
