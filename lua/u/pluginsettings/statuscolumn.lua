local builtin = require "statuscol.builtin"

require("statuscol").setup {
   bt_ignore = { "terminal", "nofile" },
   segments = {
      {
         sign = { name = { "Diagnostic" }, maxwidth = 1, colwidth = 3, auto = true },
      },
      {
         text = { builtin.lnumfunc },
      },
      {
         sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, wrap = true, auto = true },
      },
      {
         sign = { name = { "Dap" } },
         maxwidth = 1,
         colwidth = 1,
         auto = true,
      },
      {
         sign = { name = { "GitSigns" }, maxwidth = 2, colwidth = 1,  auto = true },
      },
      {
         text = { " " },
      },
   },
}
