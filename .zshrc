# Homebrew, early so everything below can find its packages.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# The repo this file is symlinked from.
export DOTFILES="${${(%):-%x}:A:h}"

# Completions for `dot`, registered before Oh My Zsh runs compinit.
fpath=("$DOTFILES/completions" $fpath)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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

# Load .exports, .path, .aliases, .functions and bin/ from the public repo,
# then from each active private layer (personal, work/<env>). See `dot layers`.
source "$DOTFILES/lib/layers.sh"
for layer in ${(f)"$(dot_layer_dirs)"}; do
  for file in "$layer"/.{exports,path,aliases,functions}; do
    # shellcheck source=/dev/null
    [[ -r "$file" ]] && source "$file"
  done
  [[ -d "$layer/bin" ]] && path=("$layer/bin" $path)
done
unset layer file

# Secrets resolved from 1Password by `dot secrets`.
[[ -r "$DOTFILES_CONFIG/secrets.env" ]] && source "$DOTFILES_CONFIG/secrets.env"

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

[[ -r "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# https://code.visualstudio.com/docs/terminal/shell-integration
[[ "$TERM_PROGRAM" == "vscode" ]] && (( $+commands[code] )) && . "$(code --locate-shell-integration-path zsh)"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Added by the Postman CLI installer
export PATH="$HOME/.local/bin:$PATH"

# mise manages language runtimes and CLI tools (node, pnpm, python, ...), see
# mise.toml. Activated last so its versions win over anything above.
(( $+commands[mise] )) && eval "$(mise activate zsh)"

# Machine specific settings that should not be committed. Installers that
# append to ~/.zshrc edit this repo through the symlink, point them here.
if [[ -r "$HOME/.zshrc.local" ]]; then source "$HOME/.zshrc.local"; fi
