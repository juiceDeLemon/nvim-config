local nl = require "null-ls"

-- local c = nl.builtins.code_actions
local d = nl.builtins.diagnostics
local f = nl.builtins.formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client) return client.name == "null-ls" end
,
        bufnr = bufnr,
    })
end


nl.setup({
    autostart = true,
    debug = false,
    sources = {
        d.clang_check,
        -- d.cspell,
        d.luacheck,
        d.pylint,
        d.shellcheck,

        f.black,
        f.clang_format,
        f.lua_format,
        f.prettier,
        f.shfmt,
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
})

local no_emacs = {
    method = nl.methods.DIAGNOSTICS,
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

nl.register(no_emacs)
