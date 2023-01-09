require("telescope").setup {
    defaults = {
        path_display = { "smart" },
        file_ignore_patterns = {
            ".git/",
            "__pycache__/*",
            "__pycache__/",
            "%.otf",
            "%.ttf",
            ".idea/",
            ".vscode/",
        },
        winblend = 30,
    },
}

require("telescope").load_extension "frecency"
require("telescope").load_extension "fzf"
