#!/bin/bash
#
# This file creates setups the environment to work
# from a new mac computer.

# Check if is a mac.
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
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew is already installed."
  brew update
fi
