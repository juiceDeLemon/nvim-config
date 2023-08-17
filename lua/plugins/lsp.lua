local on_attach = function(client, bufnr)
	local map = vim.keymap.set
	-- stylua: ignore start
	map({ "n", "v", "o" }, "<leader>l", "", { desc = "LSP" })
	map("n", "K", function() vim.lsp.buf.hover() end, { noremap = true, silent = true })
	map("n", "gd", function() vim.cmd.TroubleToggle("lsp_definitions")end, { noremap = true, silent = true, desc = "Definitions" })
	map("n", "gD", function() vim.lsp.buf.declaration() end, { noremap = true, silent = true, desc = "Declarations" })
	map("n", "gI", function() vim.lsp.buf.implementation() end, { noremap = true, silent = true, desc = "Implementations" })
	map("n", "gr", function() vim.cmd.TroubleToggle("lsp_references") end, { noremap = true, silent = true, desc = "References" })
	map("n", "<leader>la", function() vim.lsp.buf.code_action() end, { noremap = true, silent = true, desc = "Code Action" })
	if vim.b.lsp_format_activate == nil then
		map("n", "<leader>lf", function() vim.lsp.buf.format() end, { silent = true, desc = "Format File" })
	end
	map({ "n", "v", "o" }, "<leader>lh", function() vim.diagnostic.goto_prev({buffer=0}) end, { noremap = true, silent = true, desc = "Previous" })
	map({ "n", "v", "o" }, "<leader>ll", function() vim.diagnostic.goto_next({buffer=0}) end, { noremap = true, silent = true, desc = "Next" })
	map("n", "<leader>lr", function() vim.lsp.buf.rename() end, { noremap = true, silent = true, desc = "Rename Symbol" })
	map("n", "<leader>ls", function() vim.lsp.buf.signature_help() end, { noremap = true, silent = true, desc = "Signature Help" })
	map({ "i", "s" }, "<c-s>", function() vim.lsp.buf.signature_help() end, { noremap = true, silent = true, desc = "Signature Help" })
	map("n", "<leader>lt", function() require"lsp_lines".toggle() end, { noremap = true, silent = true, desc = "Toggle LspLines" })
	map("n", "<leader>lq", function() vim.cmd.TroubleToggle("document_diagnostics") end, { noremap = true, silent = true, desc = "Diagnostics" })
	-- stylua: ignore end
	require("nvim-navic").attach(client, bufnr)
	require("nvim-navbuddy").attach(client, bufnr)
	-- navbuddy
	map("n", "<leader>o", vim.cmd.Navbuddy, { desc = "Navbuddy" })
end

-- no dependencies relationship because they work together
return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lsp = require "lspconfig"
			local cmp_cap = require("cmp_nvim_lsp").default_capabilities()

			-- lua
			require("neodev").setup()
			lsp.lua_ls.setup {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim", "require", "pp" } },
						format = { enable = false },
						workspace = { checkThirdParty = false }, -- remove that annoying popup https://github.com/neovim/nvim-lspconfig/issues/1700
						hint = { enabled = true },
					},
				},
				on_attach = on_attach,
				capabilities = cmp_cap,
			}
			-- rust
			lsp.rust_analyzer.setup {
				settings = {
					["rust-analyzer"] = {
						check = {
							command = "clippy",
							features = "all",
						},
					},
				},
				on_attach = on_attach,
				capabilities = cmp_cap,
				cmd = { "rustup", "run", "stable", "rust-analyzer" },
			}
			-- haskell
			lsp.hls.setup {
				settings = {
					haskell = { formattingProvider = "stylish-haskell" },
				},
				on_attach = on_attach,
				capabilities = cmp_cap,
				filetypes = { "haskell", "lhaskell", "cabal" },
			}
			-- python
			lsp.pyright.setup {
				settings = {
					python = {
						analysis = {
							autoImportCompletions = true,
						},
					},
				},
				on_attach = on_attach,
				capabilities = cmp_cap,
			}
			-- bash
			lsp.bashls.setup {
				on_attach = on_attach,
				capabilities = cmp_cap,
			}
			-- markdown
			lsp.marksman.setup {
				on_attach = on_attach,
				capabilities = cmp_cap,
			}
			-- json
			local json_capabilities = vim.lsp.protocol.make_client_capabilities()
			json_capabilities.textDocument.completion.completionItem.snippetSupport = true
			lsp.jsonls.setup {
				on_attach = on_attach,
				capabilities = json_capabilities,
			}

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})
		end,
		dependencies = { "folke/neodev.nvim" },
		event = "VeryLazy",
	},
	{
		"Maan2003/lsp_lines.nvim",
		config = function()
			local ll = require "lsp_lines"
			ll.setup()
			ll.toggle()
		end,
		event = "LspAttach",
	},
	{
		"SmiteshP/nvim-navbuddy",
		opts = {
			icons = {
				Array = "",
				Boolean = "",
				Key = "",
				Namespace = "",
				Null = "",
				Number = "",
				Object = "",
				Package = "",
				String = "",
				Method = "",
				Function = "",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "",
				Interface = "",
				Module = "",
				Property = "",
				Enum = "",
				File = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			},
		},
		dependencies = { "MunifTanjim/nui.nvim", "SmiteshP/nvim-navic" },
		event = "LspAttach",
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require "lint"

			lint.linters_by_ft = {
				python = { "ruff" },
			}

			vim.api.nvim_create_autocmd({ "LspAttach", "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
		event = "LspAttach",
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		opts = {
			text = { spinner = "bouncing_bar" },
			window = { blend = 0 },
		},
		event = "LspAttach",
	},
	{
		"folke/trouble.nvim",
		opts = {
			icons = false,
			fold_open = "v",
			fold_closed = ">",
			use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
		},
		event = "LspAttach",
	},
}
