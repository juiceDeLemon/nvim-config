-- ░█████╗░░█████╗░██╗░░░░░░█████╗░██████╗░██╗███████╗███████╗██████╗░░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔══██╗██╔══██╗██║░░░░░██╔══██╗██╔══██╗██║╚════██║██╔════╝██╔══██╗░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║░░╚═╝██║░░██║██║░░░░░██║░░██║██████╔╝██║░░███╔═╝█████╗░░██████╔╝░░░██║░░░░░██║░░░██║███████║
-- ██║░░██╗██║░░██║██║░░░░░██║░░██║██╔══██╗██║██╔══╝░░██╔══╝░░██╔══██╗░░░██║░░░░░██║░░░██║██╔══██║
-- ╚█████╔╝╚█████╔╝███████╗╚█████╔╝██║░░██║██║███████╗███████╗██║░░██║██╗███████╗╚██████╔╝██║░░██║
-- ░╚════╝░░╚════╝░╚══════╝░╚════╝░╚═╝░░╚═╝╚═╝╚══════╝╚══════╝╚═╝░░╚═╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
    return
end

colorizer.setup {
    filetypes = {"*"},
    user_default_options = {
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        names = false, -- name codes like teal, purple, pink, or even navy
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    },
    -- all the sub-options of filetypes apply to buftypes
    buftypes = { },
}

