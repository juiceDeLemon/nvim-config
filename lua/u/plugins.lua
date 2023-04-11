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

require("lazy").setup({
   -- COLOURSCHEME --
   { "folke/tokyonight.nvim", priority = 1000 },

   -- DEDICATED TO FOLKE --
   "folke/which-key.nvim",
   "folke/trouble.nvim",
   "folke/todo-comments.nvim",
   "folke/neodev.nvim",

   -- DEDICATED TO THE MINI SERIES --
   "echasnovski/mini.cursorword",
   "echasnovski/mini.move",

   -- MY PLUGINS --
   { "juiceDeLemon/flight.nvim", dev = true },
   "echasnovski/mini.jump",

   -- USEFUL (misc) PLUGINS --
   "numToStr/Comment.nvim",
   "kylechui/nvim-surround",
   "kevinhwang91/nvim-hlslens",
   "NvChad/nvim-colorizer.lua",
   "olimorris/persisted.nvim",
   "CKolkey/ts-node-action",
   "danymat/neogen",
   { "Julian/vim-textobj-variable-segment", lazy = false }, -- buggy, works half the time

   -- LSP --
   "neovim/nvim-lspconfig",
   "williamboman/mason.nvim",
   "williamboman/mason-lspconfig.nvim",
   "Maan2003/lsp_lines.nvim",
   "SmiteshP/nvim-navbuddy",
   "jose-elias-alvarez/null-ls.nvim",
   "LostNeophyte/null-ls-embedded",

   -- COMPLETION --
   "hrsh7th/nvim-cmp",
   "hrsh7th/cmp-nvim-lsp",
   { "hrsh7th/cmp-buffer", lazy = false },
   { "hrsh7th/cmp-path", lazy = false },
   { "hrsh7th/cmp-cmdline", lazy = false },
   { "hrsh7th/cmp-calc", lazy = false },
   "lukas-reineke/cmp-under-comparator",
   { "saadparwaiz1/cmp_luasnip", lazy = false },

   -- SNIPPETS --
   "L3MON4D3/LuaSnip",
   { "rafamadriz/friendly-snippets", lazy = false },

   -- TREESITTER --
   { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
   { "nvim-treesitter/nvim-treesitter-context", lazy = false },

   -- TELESCOPE --
   "nvim-telescope/telescope.nvim",
   "nvim-telescope/telescope-frecency.nvim",
   { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
   "tsakirist/telescope-lazy.nvim",

   -- TREES --
   "nvim-tree/nvim-tree.lua",
   { "mbbill/undotree", lazy = false },

   -- GIT --
   "lewis6991/gitsigns.nvim",
   "akinsho/git-conflict.nvim",

   -- CODE ACTIONS --
   { "weilbith/nvim-code-action-menu", lazy = false },
   "kosayoda/nvim-lightbulb",

   -- EYE-CANDY --
   "goolord/alpha-nvim",
   "lukas-reineke/indent-blankline.nvim",
   "petertriho/nvim-scrollbar",

   -- STATUS LINE --
   "nvim-lualine/lualine.nvim",
   "utilyre/barbecue.nvim",

   -- FUN GAMES --
   { "alanfortlink/blackjack.nvim", lazy = false },
   { "alec-gibson/nvim-tetris", lazy = false },

   -- DEPENDENCIES --
   "nvim-lua/plenary.nvim",
   "MunifTanjim/nui.nvim", -- navbuddy
   { "kkharji/sqlite.lua", lazy = false }, -- telescope-frequency
   "SmiteshP/nvim-navic", -- barbecue, navbuddy
   "tpope/vim-repeat", -- ts-node-action
   { "kana/vim-textobj-user", lazy = false }, -- vim-textobj-variable-segment

   -- ICONS --
   "nvim-tree/nvim-web-devicons",
   "onsails/lspkind.nvim",
}, {
   defaults = { lazy = true },
   install = { colorscheme = { "tokyonight" } },
   dev = { path = "~/Repos/neovim_plugins/" },
})
