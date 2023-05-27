require("mason").setup { ui = { border = "rounded" } }

require("mason-lspconfig").setup {
   ensure_installed = { "bashls", "jsonls", "marksman" },
}

local on_attach = function(client, bufnr)
   local map = vim.keymap.set
   -- stylua: ignore start
   map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true, silent = true })
   map("n", "gd", "<cmd>TroubleToggle lsp_definitions<cr>", { noremap = true, silent = true, desc = "Definitions" })
   map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { noremap = true, silent = true, desc = "Declarations" })
   map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", { noremap = true, silent = true, desc = "Implementations" })
   map("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", { noremap = true, silent = true, desc = "References" })
   map("n", "<leader>la", "<cmd>lua require('code_action_menu').open_code_action_menu()<cr>", { noremap = true, silent = true, desc = "Code Action" })
   map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format(filter = function(client) return client.name == 'null-ls' end)<cr>", { noremap = true, silent = true, desc="Format Code" })
   map({ "n", "v", "o" }, "<leader>lh", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", { noremap = true, silent = true, desc = "Previous" })
   map({ "n", "v", "o" }, "<leader>ll", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", { noremap = true, silent = true, desc = "Next" })
   map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { noremap = true, silent = true, desc = "Rename Symbol" })
   map("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { noremap = true, silent = true, desc = "Signature Help" })
   map({ "i", "s" }, "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { noremap = true, silent = true, desc = "Signature Help" })
   map("n", "<leader>lt", "<cmd>lua require'lsp_lines'.toggle()<cr>", { noremap = true, silent = true, desc = "Toggle LspLines" })
   map("n", "<leader>lq", "<cmd>TroubleToggle document_diagnostics<cr>", { noremap = true, silent = true, desc = "Diagnostics" })
   -- stylua: ignore end
   require("nvim-navic").attach(client, bufnr)
   require("nvim-navbuddy").attach(client, bufnr)
   require("lsp-inlayhints").on_attach(client, bufnr)
   -- navbuddy
   map("n", "<leader>o", "<cmd>Navbuddy<cr>", { desc = "Navbuddy" })
end

require("neodev").setup {}

require("mason-lspconfig").setup_handlers {
   function(server_name)
      require("lspconfig")[server_name].setup {
         on_attach = on_attach,
         capabilities = require("cmp_nvim_lsp").default_capabilities(),
      }
   end,
}
-- lua
require("lspconfig").lua_ls.setup {
   settings = {
      Lua = {
         completion = { callSnippet = "Replace" },
         diagnostics = { globals = { "vim", "require", "pp" } },
         workspace = { checkThirdParty = false }, -- remove that annoying popup https://github.com/neovim/nvim-lspconfig/issues/1700
         hint = { enabled = true },
      },
   },
   on_attach = on_attach,
   capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
-- rust
require("lspconfig").rust_analyzer.setup {
   on_attach = on_attach,
   capabilities = require("cmp_nvim_lsp").default_capabilities(),
   cmd = { "rustup", "run", "stable", "rust-analyzer" },
}
-- python
require("lspconfig").pylsp.setup {
   settings = {
      pylsp = {
         plugins = {
            jedi_completion = { enabled = false },
            pyflakes = { enabled = false },
            pycodestyle = {
               ignore = {
                  "E226", -- missing whitespace aronud arithmetic operator
                  "E402", -- module level import not at top of file
                  -- "C0103", -- invalid constant name
                  -- "W0104", -- statement seems to have no effect
                  -- "W0621", -- redefined-outer-name
               },
            },
         },
      },
   },
   on_attach = on_attach,
   capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
   border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
   border = "rounded",
})

local ll = require "lsp_lines"
ll.setup()
ll.toggle()
