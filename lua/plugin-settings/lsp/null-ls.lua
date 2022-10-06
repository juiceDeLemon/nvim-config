-- ███╗░░██╗██╗░░░██╗██╗░░░░░██╗░░░░░░░░░░░██╗░░░░░░██████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ████╗░██║██║░░░██║██║░░░░░██║░░░░░░░░░░░██║░░░░░██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██╔██╗██║██║░░░██║██║░░░░░██║░░░░░█████╗██║░░░░░╚█████╗░░░░██║░░░░░██║░░░██║███████║
-- ██║╚████║██║░░░██║██║░░░░░██║░░░░░╚════╝██║░░░░░░╚═══██╗░░░██║░░░░░██║░░░██║██╔══██║
-- ██║░╚███║╚██████╔╝███████╗███████╗░░░░░░███████╗██████╔╝██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝░░╚══╝░╚═════╝░╚══════╝╚══════╝░░░░░░╚══════╝╚═════╝░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local null_format = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local null_diag = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local no_emacs = {
	method = null_ls.methods.DIAGNOSTICS,
	filetypes = { "markdown", "text" },
	generator = {
		fn = function(params)
			local diagnostics = {}
			-- sources have access to a params object
			-- containing info about the current file and editor state
			for i, line in ipairs(params.content) do
				local col, end_col = line:find("emacs")
				if col and end_col then
					-- null-ls fills in undefined positions
					-- and converts source diagnostics into the required format
					table.insert(diagnostics, {
						row = i,
						col = col,
						end_col = end_col + 1,
						source = "no-emacs",
						message = 'Don\'t use "emacs"',
						severity = vim.diagnostic.severity.HINT,
					})
				end
			end
			return diagnostics
		end,
	},
}

null_ls.setup({
	autostart = true,
	debug = false,
	sources = {
		null_format.eslint, -- js / ts / frameworks require plugins
		null_format.autopep8, -- python
		null_format.stylua, -- lua
		null_format.google_java_format, -- java
		null_format.clang_format, -- mainly c and cpp
		null_diag.flake8,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end -- autosave
	end,
})

null_ls.register(no_emacs)
