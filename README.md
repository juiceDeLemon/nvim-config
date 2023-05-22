hi

\*\*\*\*EVERYTIME YOU INSTALL PLUGINS THAT DO NOT NEED REQ() YOU NEED TO SET IT TO { "repo", lazy = false } OR IT WILL NOT WORK

run :checkhealth and follow the intructions

you need these things

- trash
- grep
- ranger
- [rustup](https://rustup.rs/)
- [silicon](https://github.com/aloxaf/silicon)

linters/lsp/formatters:
python:
- black (python formatter) (pip3 install black) (venv recommended)
- pylint (python linter) (pip3 install pylint) (venv recommended)
- pylsp (python lsp) (pip3 install python-lsp-server) (venv recommended)
lua:
- stylua (lua formatter) (cargo install stylua)

change the python interpreter in lua/u/pluginsettings/lsp.lua (python3_host_prog). you might want to use venv all the time because it isn't working.

run `rustup component add rust-analyzer` to get rust-analyzer

install the needed formatters from mason
listed in null-ls

change the dev = { path = "" } } directory to where you store your own plugins.
you can put your own plugins there.

to add a new language support you need to add the language in
lua/u/pluginsettings/lsp.lua ensure_install
and
lua/u/pluginsettings/nullls.lua and add all sources:
code actions, formatting, diagnostics, hover (c.cspell etc)
and treesitter
and check if your lsp needs to be configured here: https://github.com/lvimuser/lsp-inlayhints.nvim
you might need to search for something like rust-tools or rust-analyzer 3rd-party plugins
