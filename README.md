hi

\*\*\*\*EVERYTIME YOU INSTALL PLUGINS THAT DO NOT NEED REQ() YOU NEED TO SET IT TO { "repo", lazy = false } OR IT WILL NOT WORK

run :checkhealth and follow the intructions

you need these binaries

- trash
- grep
- [silicon](https://github.com/aloxaf/silicon)

change the python interpreter in lua/u/pluginsettings/lsp.lua (python3_host_prog). you might want to use venv all the time because it isn't working.

install the needed formatters from mason
listed in null-ls

change the dev = { path = "" } } directory to where you store your own plugins.
you can put your own plugins there.

to add a new language support you need to add the language in
lua/u/pluginsettings/lsp.lua ensure_install
and
lua/u/pluginsettings/nullls.lua and add all sources:
code actions, formatting, diagnostics, hover (c.cspell etc)
and
treesitter
you might need to search for something like rust-tools or rust-analyzer 3rd-party plugins
