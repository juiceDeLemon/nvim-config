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
        "yaml",
    },
    sync_install = true,
    auto_install = true,
    -- modules
    highlight = { enable = true },
    -- indent = { enable = true },
    -- extensions
    -- context_commentstring = {
    --   enable = true,
    --   enable_autocmd = false,
    -- },
    -- autotag = {
    --   enable = true,
    --   disable = { "xml", "markdown" },
    -- },
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
