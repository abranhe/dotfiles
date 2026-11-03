# shellcheck shell=bash
#
# Layer resolution shared by .zshrc and bin/dot. Keep it compatible with both
# zsh and the bash 3.2 that ships with macOS.
#
# A layer is a directory that may provide .exports, .path, .aliases,
# .functions, bin/, Brewfile, links, .gitconfig and .secrets. This public repo
# is always the first layer; private ones live in personal/ and work/<env>/,
# which are separate git repositories listed in private.repos.

DOTFILES_CONFIG="${DOTFILES_CONFIG:-${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles}"

# Print the active private layers, one per line, relative to $DOTFILES.
# $DOTFILES_CONFIG/layers pins them for this machine; without it every private
# layer found on disk is active.
dot_layers() {
  [ -n "${ZSH_VERSION:-}" ] && setopt localoptions nullglob
  local line dir

  if [ -f "$DOTFILES_CONFIG/layers" ]; then
    while IFS= read -r line || [ -n "$line" ]; do
      line="${line%%#*}"
      line="${line%% *}"
      if [ -n "$line" ]; then echo "$line"; fi
    done <"$DOTFILES_CONFIG/layers"
    return 0
  fi

  if [ -d "$DOTFILES/personal" ]; then echo personal; fi
  for dir in "$DOTFILES"/work/*/; do
    if [ -d "$dir" ]; then echo "work/$(basename "$dir")"; fi
  done
  return 0
}

# Print the absolute path of every active layer, public repo first.
dot_layer_dirs() {
  local layer
  echo "$DOTFILES"
  for layer in $(dot_layers); do
    if [ -d "$DOTFILES/$layer" ]; then echo "$DOTFILES/$layer"; fi
  done
  return 0
}

# Print "<dir> <url>" for each private repository declared in private.repos.
dot_private_repos() {
  grep -Ev '^[[:space:]]*(#|$)' "$DOTFILES/private.repos" 2>/dev/null || true
}
