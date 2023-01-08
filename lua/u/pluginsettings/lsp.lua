require"mason".setup {
    ui = { border = "rounded" }
}

require"mason-lspconfig".setup {
    ensure_installed = {
        "bashls",
        "clangd",
        "jsonls",
        "sumneko_lua",
        "marksman",
        "pyright", -- python completion, rename and type checking
        "pylsp", -- python hover, documentation, go to def, syntax checking
    }
}

local on_attach = function(client, _)
    local opts = { noremap = true, silent = true }
    local keymap = vim.keymap.set
    keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    keymap("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<cr>", opts)
    keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
    keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
    keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
    keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
    keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)

    local c = vim.lsp.protocol.make_client_capabilities()
    -- python stuff
    if client.name == 'pyright' then
        c.hover = false
    end
    if client.name == 'pylsp' then
        c.rename = false
        c.signature_help = false
    end
    c = require"cmp_nvim_lsp".default_capabilities()
end

require"mason-lspconfig".setup_handlers {
    function(server_name)
        require"lspconfig"[server_name].setup {
            on_attach = on_attach
        }
    end
}

require'lspconfig'.sumneko_lua.setup {
    settings = { Lua = { diagnostics = { globals = {'vim'} } } },
}

local settings = {
  pyright = {
    python = {
      analysis = {
        useLibraryCodeForTypes = true,
        diagnosticSeverityOverrides = {
          reportGeneralTypeIssues = "none",
          reportOptionalMemberAccess = "none",
          reportOptionalSubscript = "none",
          reportPrivateImportUsage = "none",
        },
        autoImportCompletions = false,
      },
      linting = {pylintEnabled = false}
    }
  },
  pylsp = {
    pylsp = {
      builtin = {
        installExtraArgs = {'flake8', 'pycodestyle', 'pydocstyle', 'pyflakes', 'pylint', 'yapf'},
      },
      plugins = {
        jedi_completion = { enabled = false },
        rope_completion = { enabled = false },
        flake8 = { enabled = false },
        pyflakes = { enabled = false },
        pycodestyle = {
          ignore = {'E226', 'E266', 'E302', 'E303', 'E304', 'E305', 'E402', 'C0103', 'W0104', 'W0621', 'W391', 'W503', 'W504'},
          maxLineLength = 99,
        },
      },
    },
  },
}
