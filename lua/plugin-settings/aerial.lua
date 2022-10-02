-- ░█████╗░███████╗██████╗░██╗░█████╗░██╗░░░░░░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔══██╗██╔════╝██╔══██╗██║██╔══██╗██║░░░░░░░░██║░░░░░██║░░░██║██╔══██╗
-- ███████║█████╗░░██████╔╝██║███████║██║░░░░░░░░██║░░░░░██║░░░██║███████║
-- ██╔══██║██╔══╝░░██╔══██╗██║██╔══██║██║░░░░░░░░██║░░░░░██║░░░██║██╔══██║
-- ██║░░██║███████╗██║░░██║██║██║░░██║███████╗██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═╝╚═╝░░╚═╝╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
    return
end

aerial.setup {
    layout = {
        width = 0.15,
        placement = "edge",
    },
    filter_kind = false, -- disable any filtering

    -- these only works if manage_folds = true:
    link_tree_to_folds = true,
    manage_folds = true,

    show_guides = true, -- test needed
    guides = {
        mid_item = "│",
        last_item = "└",
        nested_top = "│",
        whitespace = " ",
    }, -- match nvim-tree
}

