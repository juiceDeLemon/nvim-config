require("colorizer").setup {
    filetypes = { "*" },
    user_default_options = {
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        RGB = false,
        names = false, -- name codes like teal, purple, pink, or even navy
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    },
    -- all the sub-options of filetypes apply to buftypes
    buftypes = {},
}
