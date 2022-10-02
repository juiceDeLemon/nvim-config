-- ██╗██╗░░░░░██╗░░░░░██╗░░░██╗███╗░░░███╗██╗███╗░░██╗░█████╗░████████╗███████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██║██║░░░░░██║░░░░░██║░░░██║████╗░████║██║████╗░██║██╔══██╗╚══██╔══╝██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║██║░░░░░██║░░░░░██║░░░██║██╔████╔██║██║██╔██╗██║███████║░░░██║░░░█████╗░░░░░██║░░░░░██║░░░██║███████║
-- ██║██║░░░░░██║░░░░░██║░░░██║██║╚██╔╝██║██║██║╚████║██╔══██║░░░██║░░░██╔══╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ██║███████╗███████╗╚██████╔╝██║░╚═╝░██║██║██║░╚███║██║░░██║░░░██║░░░███████╗██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝╚══════╝╚══════╝░╚═════╝░╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
  return
end

-- https://neovim.io/doc/user/api.html
vim.api.nvim_set_hl(0, "IlluminatedWordText", {bg = "#2B3543"})
vim.api.nvim_set_hl(0, "IlluminatedWordRead", {bg = "#2B3543"})
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", {bg = "#2B3543"})

illuminate.configure {
    delay = 400,
    filetypes_denylist = {
        "dirvish",
        "fugitive",
        "alpha",
        "NvimTree",
        "packer",
        "neogitstatus",
        "Trouble",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
        "DressingSelect",
        "TelescopePrompt",
    },
}

