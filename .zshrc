# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"

#HERE
ZSH_THEME="robbyrussell"

# Oh My Shell Plugins
plugins=(
  git
  yarn
  macos
  vscode
  kubectl
  symfony
  git-extras
  docker
  docker-compose
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

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# Date on the terminal
# https://superuser.com/a/1251045/859165
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

# cyan date
RPROMPT="%{$fg[cyan]%}%@%{$reset_color%}"

