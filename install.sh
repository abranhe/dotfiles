#!/bin/bash
#
# Bootstrap a brand new Mac, no git required:
#
#   curl -fsSL https://raw.githubusercontent.com/abranhe/dotfiles/master/install.sh | bash
#
# Installs Homebrew (which brings the Xcode Command Line Tools), clones this
# repo over HTTPS and hands over to `dot install`, which installs 1Password,
# clones the private layers and sets up everything else. Also works from a
# downloaded zip of the repo: ./install.sh
#
# Environment: DOTFILES (clone location), DOTFILES_REPO (clone URL).
# Arguments are passed to `dot`, e.g. `bash -s -- --yes` for no prompts.

# Everything lives in main() so bash reads the whole script before running it,
# which makes `curl | bash` safe against truncated downloads.
main() {
  set -euo pipefail

  local dotfiles="${DOTFILES:-$HOME/Developer/github/abranhe/dotfiles}"
  local repo="${DOTFILES_REPO:-https://github.com/abranhe/dotfiles.git}"
  local brew

  if [ "$(uname -s)" != Darwin ]; then
    echo "These dotfiles only support macOS." >&2
    exit 1
  fi

  load_brew() {
    for brew in /opt/homebrew/bin/brew /usr/local/bin/brew; do
      if [ -x "$brew" ]; then
        eval "$("$brew" shellenv)"
        return 0
      fi
    done
    return 1
  }

  if ! load_brew; then
    echo "==> Installing Homebrew and the Xcode Command Line Tools"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/tty
    load_brew
  fi

  if ! brew list git >/dev/null 2>&1; then
    echo "==> Installing git"
    brew install --quiet git
  fi

  if [ -d "$dotfiles/.git" ]; then
    echo "==> Updating $dotfiles"
    git -C "$dotfiles" pull --rebase --autostash --quiet || true
  elif [ -f "$dotfiles/bin/dot" ]; then
    # A downloaded zip extracted in place: turn it into a clone, keeping files.
    echo "==> Connecting $dotfiles to $repo"
    git -C "$dotfiles" init --quiet
    git -C "$dotfiles" remote add origin "$repo"
    git -C "$dotfiles" fetch --quiet origin
    git -C "$dotfiles" remote set-head origin --auto >/dev/null
    local branch
    branch="$(git -C "$dotfiles" rev-parse --abbrev-ref origin/HEAD)"
    branch="${branch#origin/}"
    git -C "$dotfiles" symbolic-ref HEAD "refs/heads/$branch"
    git -C "$dotfiles" reset --quiet "origin/$branch"
    git -C "$dotfiles" branch --quiet --set-upstream-to="origin/$branch"
  else
    echo "==> Cloning $repo into $dotfiles"
    mkdir -p "$(dirname "$dotfiles")"
    git clone --quiet "$repo" "$dotfiles"
  fi

  exec "$dotfiles/bin/dot" "$@" install </dev/tty
}

main "$@"
