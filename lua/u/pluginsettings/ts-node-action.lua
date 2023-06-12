-- moded from lua/ts-node-action/actions/ in the repo
local helpers = require "ts-node-action.helpers"

local toggle_boolean = function(boolean_pair_override)
	local boolean_pair = vim.tbl_deep_extend("force", { ["and"] = "or", ["or"] = "and" }, boolean_pair_override or {})
	local function action(node)
		return boolean_pair[helpers.node_text(node)] or helpers.node_text(node)
	end
	return { { action, name = "Toggle Boolean" } }
end

require("ts-node-action").setup { ["*"] = { ["boolean_operator"] = toggle_boolean() } }
