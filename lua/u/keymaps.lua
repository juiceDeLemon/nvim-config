-- ██╗░░██╗███████╗██╗░░░██╗███╗░░░███╗░█████╗░██████╗░░██████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██║░██╔╝██╔════╝╚██╗░██╔╝████╗░████║██╔══██╗██╔══██╗██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- █████═╝░█████╗░░░╚████╔╝░██╔████╔██║███████║██████╔╝╚█████╗░░░░██║░░░░░██║░░░██║███████║
-- ██╔═██╗░██╔══╝░░░░╚██╔╝░░██║╚██╔╝██║██╔══██║██╔═══╝░░╚═══██╗░░░██║░░░░░██║░░░██║██╔══██║
-- ██║░╚██╗███████╗░░░██║░░░██║░╚═╝░██║██║░░██║██║░░░░░██████╔╝██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═════╝░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
------------------------
-- COMMONLY USED CODE --
------------------------
local opts = { noremap = true, silent = true }

-- idk what this does
-- local term_opts = { silent = true }

local keymap = vim.keymap.set

---------------
-- REMINDERS --
---------------
-- n = normal mode
-- i = insert mode
-- v = visual and select mode
-- s = select mode
-- x = visual mode
-- c = command-line mode
-- o = operator pending mode

-- put character in the place of *
-- CTRL = <c-*> (alt = a, meta = m)
-- FUNCTION = <F*>
-- ESCAPE = <ESC>
-- RETURN(ENTER) = <cr>
-- SPACE = <space>
-- ENTER COMMAND = <cmd>
-- LEADER = <leader>
-- TAB = <tab> NOTE: you can't use modifier keys like ctrl, alt and meta
-- NO MAPPING = <nop>

-------------------------------
-- NON-MODE-SPECIFIC KEYMAPS --
-------------------------------
-- space as leader key
keymap("", "<space>", "<Nop>", opts) -- reset
vim.g.mapleader = " " -- map
vim.g.maplocalleader = " " -- map

-- code 
keymap("", "<M-cr>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

-- resize splits with arrows
keymap("", "<C-Up>", "<cmd>resize -2<cr>", opts)
keymap("", "<C-Down>", "<cmd>resize +2<cr>", opts)
keymap("", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-------------------------
-- VISUAL MODE KEYMAPS --
-------------------------
-- continue to select text went indenting
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

----------------------------------------
-- OTHER KEYMAPS (PLUGINS AND OTHERS) --
----------------------------------------
-- dial
-- keymap("n", "<C-a>", require"dial.map".inc_normal(), opts)
-- keymap("n", "<C-x>", require"dial.map".dec_normal(), opts)
-- keymap("v", "<C-a>", require"dial.map".inc_visual(), opts)
-- keymap("v", "<C-x>", require"dial.map".dec_visual(), opts)
-- keymap("v", "g<C-a>", require"dial.map".inc_gvisual(), opts)
-- keymap("v", "g<C-x>", require"dial.map".dec_gvisual(), opts)

-- move.nvim
keymap({ "n", "i" }, "<C-j>", "<cmd>MoveLine(1)<CR>", opts)
keymap({ "n", "i" }, "<C-k>", "<cmd>MoveLine(-1)<CR>", opts)
keymap({ "n", "i" }, "<C-h>", "<cmd>MoveHChar(-1)<CR>", opts)
keymap({ "n", "i" }, "<C-l>", "<cmd>MoveHChar(1)<CR>", opts)
keymap("v", "<C-j>", "<cmd>MoveBlock(1)<CR>", opts)
keymap("v", "<C-k>", "<cmd>MoveBlock(-1)<CR>", opts)
keymap("v", "<C-h>", "<cmd>MoveHBlock(-1)<CR>", opts)
keymap("v", "<C-l>", "<cmd>MoveHBlock(1)<CR>", opts)

-- TO BE LEGENDARY --
keymap("n", "<leader>u", "<cmd>UndotreeToggle<cr><c-w>h", opts)
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- alphabet
keymap("n", "<leader><leader><leader>a", function()
    print("abcdefghijklmnopqrstuvwxyz")
end, opts)

-- telescope
keymap("n", "<leader>ft", "<cmd>Telescope<cr>")
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- # but better
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap("n", "<leader>fg", "<cmd>Telescope git_status<cr>")
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- help menu fuzzy
keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>")
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find text

-- avoid repeating hjkl keys
local id
local function avoid_hjkl(mode, mov_keys)
    for _, key in ipairs(mov_keys) do
        local count = 0
        vim.keymap.set(mode, key, function()
            if count >= 5 then
                id = vim.notify("Hold it Cowboy!", vim.log.levels.WARN, {
                    icon = "🤠",
                    replace = id,
                    keep = function()
                        return count >= 5
                    end,
                })
            else
                count = count + 1
                -- after 5 seconds decrement
                vim.defer_fn(function()
                    count = count - 1
                end, 5000)
                return key
            end
        end, { expr = true })
    end
end

-- Hard mode toggle
HardMode = false
function ToggleHardMode()
    local modes = { "n", "v" }
    local movement_keys = { "h", "j", "k", "l" }
    if HardMode then
        for _, mode in pairs(modes) do
            for _, m_key in pairs(movement_keys) do
                vim.api.nvim_del_keymap(mode, m_key)
            end
        end
        vim.notify("Hard mode OFF", vim.log.levels.INFO, {timeout=5})
    else
        for _, mode in pairs(modes) do
            avoid_hjkl(mode, movement_keys)
        end
        vim.notify("Hard mode ON",vim.log.levels.INFO, {timeout=5})
    end
    HardMode = not HardMode
end

ToggleHardMode()
keymap("n", "<leader>th", ":lua ToggleHardMode()<CR>", opts)
