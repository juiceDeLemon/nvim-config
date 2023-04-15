require("nvim-treesitter.configs").setup {
   -- configs
   ensure_installed = {
      "bash",
      "cpp",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "vim",
      "vimdoc",
      "yaml",
   },
   sync_install = true,
   auto_install = true,

   -- modules
   highlight = { enable = true },

   incremental_selection = {
      enable = true,
      keymaps = {
         init_selection = "<cr>", -- set to `false` to disable one of the mappings
         scope_incremental = "<cr>",
         node_incremental = "<tab>",
         node_decremental = "<s-tab>",
      },
   },

   -- extensions
   -- textobjects = {
   --   select = {
   --     enable = true,
   --     -- Automatically jump forward to textobj, similar to targets.vim
   --     lookahead = true,
   --     keymaps = {
   --       -- You can use the capture groups defined in textobjects.scm
   --       ["af"] = "@function.outer",
   --       ["if"] = "@function.inner",
   --       ["at"] = "@class.outer",
   --       ["it"] = "@class.inner",
   --       ["ac"] = "@call.outer",
   --       ["ic"] = "@call.inner",
   --       ["aa"] = "@parameter.outer",
   --       ["ia"] = "@parameter.inner",
   --       ["al"] = "@loop.outer",
   --       ["il"] = "@loop.inner",
   --       ["ai"] = "@conditional.outer",
   --       ["ii"] = "@conditional.inner",
   --       ["a/"] = "@comment.outer",
   --       ["i/"] = "@comment.inner",
   --       ["ab"] = "@block.outer",
   --       ["ib"] = "@block.inner",
   --       ["as"] = "@statement.outer",
   --       ["is"] = "@scopename.inner",
   --       ["aA"] = "@attribute.outer",
   --       ["iA"] = "@attribute.inner",
   --       ["aF"] = "@frame.outer",
   --       ["iF"] = "@frame.inner",
   --     },
   --   },
   --   move = {
   --     enable = true,
   --     set_jumps = true, -- whether to set jumps in the jumplist
   --     goto_next_start = {
   --       ["]m"] = "@function.outer",
   --       ["]]"] = "@class.outer",
   --     },
   --     goto_next_end = {
   --       ["]M"] = "@function.outer",
   --       ["]["] = "@class.outer",
   --     },
   --     goto_previous_start = {
   --       ["[m"] = "@function.outer",
   --       ["[["] = "@class.outer",
   --     },
   --     goto_previous_end = {
   --       ["[M"] = "@function.outer",
   --       ["[]"] = "@class.outer",
   --     },
   --   },
   --   swap = {
   --     enable = true,
   --     swap_next = {
   --       ["<leader>."] = "@parameter.inner",
   --     },
   --     swap_previous = {
   --       ["<leader>,"] = "@parameter.inner",
   --     },
   --   },
   -- },
}
