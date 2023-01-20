#!/bin/bash
# stolen from https://github.com/ye-junzhe/BetterNvim

# Check if neovim is installed
nvim_Warning() {
	echo "Install neovim, and try again"
	exit
}

# Check if node is installed
node_Warning() {
	echo "Install node and try again"
	exit
}

# Check if git is installed
git_Warning() {
	echo "Install git and try again"
	exit
}

# Rename bak nvim directory
rename_Dir() {
	mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
	echo "Your current neovim config transfered to ~/.config/nvim.bak"
	clone
}

# Clone new nvim directory
clone() {
	echo "Cloning..."
	git clone https://github.com/juiceDeLemon/nvim-config ~/.config/nvim
}

# Check if neovim is installed and warn if not
which nvim >/dev/null && echo "Neovim is installed" || nvim_Warning

# Check if node is installed and warn if not
which node >/dev/null && echo "Node is installed" || node_Warning

# Check if git is installed and warn if not
which git >/dev/null && echo "Git is installed" || git_Warning

# If nvim directory exists, rename it; otherwise clone new nvim directory
[ -d "$HOME/.config/nvim" ] && rename_Dir || clone
