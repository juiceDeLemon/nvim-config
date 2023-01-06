-- ████████╗███████╗██╗░░░░░███████╗░██████╗░█████╗░░█████╗░██████╗░███████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ╚══██╔══╝██╔════╝██║░░░░░██╔════╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ░░░██║░░░█████╗░░██║░░░░░█████╗░░╚█████╗░██║░░╚═╝██║░░██║██████╔╝█████╗░░░░░██║░░░░░██║░░░██║███████║
-- ░░░██║░░░██╔══╝░░██║░░░░░██╔══╝░░░╚═══██╗██║░░██╗██║░░██║██╔═══╝░██╔══╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ░░░██║░░░███████╗███████╗███████╗██████╔╝╚█████╔╝╚█████╔╝██║░░░░░███████╗██╗███████╗╚██████╔╝██║░░██║
-- ░░░╚═╝░░░╚══════╝╚══════╝╚══════╝╚═════╝░░╚════╝░░╚════╝░╚═╝░░░░░╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
require"telescope".load_extension("project")

telescope.setup {
  defaults = {

    prompt_prefix = icons.ui.Telescope .. " ",
    path_display = { "smart" },
    file_ignore_patterns = {
      ".git/",
      "target/",
      "docs/",
      "vendor/*",
      "%.lock",
      "__pycache__/*",
      "%.sqlite3",
      "%.ipynb",
      "node_modules/*",
      -- "%.jpg",
      -- "%.jpeg",
      -- "%.png",
      "%.svg",
      "%.otf",
      "%.ttf",
      "%.webp",
      ".dart_tool/",
      ".github/",
      ".gradle/",
      ".idea/",
      ".settings/",
      ".vscode/",
      "__pycache__/",
      "build/",
      "env/",
      "gradle/",
      "node_modules/",
      "%.pdb",
      "%.dll",
      "%.class",
      "%.exe",
      "%.cache",
      "%.ico",
      "%.pdf",
      "%.dylib",
      "%.jar",
      "%.docx",
      "%.met",
      "smalljre_*/*",
      ".vale/",
      "%.burp",
      "%.mp4",
      "%.mkv",
      "%.rar",
      "%.zip",
      "%.7z",
      "%.tar",
      "%.bz2",
      "%.epub",
      "%.flac",
      "%.tar.gz",
--     -- Default configuration for builtin pickers goes here:
--     -- picker_name = {
--     --   picker_config_key = value,
--     --   ...
--     -- }
--     -- Now the picker_config_key will be applied every time you call this
--     -- builtin picker
--   },
--   extensions = {
--     media_files = {
--       -- filetypes whitelist
--       -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
--       filetypes = { "png", "webp", "jpg", "jpeg" },
--       find_cmd = "rg", -- find command (defaults to `fd`)
--     },
--   },
}
