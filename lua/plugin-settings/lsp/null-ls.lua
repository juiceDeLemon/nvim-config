-- ███╗░░██╗██╗░░░██╗██╗░░░░░██╗░░░░░░░░░░░██╗░░░░░░██████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ████╗░██║██║░░░██║██║░░░░░██║░░░░░░░░░░░██║░░░░░██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██╔██╗██║██║░░░██║██║░░░░░██║░░░░░█████╗██║░░░░░╚█████╗░░░░██║░░░░░██║░░░██║███████║
-- ██║╚████║██║░░░██║██║░░░░░██║░░░░░╚════╝██║░░░░░░╚═══██╗░░░██║░░░░░██║░░░██║██╔══██║
-- ██║░╚███║╚██████╔╝███████╗███████╗░░░░░░███████╗██████╔╝██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝░░╚══╝░╚═════╝░╚══════╝╚══════╝░░░░░░╚══════╝╚═════╝░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

local null_status_ok, null_ls = pcall(require, "null-ls")
if not null_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup({
	autostart = true,
	debug = false,
	sources = {
        formatting.eslint, -- js / ts / frameworks require plugins
        formatting.autopep8, -- python
		formatting.stylua, -- lua
		formatting.google_java_format, -- java
		formatting.clang_format, -- mainly c and cpp
		diagnostics.flake8,
	},
})
