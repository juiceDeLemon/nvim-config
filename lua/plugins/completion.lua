return {
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require "cmp"
			local snip = require "luasnip"

			cmp.setup {
				enabled = function() -- prevent telescope
					if vim.bo.buftype == "prompt" then
						return false
					end
					return true
				end,
				preselect = cmp.PreselectMode.Item,
				snippet = {
					expand = function(args)
						snip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert {
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-y>"] = cmp.mapping.confirm {
						select = true,
						behavior = cmp.ConfirmBehavior.Replace,
					},
					["<C-e>"] = cmp.mapping.abort(),
					["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
					["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
					["<C-b>"] = cmp.mapping(function(fallback)
						if snip.jumpable(-1) then
							snip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-f>"] = cmp.mapping(function(fallback)
						if snip.expand_or_jumpable() then
							snip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
				},
				sources = cmp.config.sources {
					{ name = "luasnip", group_index = 1 },
					{ name = "nvim_lsp", group_index = 2 },
				},
				sorting = {
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.recently_used,
						cmp.config.compare.score,
						-- stolen from tj's config, which is stolen from cmp-under-comparator
						function(entry1, entry2)
							local _, entry1_under = entry1.completion_item.label:find "^_+"
							local _, entry2_under = entry2.completion_item.label:find "^_+"
							entry1_under = entry1_under or 0
							entry2_under = entry2_under or 0
							if entry1_under > entry2_under then
								return false
							elseif entry1_under < entry2_under then
								return true
							end
						end,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						vim_item.menu = ({
							luasnip = "[Snips]",
							nvim_lsp = "[Lsp]",
							nvim_lua = "[Vim]",
							buffer = "[Buf]",
						})[entry.source.name]
						return vim_item
					end,
				},
				experimental = { ghost_text = true },
			}

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline {
					["<C-p>"] = cmp.mapping.select_prev_item {
						behavior = cmp.SelectBehavior.Select,
					},
					["<C-n>"] = cmp.mapping.select_next_item {
						behavior = cmp.SelectBehavior.Select,
					},
				},
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline {
					["<C-p>"] = cmp.mapping.select_prev_item {
						behavior = cmp.SelectBehavior.Select,
					},
					["<C-n>"] = cmp.mapping.select_next_item {
						behavior = cmp.SelectBehavior.Select,
					},
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "cmdline" },
				},
			})
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		event = { "InsertEnter", "CmdlineEnter" },
	},
	{
		"L3MON4D3/LuaSnip",
		config = function()
			local snip = require "luasnip"

			-- choice node selection
			vim.keymap.set("i", "<c-l>", function()
				if snip.choice_active() then
					snip.change_choice(1)
				end
			end)

			-- snip creator
			-- s(<trigger>, <nodes>)
			local s = snip.s
			-- text node
			-- t(<line1>, <line2> etc)
			local t = snip.text_node
			local i = snip.insert_node
			-- fmt mode
			-- fmt(<string>, { nodes })
			local fmt = require("luasnip.extras.fmt").fmt
			-- choice node
			-- c(<pos>, { nodes })
			local c = snip.choice_node

			snip.add_snippets("all", {
				s(
					"todo-comments",
					fmt(
						"{}: ",
						{ c(1, { t "FIX", t "BUG", t "TODO", t "INFO", t "WARN", t "OPTIMIZE", t "NOTE", t "TEST" }) }
					)
				),
			})
			snip.add_snippets("lua", {
				-- stylua comments
				s("styluaignore", fmt("-- stylua: ignore {}", { c(1, { t "start", t "end", t "" }) })),
				-- the keymap thing
				s("<cmd>", fmt("<cmd>{}<cr>", { i(1) })),
			})

			-- friendly-snip
			-- copied from https://github.com/L3MON4D3/LuaSnip/issues/37
			vim.o.runtimepath = vim.o.runtimepath .. os.getenv "HOME" .. "/.config/nvim/lua/friendly-snippets"
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
		event = { "InsertEnter" },
		dependencies = { "rafamadriz/friendly-snippets" }, -- if there is no snippets then we must put lazy=false down there
	},
	{
		"Exafunction/codeium.vim",
		config = function() -- won't work if use keys = { ... }
			local map = vim.keymap.set
			map("i", "<Tab>", function() -- fix tab only inserts a tab
				return vim.fn["codeium#Accept"]() -- must keep the return <insert idk face>
			end, { expr = true, silent = true, nowait = true })
			map("i", "<M-s>", function()
				vim.g.codeium_enabled = not vim.g.codeium_enabled
			end, { desc = "Toggle Codeium" })
			-- weird plugin
		end,
		event = "VeryLazy",
	},
}
