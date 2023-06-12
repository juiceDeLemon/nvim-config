vim.bo.expandtab = false -- use tabs, not spaces
vim.bo.shiftwidth = 0
vim.bo.tabstop = 3 -- how many spaces should a tab render
vim.bo.softtabstop = 3

-- STOLEN FROM https://github.com/sam4llis/nvim-lua-gf/
-- Options to add `gf` functionality inside `.lua` files.
vim.opt_local.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
vim.opt_local.includeexpr = "substitute(v:fname,'\\.','/','g')"
for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
	vim.opt_local.path:append(path .. "/lua")
end
vim.opt_local.suffixesadd:prepend ".lua"
