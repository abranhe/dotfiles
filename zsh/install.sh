#!/bin/bash

# Import config
source './scripts/utils.sh'

install_oh_my_zsh() {
  message "Installing Oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  all_ok "$@"
}

create_dotfiles() {
  message "Creating .dotfiles..."
  for file in *.zsh
    do 
    cp -v "$file" ~/."${file%.*}"
  done
  all_ok "$@"
}

main() {
  install_oh_my_zsh "$@"
  create_dotfiles "$@"
  source ~/.zshrc
}

main "$@"
