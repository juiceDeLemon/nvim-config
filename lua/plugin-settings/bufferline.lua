-- ██████╗░██╗░░░██╗███████╗███████╗███████╗██████╗░██╗░░░░░██╗███╗░░██╗███████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔══██╗██║░░░██║██╔════╝██╔════╝██╔════╝██╔══██╗██║░░░░░██║████╗░██║██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██████╦╝██║░░░██║█████╗░░█████╗░░█████╗░░██████╔╝██║░░░░░██║██╔██╗██║█████╗░░░░░██║░░░░░██║░░░██║███████║
-- ██╔══██╗██║░░░██║██╔══╝░░██╔══╝░░██╔══╝░░██╔══██╗██║░░░░░██║██║╚████║██╔══╝░░░░░██║░░░░░██║░░░██║██╔══██║
-- ██████╦╝╚██████╔╝██║░░░░░██║░░░░░███████╗██║░░██║███████╗██║██║░╚███║███████╗██╗███████╗╚██████╔╝██║░░██║
-- ╚═════╝░░╚═════╝░╚═╝░░░░░╚═╝░░░░░╚══════╝╚═╝░░╚═╝╚══════╝╚═╝╚═╝░░╚══╝╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup {
    options = {
        numbers = "buffer_id",
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
        offsets = {
            {
                filetype = "NvimTree",
                text = "TREE",
                text_align = "center",
                separator = true,
            },
            {
                filetype = "Outline",
                text = "OUTLINE",
                text_align = "center",
                separator = true,
            }
        },
        color_icons = false,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        -- show_tab_indicators = true,

        enforce_regular_tabs = true,
    }
}

