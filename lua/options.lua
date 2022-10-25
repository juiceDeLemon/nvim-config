-- ░█████╗░██████╗░████████╗██╗░█████╗░███╗░░██╗░██████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║░░██║██████╔╝░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░░░░██║░░░░░██║░░░██║███████║
-- ██║░░██║██╔═══╝░░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗░░░██║░░░░░██║░░░██║██╔══██║
-- ╚█████╔╝██║░░░░░░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝██╗███████╗╚██████╔╝██║░░██║
-- ░╚════╝░╚═╝░░░░░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local options = {
    backup = false, -- creates a backup file
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    pumheight = 10, -- pop up menu height
    showtabline = 1, -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    autoindent = true, -- make indenting auto
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colors (most terminals support this)
    timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, -- enable persistent undo
    updatetime = 100, -- faster completion (4000ms default)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 2, -- the number of spaces inserted for each indentation
    tabstop = 2, -- insert 2 spaces for a tab
    cursorline = true, -- highlight the current line
    cursorcolumn = true, -- highlight the current column
    number = true, -- set numbered lines
    laststatus = 3,
    relativenumber = true, -- set relative numbered lines
    numberwidth = 4, -- set number column width to 2 {default 4}
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    scrolloff = 20, -- auto <z><z>
    sidescrolloff = 40, -- scrolloff but vertical
    wrap = false, -- disable a long line wrapping to the next lin
    winblend = 30, -- enables pseudo-transparency for floating windows 
    pumblend = 30, -- enables pseudo-transparency for popup menu
    linespace = 2, -- add 2 pixels of padding between lines
    guifont = "JetBrainsMono NF", -- make sure to download the font (included in the JetBrainsMono file)
}

-- execute the options
for k, v in pairs(options) do vim.opt[k] = v end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- Don't know if this works

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
