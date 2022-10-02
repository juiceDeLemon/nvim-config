-- ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗██████╗░███████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ████╗░██║██╔════╝██╔══██╗██║░░░██║██║██╔══██╗██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██║░░██║█████╗░░░░░██║░░░░░██║░░░██║███████║
-- ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║░░██║██╔══╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██████╔╝███████╗██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═════╝░╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝ 

local isNeovide = vim.g.neovide
if isNeovide == nil then
    isNeovide = false
end

vim.g.neovide_transparency = 0.7
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_scroll_animation_length = 0.6
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_input_use_logo = true
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_cursor_trail_size = 0.1
vim.g.neovide_cursor_vfx_mode = "sonicboom"

return isNeovide

