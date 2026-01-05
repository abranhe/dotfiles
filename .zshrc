# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Oh My Shell Plugins
plugins=(
  git
  # yarn
  macos
  vscode
  kubectl
  # symfony
  git-extras
  docker
  docker-compose
  # composer
  1password
  # terraform
  # rust
  # golang
  # thefuck
  history
  brew
)

source $ZSH/oh-my-zsh.sh

# Load .aliases and other files...
for file in ~/dotfiles/.{aliases,functions,path,exports}; do
  if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    # shellcheck source=/dev/null
    source "$file"
  fi
done
unset file

# This is used to load the bashcompinit into memory, which enables
# auto-completion functionality for bash.
autoload -U +X bashcompinit && bashcompinit

# Date on the terminal
# https://superuser.com/a/1251045/859165
# local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
# cyan date
# RPROMPT="%{$fg[cyan]%}%@%{$reset_color%}"

# source ~/.config/op/plugins.sh