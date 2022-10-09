-- ██████╗░██╗░█████╗░██╗░░░░░░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██╔══██╗██║██╔══██╗██║░░░░░░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║░░██║██║███████║██║░░░░░░░░██║░░░░░██║░░░██║███████║
-- ██║░░██║██║██╔══██║██║░░░░░░░░██║░░░░░██║░░░██║██╔══██║
-- ██████╔╝██║██║░░██║███████╗██╗███████╗╚██████╔╝██║░░██║
-- ╚═════╝░╚═╝╚═╝░░╚═╝╚══════╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local augend = require "dial.augend"
local config = require "dial.config"
config.augends:register_group{
    default = {
        augend.integer.alias.decimal_int,
        augend.integer.alias.octal,
        augend.integer.alias.binary,
        augend.date.alias["%d/%m/%Y"],
        augend.date.alias["%d/%m/%y"],
        augend.date.alias["%d.%m.%Y"],
        augend.date.alias["%d.%m.%y"],
        augend.date.alias["%H:%M:%S"],
        augend.date.alias["%H:%M"],
        augend.constant.alias.bool,
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
        augend.semver.alias.semver,
        augend.constant.new { elements = { "True", "False" }, word = true, cyclic = true },
        augend.constant.new { elements = { "yes", "no" }, word = true, cyclic = true },
        augend.constant.new { elements = { "on", "off" }, word = true, cyclic = true },
        augend.constant.new {
            elements = { "left", "right", "up", "down" },
            word = true,
            cyclic = true,
        },
        augend.constant.new { elements = { "!=", "==" }, word = false, cyclic = true },
        augend.constant.new { elements = { "!==", "===" }, word = false, cyclic = true },
        augend.constant.new { elements = { "+=", "-=", "*=", "/=" }, word = false, cyclic = true },
        augend.constant.new { elements = { "&&", "||" }, word = false, cyclic = true },
        augend.constant.new { elements = { "++", "--" }, word = false, cyclic = true },
        augend.constant.new { elements = { "emacs", "vim > emacs" }, word = true, cyclic = false },
    },
}
