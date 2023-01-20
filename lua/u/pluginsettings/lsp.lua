require("mason").setup { ui = { border = "rounded" } }

require("mason-lspconfig").setup {
    ensure_installed = {
        "bashls",
        "jsonls",
        "sumneko_lua",
        "marksman",
        "pylsp",
    },
}

local on_attach = function(_, _)
    local opts = { noremap = true, silent = true }
    local map = vim.keymap.set
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    map("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<cr>", opts)
    map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
    map("n", "<leader>la", "<cmd>CodeActionMenu<cr>", opts)
    map("n", "<leader>lh", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
    map("n", "<leader>ll", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
    map("n", "<leader>lr", ":IncRename ", opts)
    map("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    map("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
end

require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        }
    end,
}
require("lspconfig").sumneko_lua.setup {
    settings = { Lua = { diagnostics = { globals = { "vim", "require" } } } },
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

vim.g.python3_host_prog = "/usr/local/bin/python3"

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config { virtual_text = false }
require("lsp_lines").setup()

local settings = {
    pylsp = {
        pylsp = {
            builtin = {
                installExtraArgs = {
                    "flake8",
                    "pycodestyle",
                    "pydocstyle",
                    "pyflakes",
                    "pylint",
                    "yapf",
                },
            },
            plugins = {
                jedi_completion = { enabled = false },
                rope_completion = { enabled = false },
                flake8 = { enabled = false },
                pyflakes = { enabled = false },
                pycodestyle = {
                    ignore = {
                        "E226",
                        "E266",
                        "E302",
                        "E303",
                        "E304",
                        "E305",
                        "E402",
                        "C0103",
                        "W0104",
                        "W0621",
                        "W391",
                        "W503",
                        "W504",
                    },
                    maxLineLength = 99,
                },
            },
        },
    },
}
