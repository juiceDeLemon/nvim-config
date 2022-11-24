
# Nvim_Config

My neovim config. There are a lot of unusual preferences that i like so don't
use unless you're me.

## Reminders

- When cloning, please change the repo's name to whatever it is in your operating
system e.g. on macOS: "git clone https://github.com/juiceDeLemon/nvim-config ~/.config/nvim/"

## Things to install before launching neovim

- **[Packer](https://github.com/wbthomason/packer.nvim)**
- JetBrains Mono Nerdfont (included in the source code)
- **[Ripgrep](https://github.com/BurntSushi/ripgrep)
- **[Pyright](https://github.com/microsoft/pyright)
- **[Silicon](https://crates.io/crates/silicon)
- [npm (well I'm lazy and I couldn't find an npm repo)
- Go to **[lspconfig](https://github.com/neovim/nvim-lspconfig/) and install the
servers using npm
- if don't have trash: install **[trash](https://formulae.brew.sh/formula/trash)

## After cloning the repo

- MUST run :checkhealth to install other dependencies
- Change the trash command in nvim-tree.lua to suit your OS
- Change python path in ./lua/plugin-settings/lsp/settings/py.lua
