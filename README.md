## Index

1. [Index](#index)
	1. [you need these binaries/things (comment out unneeded languages)](#you-need-these-binariesthings-comment-out-unneeded-languages)
		1. [linters/lsp/formatters/debugger:](#linterslspformattersdebugger)
			1. [json](#json)
			2. [bash](#bash)
			3. [markdown](#markdown)
			4. [python (must install, otherwise will not work):](#python-must-install-otherwise-will-not-work)
			5. [lua:](#lua)
			6. [rust:](#rust)
			7. [haskell:](#haskell)

run :checkhealth and follow the instructions
run :Codeium Auth and follow the instructions

This is a no-mason, no-icon (except maybe lazy but i use wezterm anyways), self-built statusline, "minimal" config.

### you need these binaries/things (comment out unneeded languages)

- grep

#### linters/lsp/formatters/debugger:

##### json

- json-ls (pip3)
- prettier (npm)

```bash
npm i --location=global vscode-langservers-extracted
```

```bash
npm install --save-dev --save-exact prettier
```

##### bash

- bash-language-server (npm)

```bash
npm i --location=global bash-language-server
```

##### markdown

- marksman (npm)

```bash
brew install marksman
```

##### python (must install, otherwise will not work):

- black (formatter) (pip)
- ruff (linter) (install in project venv) (to be able to detect dependencies in venvs)
- pyright (lsp, static type checker) (install in project venv) (to be able to detect dependencies in venvs)
- debugpy (dap) (install like below)

```bash
# global
pip3 install black
```

```bash
# in venv
pip3 install ruff pyright # or pip depending on your os
```

```bash
mkdir ~/.venv
cd ~/.venv
python3 -m venv nvim-python
nvim-python/bin/python -m pip install debugpy
```

_use venv all the time btw_

##### lua

- stylua (formatter) (cargo install stylua)
- lua-ls (lsp) (brew install lua-language-server or just download the binary from its github page)

##### rust

run rustup update first
- [rustup](https://rustup.rs/)
- rust-analyzer`rustup component add rust-analyzer`
- rustfmt `rustup component add rustfmt`
- cargo-watch `cargo install cargo-watch`
- clippy `rustup component add clippy`
- [codelldb](https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb)#Installation)(rename extension to codelldb and put it in ~/.config/nvim/bin/)

##### haskell

- [ghcup](https://www.haskell.org/ghcup/) (installs all things)
- stylish-haskell (stack or cabal)

```bash
cabal install stylish-haskell
# or
stack install stylish-haskell
```

change the dev = { path = "" } } directory to where you store your own plugins.
you can put your own plugins there.

to add a new language support you need to add the language in

lua/plugins/lsp.lua ensure_install

and formatters

if lsp doesn't support then add keymap in ftplugin

you can take a look at haskell

and treesitter

and linters lua/plugins/lsp.lua

and check if your lsp needs to be configured here: https://github.com/lvimuser/lsp-inlayhints.nvim

you might need to search for something like rust-tools or rust-analyzer 3rd-party plugins and see what do they do
