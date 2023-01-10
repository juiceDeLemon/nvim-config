hi

run :checkhealth and follow the intructions

you need these binaries
trash
grep
clang check

install the needed formatters from mason
listed in null-ls

to add a new language support you need to add the language in
lua/u/pluginsettings/lsp.lua ensure_install
and
lua/u/pluginsettings/nullls.lua and add all sources:
code actions, formatting, diagnostics, hover (c.cspell etc)
you might need to search for something like rust-tools or rust-analyzer 3rd-party plugins
