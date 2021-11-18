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
  git-extras
)

source $ZSH/oh-my-zsh.sh

# Load .aliases and other files...
for file in ~/.{aliases,functions,path,dockerfunc,exports}; do
  if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    # shellcheck source=/dev/null
    source "$file"
  fi
done
unset file
