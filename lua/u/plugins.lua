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

   -- FOLKE --
   "folke/which-key.nvim",
   "folke/trouble.nvim",
   "folke/todo-comments.nvim",
   { "folke/neodev.nvim", ft = "lua" },

   -- MINI --
   "echasnovski/mini.cursorword",
   "echasnovski/mini.doc",
   "echasnovski/mini.ai",

   -- MY PLUGINS (and testing) --
   { "juiceDeLemon/flight.nvim", dev = true },
   "echasnovski/mini.jump",
   "phaazon/hop.nvim",

   -- USEFUL (misc) PLUGINS --
   "numToStr/Comment.nvim",
   "kylechui/nvim-surround",
   "kevinhwang91/nvim-hlslens",
   "NvChad/nvim-colorizer.lua",
   { "CKolkey/ts-node-action", dependencies = "tpope/vim-repeat" },
   "danymat/neogen",
   { "ThePrimeagen/harpoon", lazy = false },
   {
      "Julian/vim-textobj-variable-segment",
      lazy = false,
      dependencies = "kana/vim-textobj-user",
   },
   {
      "ThePrimeagen/refactoring.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
   },
   { "weilbith/nvim-code-action-menu", lazy = false },

   -- LSP --
   "neovim/nvim-lspconfig",
   "williamboman/mason.nvim",
   "williamboman/mason-lspconfig.nvim",
   "Maan2003/lsp_lines.nvim",
   { "SmiteshP/nvim-navbuddy", dependencies = { "MunifTanjim/nui.nvim", "SmiteshP/nvim-navic" } },
   "jose-elias-alvarez/null-ls.nvim",
   "lvimuser/lsp-inlayhints.nvim",

   -- COMPLETION --
   {
      "hrsh7th/nvim-cmp",
      dependencies = {
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-path",
         "hrsh7th/cmp-cmdline",
         "hrsh7th/cmp-calc",
         "lukas-reineke/cmp-under-comparator",
         "saadparwaiz1/cmp_luasnip",
      },
      event = { "InsertEnter" },
   },

   -- SNIPPETS --
   { "L3MON4D3/LuaSnip", event = { "InsertEnter" } },
   { "rafamadriz/friendly-snippets", lazy = false },

   -- TREESITTER --
   { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate", event = { "InsertEnter" } },
   { "nvim-treesitter/nvim-treesitter-context", lazy = false },

   -- TELESCOPE --
   "nvim-telescope/telescope.nvim",
   { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
   "tsakirist/telescope-lazy.nvim",

   -- TREES --
   "kelly-lin/ranger.nvim",
   { "mbbill/undotree", lazy = false },

   -- GIT --
   "lewis6991/gitsigns.nvim",
   "akinsho/git-conflict.nvim",

   -- EYE-CANDY --
   "goolord/alpha-nvim",
   "shellRaining/hlchunk.nvim",
   "petertriho/nvim-scrollbar",

   -- STATUS LINE --
   "rebelot/heirline.nvim",
   "SmiteshP/nvim-navic",

   -- FUN --
   { "alanfortlink/blackjack.nvim", lazy = false },
   "BooleanCube/keylab.nvim",
   {
      "giusgad/pets.nvim",
      dependencies = { "edluffy/hologram.nvim", "MunifTanjim/nui.nvim" },
   },
   { "alec-gibson/nvim-tetris", lazy = false },

   -- plenary, idk which plugins use this --
   "nvim-lua/plenary.nvim",

   -- ICONS --
   "nvim-tree/nvim-web-devicons",
   "onsails/lspkind.nvim",
}, {
   defaults = { lazy = true },
   install = { colorscheme = { "tokyonight" } },
   dev = { path = os.getenv "HOME" .. "/Repos/neovim_plugins/" },
   performance = {
      rtp = {
         reset = true,
         disabled_plugins = {
            "gzip",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "zipPlugin",
         },
      },
   },
})
