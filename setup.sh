#!/bin/bash
#
# This file creates the environment to work from a new computer.

#

# Check if the computer is a mac, otherwise exit.
if [ "$(uname)" != "Darwin" ]; then
  echo "This script is only for mac"
  exit 1
fi

# Check if xcode-select is installed and install it if not installed.
if ! [ -x "$(command -v xcode-select)" ]; then
  echo "Installing xcode-select"
  xcode-select --install
fi

# Check if homebrew is installed.
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
  brew update
fi

# Fixing issue with M1 chips. https://stackoverflow.com/a/65505326/7602110
if [[ "$(uname -m)" == "arm64" ]]; then
  export PATH="/opt/homebrew/bin:${PATH}"
fi

# Install all apps from the Brewfile.
echo "Installing apps from Brewfile"
brew bundle --file ~/Developer/github/abranhe/dotfiles/Brewfile

# Check if zsh is installed and install it if not installed.
if ! [ -x "$(command -v zsh)" ]; then
  echo "Installing zsh"
  brew install zsh
fi

# Install oh-my-zsh.
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Create symlinks for dotfiles. Overwrite if the file already exists.
echo "Creating symlinks for dotfiles"
ln -sfv ~/Developer/github/abranhe/dotfiles/.zshrc ~/.zshrc
ln -sfv ~/Developer/github/abranhe/dotfiles/.gitconfig ~/.gitconfig
ln -sfv ~/Developer/github/abranhe/dotfiles/.gitignore ~/.gitignore
ln -sfv ~/Developer/github/abranhe/dotfiles/.vimrc ~/.config/nvim/init.vim

echo "Manage your Git profiles using https://github.com/abranhe/git-config-manager"

echo "Done! ✨"
