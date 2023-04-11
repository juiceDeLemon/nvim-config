require("scrollbar.handlers.gitsigns").setup()
require("scrollbar.handlers.search").setup()

require("scrollbar").setup {
   show_in_active_only = true,
   hide_if_all_visible = true,
   marks = {
      Cursor = { text = "━" },
      Search = { text = { "━", "═" }, highlight = "ScrollbarSearch" },
      GitAdd = { text = "▌" },
      GitChange = { text = "▌" },
      GitDelete = { text = "✕" },
   },
   handlers = { gitsigns = true, search = true },
}
