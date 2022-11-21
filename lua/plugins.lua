-- ██████╗░██╗░░░░░██╗░░░██╗░██████╗░██╗███╗░░██╗░██████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔══██╗██║░░░░░██║░░░██║██╔════╝░██║████╗░██║██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██████╔╝██║░░░░░██║░░░██║██║░░██╗░██║██╔██╗██║╚█████╗░░░░██║░░░░░██║░░░██║███████║
-- ██╔═══╝░██║░░░░░██║░░░██║██║░░╚██╗██║██║╚████║░╚═══██╗░░░██║░░░░░██║░░░██║██╔══██║
-- ██║░░░░░███████╗╚██████╔╝╚██████╔╝██║██║░╚███║██████╔╝██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝░░░░░╚══════╝░╚═════╝░░╚═════╝░╚═╝╚═╝░░╚══╝╚═════╝░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
-- jump to 45
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "plugins.lua" },
    callback = function() vim.cmd [[ source <afile> | PackerSync ]] end
,
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function() return require("packer.util").float { border = "rounded" } end
,
    },
}

return packer.startup(function(use)
    -- HIS MAJESTY --
    use "monsonjeremy/onedark.nvim" -- luv you very much

    -- GENERAL --
    use "nvim-lua/plenary.nvim" -- many lua functions
    use "wbthomason/packer.nvim" -- packer
    use { "kyazdani42/nvim-tree.lua" } -- tree
    use "akinsho/toggleterm.nvim" -- terminal in neovim
    use "ahmedkhalf/project.nvim" -- project management
    use "kevinhwang91/promise-async" -- ufo dependencies

    -- ENHANCEMENTS --
    use "lewis6991/impatient.nvim" -- improve performance
    use "moll/vim-bbye" -- :Bd over :bd
    use "nacro90/numb.nvim" -- peek line when entering go to line in commandline
    use "jghauser/mkdir.nvim" -- add dir when creating files when dir is not found

    -- FUNCTIONAL --
    use "numToStr/Comment.nvim" -- comments
    use "kylechui/nvim-surround" -- add/remove quotes
    use "windwp/nvim-autopairs" -- add closing brackets
    use "abecodes/tabout.nvim" -- use tab to get out of brackets
    use "folke/which-key.nvim" -- keybinds help
    use "monaqa/dial.nvim" -- inc/dec value and toggle boolean-like keywords/booleans
    use "axelvc/template-string.nvim" -- JS change string to template string vice versa
    use "NvChad/nvim-colorizer.lua" -- highlight hex, css etc
    use "goolord/alpha-nvim" -- dashboard

    -- VISUALS --
    use "nvim-lua/popup.nvim" -- popup api
    use "folke/noice.nvim" -- new ui for messages cmdline and popupmenus
    use "RRethy/vim-illuminate" -- highlight same word
    use "lukas-reineke/indent-blankline.nvim" -- lines of indentation
    use "smjonas/inc-rename.nvim" -- eye-candy symbol rename
    use "tamton-aquib/duck.nvim" -- duck good
    use "rcarriga/nvim-notify" -- noice dependencies
    use "MunifTanjim/nui.nvim" -- noice dependencies
    use "petertriho/nvim-scrollbar" -- scrollbar
    use "kevinhwang91/nvim-hlslens" -- noice looks book and support for scrollbar
    use "nvim-zh/colorful-winsep.nvim" -- make window separators better
    use "fedepujol/move.nvim" -- move line/block up/down
    use "levouh/tint.nvim" -- tint inactive window
    use "karb94/neoscroll.nvim" -- smooth scrolling
    use "kevinhwang91/nvim-ufo" -- folds

    -- STATUS LINES --
    use "nvim-lualine/lualine.nvim" -- status bar
    use "kdheepak/tabline.nvim" -- tabline

    -- ICONS --
    use "kyazdani42/nvim-web-devicons" -- tree icons
    use "onsails/lspkind.nvim" -- lsp icons

    -- COMPLETION PLUGINS --
    use "hrsh7th/nvim-cmp" -- core
    use "hrsh7th/cmp-nvim-lsp" -- lsp
    use "hrsh7th/cmp-buffer" -- buffer
    use "hrsh7th/cmp-path" -- path
    use "hrsh7th/cmp-cmdline" -- commandline
    use "hrsh7th/cmp-nvim-lua" -- vim options
    use "petertriho/cmp-git" -- git
    use "hrsh7th/cmp-emoji" -- lovely emoji
    use "saadparwaiz1/cmp_luasnip" -- snippet

    -- SNIPPETS --
    use "L3MON4D3/LuaSnip" -- snippets
    use "rafamadriz/friendly-snippets" -- a lot of snippets

    -- LSP --
    use "neovim/nvim-lspconfig" -- enable
    use "williamboman/nvim-lsp-installer" -- server installer
    use "jose-elias-alvarez/null-ls.nvim" -- formatters, linter, code actions
    use "b0o/schemastore.nvim" -- schema
    use "SmiteshP/nvim-navic" -- breadcrumb

    -- TELESCOPE --
    use "nvim-telescope/telescope.nvim" -- telescope itself
    use "nvim-telescope/telescope-project.nvim" -- project

    -- TREESITTER --
    use {
        "nvim-treesitter/nvim-treesitter",
        commit = "9bfaf62e42bdcd042df1230e9188487e62a112c0",
        run = ":TSUpdate",
    } -- eye candy
    use "p00f/nvim-ts-rainbow" -- highlight brackets
    use "m-demare/hlargs.nvim" -- highlight arguments in another way
    use "nvim-treesitter/nvim-treesitter-context" -- show start of code block at the top
    use "andymass/vim-matchup" -- extended % to keywords like if else
    use "windwp/nvim-ts-autotag" -- auto close and rename html/php etc tags

    -- GIT --
    use "lewis6991/gitsigns.nvim" -- git diff bar
    use "akinsho/git-conflict.nvim" -- conflict solver
    use "kdheepak/lazygit.nvim" -- lazygit in neovim

    -- DAP --
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "Pocco81/DAPInstall.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require("packer").sync() end
end
)
