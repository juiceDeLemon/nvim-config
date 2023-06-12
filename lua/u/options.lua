vim.opt.backup = false
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.pumheight = 10
vim.opt.showtabline = 2
vim.opt.showmode = false -- don't output -- MODE
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.undofile = true
vim.opt.undodir = os.getenv "HOME" .. "/.nvim/undodir"
vim.opt.updatetime = 50
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.colorcolumn = "80,120"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 3
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 40
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = "eol:¶,tab:|>,space:.,trail:*"
vim.opt.mouse = ""
vim.opt.splitbelow = true
vim.opt.splitright = true
