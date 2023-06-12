require("todo-comments").setup {
	keywords = {
		FIX = { icon = "?" }, -- blunder
		TODO = { icon = "i", color = "info" }, -- information centre
		HACK = { icon = "@", color = "warning" }, -- idk about hacking
		WARN = { icon = "^", color = "warning", alt = { "WARNING", "XXX" } }, -- triangle
		PERF = { icon = "!", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } }, -- brilliant
		NOTE = { icon = "o", color = "hint", alt = { "INFO" } }, -- comment box?
		TEST = { icon = "v", color = "test", alt = { "TESTING", "PASSED", "FAILED" } }, -- passed test
	},
	highlight = { before = "fg", keyword = "bg" },
}
