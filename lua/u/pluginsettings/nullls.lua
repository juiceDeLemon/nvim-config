local nl = require "null-ls"

-- local c = nl.builtins.code_actions
local d = nl.builtins.diagnostics
local f = nl.builtins.formatting

local lsp_formatting = function(bufnr)
   vim.lsp.buf.format {
      filter = function(client) return client.name == "null-ls" end,
      bufnr = bufnr,
   }
end

nl.setup {
   border = "rounded",
   debug = false,
   sources = {
      d.pylint.with { extra_args = {
         "--ignored-modules=pygame",
         "--good-names=x,y,z,i,j,n,f",
      } },
      d.shellcheck,

      f.black,
      f.stylua,
      f.prettier,
      f.shfmt,
   },
   on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
         vim.keymap.set(
            "n",
            "<leader>lf",
            function() lsp_formatting(bufnr) end,
            { noremap = true, silent = true, desc = "Format File" }
         )
      end
   end,
}
