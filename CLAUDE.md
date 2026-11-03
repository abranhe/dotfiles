# CLAUDE.md

macOS dotfiles, managed through the `dot` CLI ([bin/dot](bin/dot)). User docs are
in [readme.md](readme.md); this file is for making changes.

## This repo is public

- Never write tokens, passwords, keys, hostnames, account IDs or employer
  details in this repo. They go in a private layer.
- Secrets are only ever 1Password references in a layer's `.secrets`
  (`export X='{{ op://vault/item/field }}'`), resolved by `dot secrets`.
- Never commit with `--no-verify`. The pre-commit hook runs gitleaks.

## Layout

| Path | Role |
| --- | --- |
| `bin/dot` | The CLI: install, link, layers, push/pull, brew, secrets, doctor |
| `lib/layers.sh` | Resolves active layers; sourced by both `.zshrc` and `bin/dot` |
| `install.sh` | `curl \| bash` bootstrap: Homebrew, git, clone, then `dot install` |
| `hooks/pre-commit` | Secret scan for this repo and every private layer (`core.hooksPath`) |
| `links` | Symlink manifest: `<file in layer>  <target>` |
| `private.repos` | Private layers to clone: `<dir>  <git url>` |
| `mise.toml` | Global tool versions (node, pnpm, ...) |
| `Brewfile` | Packages for every machine |
| `completions/_dot` | zsh completion, update it when commands change |
| `.github/workflows/secrets.yml` | gitleaks on every push |

## Layers

Load order: this repo, `personal/`, then each `work/<env>/`.
- `personal/` and `work/` are separate private git repos, ignored here.
- They are not submodules. Never add them as submodules or commit their contents here.
- `work/` holds one folder per work environment (e.g. `work/excel`).

Every layer may have any of these files, all optional:
- shell: `.exports` `.path` `.aliases` `.functions`
- `bin/`
- `Brewfile`, `mise.toml`
- `links`, `.gitconfig`, `.secrets`

Adding a new layer file type means updating all of these:
- `lib/layers.sh` or `.zshrc`, to load it
- `cmd_link` in `bin/dot`, if it needs linking
- the `dot new` templates
- the layer table in `readme.md`

Machine-local state lives outside the repo:
- `~/.config/dotfiles/`: `layers`, the generated `gitconfig`, `secrets.env`
- `~/.zshrc.local`

## Where things go

- A package or tool needed on every machine goes in the root `Brewfile`.
  Personal ones go in `personal/Brewfile`, work ones in `work/<env>/Brewfile`.
  Use `dot brew add [--cask] --to <layer> <name>`.
- Language runtimes and dev CLIs go in a `mise.toml`, not Homebrew. Don't
  reintroduce nvm, volta or similar.
- `1password-cli` is a cask, not a formula.
- Aliases, functions and env vars go in the matching dotfile of the right
  layer. Don't add them to `.zshrc` directly.
- When an installer appends to `~/.zshrc`, it edits this repo through the
  symlink. Move those lines into the right layer or `~/.zshrc.local`.

## Shell constraints

- `bin/dot` and `install.sh` must run on macOS's `/bin/bash` 3.2, because they
  run on a fresh machine. No associative arrays, `mapfile`, `${var,,}` or `|&`.
  Under `set -u`, check `${#arr[@]}` before expanding an array that may be empty.
- `lib/layers.sh` must work in both zsh and bash 3.2.
- `bin/dot` uses `set -euo pipefail`:
  - Don't end a function on a failing `[ ... ] && x`. Use `if`.
  - Don't use `cmd | grep -q` (SIGPIPE + pipefail). Capture the output, then use `case`.
- Prompts read from `/dev/tty` (`ask`, `prompt`) so they work under `curl | bash`.
- `install.sh` keeps everything inside `main()`, so a truncated download never runs.
- Every command must be safe to re-run.

## Verifying changes

```sh
bash -n bin/dot install.sh hooks/pre-commit && zsh -n .zshrc
bin/dot help
bin/dot doctor
zsh -i -c exit                 # shell starts without errors
bin/dot brew check             # after touching any Brewfile
```

- Test hooks in a throwaway repo in a temp dir with
  `git config core.hooksPath <this repo>/hooks`.
- Test `dot push`/`dot pull` in a sandbox: clone this repo and the private repos
  from local bare copies, then run `bin/dot` from that clone.
  - Never run `dot push` or `dot -y push` on the real repos to test. It commits and pushes all of them.
  - Never pipe it into `head` either.
