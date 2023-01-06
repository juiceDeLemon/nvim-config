-- ██╗░░░░░██╗░░░██╗░█████╗░  ██╗░░░░░░██████╗██████╗░
-- ██║░░░░░██║░░░██║██╔══██╗  ██║░░░░░██╔════╝██╔══██╗
-- ██║░░░░░██║░░░██║███████║  ██║░░░░░╚█████╗░██████╔╝
-- ██║░░░░░██║░░░██║██╔══██║  ██║░░░░░░╚═══██╗██╔═══╝░
-- ███████╗╚██████╔╝██║░░██║  ███████╗██████╔╝██║░░░░░
-- ╚══════╝░╚═════╝░╚═╝░░╚═╝  ╚══════╝╚═════╝░╚═╝░░░░░

return {
    settings = {
        Lua = {
            completion = {
                displayContext = 4, -- understand the usage of symbol using 4 lines
                keywordSnippet = "Both", -- complete the whole keyward e.g.: if (true) {}
            },
            diagnostics = {
                globals = {
                    "vim"
                }, -- variable names that will be declared as global
            },
            hint = {
                enable = true,
                arrayIndex = "Enable", -- label array index
            },
        },
    },
}

