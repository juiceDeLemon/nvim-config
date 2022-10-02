-- ██╗░░░░░░██████╗██████╗░░░░░░░██╗███╗░░██╗░██████╗████████╗░█████╗░██╗░░░░░██╗░░░░░███████╗██████╗░░░░██╗░░░░░██╗░░░██╗░█████╗░
-- ██║░░░░░██╔════╝██╔══██╗░░░░░░██║████╗░██║██╔════╝╚══██╔══╝██╔══██╗██║░░░░░██║░░░░░██╔════╝██╔══██╗░░░██║░░░░░██║░░░██║██╔══██╗
-- ██║░░░░░╚█████╗░██████╔╝█████╗██║██╔██╗██║╚█████╗░░░░██║░░░███████║██║░░░░░██║░░░░░█████╗░░██████╔╝░░░██║░░░░░██║░░░██║███████║
-- ██║░░░░░░╚═══██╗██╔═══╝░╚════╝██║██║╚████║░╚═══██╗░░░██║░░░██╔══██║██║░░░░░██║░░░░░██╔══╝░░██╔══██╗░░░██║░░░░░██║░░░██║██╔══██║
-- ███████╗██████╔╝██║░░░░░░░░░░░██║██║░╚███║██████╔╝░░░██║░░░██║░░██║███████╗███████╗███████╗██║░░██║██╗███████╗╚██████╔╝██║░░██║
-- ╚══════╝╚═════╝░╚═╝░░░░░░░░░░░╚═╝╚═╝░░╚══╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░╚═╝╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

local installer_status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installer_status_ok then
    return
end

local servers = {
    "bashls", -- bash
    "clangd", -- c, c++
    "cssls", -- css
    "grammarly", -- english
    "html", -- html
    "jsonls", -- json
    "tsserver", -- js, ts
    "sumneko_lua", -- lua
    "marksman", -- markdown
    "pyright", -- python
    "yamlls", -- yaml/yml
}

lsp_installer.setup()

-- must put this after .setup() because wiki said so :)
local config_status_ok, lspconfig = pcall(require, "lspconfig")
if not config_status_ok then
    return
end

local default_opts = {
    on_attach = require("plugin-settings.lsp.handlers").on_attach,
    -- capabilities = require("plugin-settings.lsp.handlers").capabilities,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

local lang_specific_opts = { }

for _, server in pairs(servers) do
    lang_specific_opts = { } -- reset

    if server == "bashls" then -- bash
        local bash_opts = require("plugin-settings.lsp.settings.bash")
        -- lang_specific_opts = vim.tbl_deep_extend("force", bash_opts, default_opts)
    elseif server == "clangd" then -- c, c++
        local clang_opts = require("plugin-settings.lsp.settings.clang")
        -- lang_specific_opts = vim.tbl_deep_extend("force", clang_opts, default_opts)
    elseif server == "cssls" then -- css
        local css_opts = require("plugin-settings.lsp.settings.css")
        -- lang_specific_opts = vim.tbl_deep_extend("force", css_opts, default_opts)
    elseif server == "grammarly" then -- english
        local grammarly_opts = require("plugin-settings.lsp.settings.grammarly")
        -- lang_specific_opts = vim.tbl_deep_extend("force", grammarly_opts, default_opts)
    elseif server == "html" then -- html
        local html_opts = require("plugin-settings.lsp.settings.html")
        -- lang_specific_opts = vim.tbl_deep_extend("force", html_opts, default_opts)
    elseif server == "jsonls" then -- json
        local json_opts = require("plugin-settings.lsp.settings.json")
        lang_specific_opts = vim.tbl_deep_extend("force", json_opts, default_opts)
    elseif server == "tsserver" then -- js, ts
        local tsserver_opts = require("plugin-settings.lsp.settings.tsserver")
        -- lang_specific_opts = vim.tbl_deep_extend("force", tsserver_opts, default_opts)
    elseif server == "sumneko_lua" then -- lua
        local lua_opts = require("plugin-settings.lsp.settings.lua")
        lang_specific_opts = vim.tbl_deep_extend("force", lua_opts, default_opts)
    elseif server == "marksman" then -- markdown
        local md_opts = require("plugin-settings.lsp.settings.md")
        -- lang_specific_opts = vim.tbl_deep_extend("force", md_opts, default_opts)
    elseif server == "pyright" then -- python
        local py_opts = require("plugin-settings.lsp.settings.py")
        lang_specific_opts = vim.tbl_deep_extend("force", py_opts, default_opts)
    elseif server == "yamlls" then -- yaml/yml
        local yml_opts = require("plugin-settings.lsp.settings.yml")
        -- lang_specific_opts = vim.tbl_deep_extend("force", yml_opts, default_opts)
    end

    lspconfig[server].setup(lang_specific_opts)
end

