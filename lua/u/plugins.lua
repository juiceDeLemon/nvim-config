-- install lazy if not installed
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    -- COLOURSCHEME --
    { "folke/tokyonight.nvim", lazy = false, priority = 1000 },

    -- PLUGINS --
    "numToStr/Comment.nvim",
    "folke/which-key.nvim",
    "kylechui/nvim-surround",
    "kevinhwang91/nvim-hlslens",
    "monaqa/dial.nvim",
    "NvChad/nvim-colorizer.lua",
    "princejoogie/chafa.nvim",
    "folke/trouble.nvim",
    "folke/todo-comments.nvim",

    -- LSP --
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "Maan2003/lsp_lines.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "LostNeophyte/null-ls-embedded",

    -- COMPLETION --
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-calc",
    "lukas-reineke/cmp-under-comparator",
    "saadparwaiz1/cmp_luasnip",

    -- SNIPPETS --
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",

    -- TREESITTER --
    { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/playground",

    -- TELESCOPE --
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    -- TREES --
    "nvim-tree/nvim-tree.lua",
    "mbbill/undotree",

    -- GIT --
    "lewis6991/gitsigns.nvim",
    "akinsho/git-conflict.nvim",
    "kdheepak/lazygit.nvim",

    -- CODE ACTIONS --
    "weilbith/nvim-code-action-menu",
    "kosayoda/nvim-lightbulb",

    -- EYE-CANDY --
    "folke/noice.nvim",
    "echasnovski/mini.animate",
    "goolord/alpha-nvim",
    "lukas-reineke/indent-blankline.nvim",
    "smjonas/inc-rename.nvim",
    "petertriho/nvim-scrollbar",
    "nvim-zh/colorful-winsep.nvim",

    -- STATUS LINE --
    "nvim-lualine/lualine.nvim",
    "utilyre/barbecue.nvim",

    -- MINI --
    "echasnovski/mini.cursorword",
    "echasnovski/mini.move",

    -- DEPENDENCIES --
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "kkharji/sqlite.lua",
    "SmiteshP/nvim-navic",
    "m00qek/baleia.nvim",

    -- ICONS --
    "nvim-tree/nvim-web-devicons",
    "onsails/lspkind.nvim",
}
