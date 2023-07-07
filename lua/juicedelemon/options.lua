-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- backup/swap
vim.opt.swapfile = false -- causes some issues. use backup
vim.opt.undofile = true
vim.opt.undodir = os.getenv "HOME" .. "/.nvim/undodir"
vim.opt.backup = true
vim.opt.backupdir = os.getenv "HOME" .. "/.nvim/backupdir"

-- tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

-- lines
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.colorcolumn = "80,120"

-- signcolumn
vim.opt.number = true
vim.opt.relativenumber = true

-- displaying lines
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 40
vim.opt.wrap = false

-- displaying texts
vim.opt.list = true
vim.opt.listchars = "eol:¶,tab:> ,lead:!,leadmultispace: ,trail:*,nbsp:N"

-- cursor
vim.opt.mouse = ""
vim.opt.guicursor = ""

-- window behaviour
vim.opt.splitbelow = true
vim.opt.splitright = true

-- others
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.pumheight = 10
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500 -- which key don't mess with this
