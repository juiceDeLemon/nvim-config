-- install lazy if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require"lazy".setup {
    -- COLOURSCHEME --
    { "folke/tokyonight.nvim", lazy = false, priority = 1000 },

    -- PLUGINS --
    "numToStr/Comment.nvim",
    "folke/which-key.nvim",

    -- LSP --
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- TREESITTER --
    { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/playground",

    -- TREES --
    "nvim-tree/nvim-tree.lua",
    "mbbill/undotree",

    -- TELESCOPE --
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    -- DEPENDENCIES --
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "kkharji/sqlite.lua",

    -- ICONS --
    "nvim-tree/nvim-web-devicons",
}
