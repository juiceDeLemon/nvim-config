local dap = require "dap"
local dapui = require "dapui"

dapui.setup()
require("nvim-dap-repl-highlights").setup()
require("nvim-dap-virtual-text").setup()

-- catppuccin sign stuff
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
map("", "<leader>dn", "<cmd>lua require('dap-python').test_method()<cr>", { noremap = true, desc = "Test Method" })
map("n", "<leader>df", "<cmd>lua require('dap-python').test_class()<cr>", { noremap = true, desc = "Test Class" })
map(
	"v",
	"<leader>ds",
	"<esc><cmd>lua require('dap-python').debug_selection()<cr>",
	{ noremap = true, desc = "Debug Selection" }
)
