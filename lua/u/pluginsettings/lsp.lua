require("mason").setup { ui = { border = "rounded" } }

require("mason-lspconfig").setup {
   ensure_installed = { "bashls", "jsonls", "lua_ls", "marksman", "pylsp" },
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
   map({ "n", "v" }, "<leader>lh", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", { noremap = true, silent = true, desc = "Previous" })
   map({ "n", "v" }, "<leader>ll", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", { noremap = true, silent = true, desc = "Next" })
   map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { noremap = true, silent = true, desc = "Rename Symbol" })
   map("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { noremap = true, silent = true, desc = "Signature Help" })
   map({ "i", "s" }, "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { noremap = true, silent = true, desc = "Signature Help" })
   map("n", "<leader>lt", "<cmd>lua require'lsp_lines'.toggle()<cr>", { noremap = true, silent = true, desc = "Toggle LspLines" })
   map("n", "<leader>lq", "<cmd>TroubleToggle document_diagnostics<cr>", { noremap = true, silent = true, desc = "Diagnostics" })
   -- stylua: ignore end
   require("nvim-navic").attach(client, bufnr)
   require("nvim-navbuddy").attach(client, bufnr)
   require("lsp-inlayhints").on_attach(client, bufnr, false)
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
require("lspconfig").lua_ls.setup {
   settings = {
      Lua = {
         completion = { callSnippet = "Replace" },
         diagnostics = { globals = { "vim", "require", "pp" } },
         workspace = { checkThirdParty = false }, -- remove that annoying popup https://github.com/neovim/nvim-lspconfig/issues/1700
      },
   },
   on_attach = on_attach,
   capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
require("lspconfig").rust_analyzer.setup {
   on_attach = on_attach,
   capabilities = require("cmp_nvim_lsp").default_capabilities(),
   cmd = { "rustup", "run", "stable", "rust-analyzer" },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
   border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
   border = "rounded",
})

vim.g.python3_host_prog = "/usr/local/bin/python3"

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
   local hl = "DiagnosticSign" .. type
   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local ll = require "lsp_lines"
ll.setup()
ll.toggle()

-- local settings = {
--     pylsp = {
--         pylsp = {
--             builtin = {
--                 installExtraArgs = {
--                     "flake8",
--                     "pycodestyle",
--                     "pydocstyle",
--                     "pyflakes",
--                     "pylint",
--                     "yapf",
--                 },
--             },
--             plugins = {
--                 jedi_completion = { enabled = false },
--                 rope_completion = { enabled = false },
--                 flake8 = { enabled = false },
--                 pyflakes = { enabled = false },
--                 pycodestyle = {
--                     ignore = {
--                         "E226",
--                         "E266",
--                         "E302",
--                         "E303",
--                         "E304",
--                         "E305",
--                         "E402",
--                         "C0103",
--                         "W0104",
--                         "W0621",
--                         "W391",
--                         "W503",
--                         "W504",
--                     },
--                     maxLineLength = 99,
--                 },
--             },
--         },
--     },
-- }
