require("nvim-treesitter.configs").setup {
   -- configs
   ensure_installed = {
      "bash",
      "cpp",
      "fennel",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "rust",
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
}
