-- ███╗░░██╗██╗░░░██╗██╗░░░░░██╗░░░░░░░░░░░██╗░░░░░░██████╗░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ████╗░██║██║░░░██║██║░░░░░██║░░░░░░░░░░░██║░░░░░██╔════╝░░░██║░░░░░██║░░░██║██╔══██╗
-- ██╔██╗██║██║░░░██║██║░░░░░██║░░░░░█████╗██║░░░░░╚█████╗░░░░██║░░░░░██║░░░██║███████║
-- ██║╚████║██║░░░██║██║░░░░░██║░░░░░╚════╝██║░░░░░░╚═══██╗░░░██║░░░░░██║░░░██║██╔══██║
-- ██║░╚███║╚██████╔╝███████╗███████╗░░░░░░███████╗██████╔╝██╗███████╗╚██████╔╝██║░░██║
-- ╚═╝░░╚══╝░╚═════╝░╚══════╝╚══════╝░░░░░░╚══════╝╚═════╝░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
local null_ls = require("null-ls")

local c = null_ls.builtins.code_actions
local f = null_ls.builtins.formatting
local d = null_ls.builtins.diagnostics
local cmp = null_ls.builtins.completion

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local no_emacs = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "markdown", "text" },
    generator = {
        fn = function(params)
            local diagnostics = {}
            -- sources have access to a params object
            -- containing info about the current file and editor state
            for i, line in ipairs(params.content) do
                local col, end_col = line:find("emacs")
                if col and end_col then
                    -- null-ls fills in undefined positions
                    -- and converts source diagnostics into the required format
                    table.insert(diagnostics, {
                        row = i,
                        col = col,
                        end_col = end_col + 1,
                        source = "no-emacs",
                        message = "Don't use \"emacs\"",
                        severity = vim.diagnostic.severity.HINT,
                    })
                end
            end
            return diagnostics
        end
,
    },
}

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client) return client.name == "null-ls" end
,
        bufnr = bufnr,
    })
end


null_ls.setup({
    autostart = true,
    debug = false,
    sources = {
        c.cspell,
        c.eslint,
        c.proselint,
        cmp.spell,
        d.cpplint,
        d.cppcheck,
        d.commitlint,
        d.eslint,
        d.flake8,
        d.gitlint,
        d.jsonlint,
        d.markdownlint,
        d.proselint,
        d.pydocstyle,
        f.autopep8,
        f.clang_format,
        f.eslint,
        f.lua_format,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function() lsp_formatting(bufnr) end
,
            })
        end -- autosave
    end
,
    on_init = function(new_client, _) new_client.offset_encoding = "utf-8" end
,
})

null_ls.register(no_emacs)
