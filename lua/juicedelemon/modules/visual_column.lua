local function highlight(visual, cursor)
	if cursor < visual then -- ensure small is smaller than big
		visual, cursor = cursor, visual
	end
	for line = visual, cursor, 1 do
		vim.fn.sign_place(line, "visual_column", "visual_column", "%", { lnum = line }) -- ignore that warning
	end

	vim.fn.sign_unplace("visual_column", { id = vim.fn.line "." }) -- still wanna see yellow current line
end

local function unhighlight()
	vim.fn.sign_unplace "visual_column"
end

-- signs
vim.fn.sign_define("visual_column", { numhl = "GruvboxFg1" })

-- autocmds
local vc_aug = vim.api.nvim_create_augroup("virtual_column", {})
vim.api.nvim_create_autocmd({ "CursorMoved" }, {
	group = vc_aug,
	desc = "highlight visually selected lines in statuscolumn",
	callback = function()
		local m = vim.fn.mode()
		if not (m == "v" or m == "V" or m == "\22") then
			return -- if not visual because ModeChanged sucks ass
		end

		unhighlight() -- clears highlight for boundary changes
		highlight(vim.fn.line "v", vim.fn.line ".") -- highlights
	end,
})
vim.api.nvim_create_autocmd("ModeChanged", { -- check exit visual
	group = vc_aug,
	pattern = { "v:n", "\22:n" }, -- "VisualLeave", prevents visual to visual highlight disappearing
	desc = "clears highlight",
	callback = unhighlight,
})
