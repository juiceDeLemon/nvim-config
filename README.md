hi

\*\*\*EVERYTIME YOU INSTALL PLUGINS THAT DO NOT NEED REQ() YOU NEED TO SET IT TO { "repo", lazy = false } OR IT WILL NOT WORK

run :checkhealth and follow the intructions

### you need these binaries/things

- trash
- grep
- ranger
- [rustup](https://rustup.rs/)
- [silicon](https://github.com/aloxaf/silicon)

#### linters/lsp/formatters/dap:

##### python (must install, otherwise will not work):

- black (formatter) (install in project venv)
- pylint (linter) (install in project venv)
- pylsp (lsp) (install in project venv)
- debugpy (dap) (install like below)

```bash
mkdir ~/.venv
cd ~/.venv
python3 -m venv nvim-python
nvim-python/bin/python -m pip install debugpy
```

_use venv all the time btw_

##### lua:

- stylua (formatter) (cargo install stylua)
- lua-ls (lsp) (brew install lua-language-server or just download the binary from its github page)

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
