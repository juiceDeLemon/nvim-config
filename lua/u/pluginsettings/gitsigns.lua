require("gitsigns").setup {
   signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = {
         hl = "GitSignsAdd",
         text = "▎",
         numhl = "GitSignsAddNr",
         linehl = "GitSignsAddLn",
      },
   },
   signcolumn = true,
   preview_config = {
      -- Options passed to nvim_open_win
      border = "rounded",
      style = "minimal",
      relative = "cursor",
   },
   yadm = { enable = true },
}
