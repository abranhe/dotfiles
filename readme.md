# dotfiles

> Abraham's dotfiles for macOS.

## Install

On a brand new Mac, nothing else needed:

```sh
curl -fsSL https://raw.githubusercontent.com/abranhe/dotfiles/master/install.sh | bash
```

Or download the zip, extract it and run `./install.sh`. Either way it:

1. Installs Homebrew, which brings the Xcode Command Line Tools.
2. Clones this repo to `~/Developer/github/abranhe/dotfiles` (override with `DOTFILES=…`).
3. Runs `dot install`: git, 1Password, gitleaks, Oh My Zsh, the private layers,
   symlinks, every Brewfile and the secrets from 1Password.

Everything is safe to re-run. `dot doctor` tells you what is missing.

## Layers

Configuration is split in layers, loaded in this order:

| Layer         | Where           | Visibility                                   |
| ------------- | --------------- | -------------------------------------------- |
| public        | this repo       | public, shared by every machine              |
| personal      | `personal/`     | private repo `abranhe/dotfiles-personal`     |
| work/\<env\>  | `work/<env>/`   | private repo `abranhe/dotfiles-work`, one folder per work environment |

The private repos are listed in [private.repos](private.repos), cloned by
`dot private` over SSH (1Password's SSH agent) and ignored by this repo, so
nothing private ever lands here.

Each layer can have any of:

| File                                    | Purpose                                        |
| --------------------------------------- | ---------------------------------------------- |
| `.exports` `.path` `.aliases` `.functions` | Sourced by `.zshrc`                         |
| `bin/`                                  | Added to `PATH`                                |
| `Brewfile`                              | Packages for that layer                        |
| `mise.toml`                             | Tool versions, linked into `~/.config/mise/conf.d/` |
| `links`                                 | Symlinks into `$HOME` (`<file> <target>`)       |
| `.gitconfig`                            | Included from `~/.gitconfig`, e.g. an `includeIf` identity per folder |
| `.secrets`                              | 1Password references, see below                |

By default every layer on disk is active. Pin what a machine uses with
`dot layers set personal work/excel` (stored in `~/.config/dotfiles/layers`).
Create a new work environment with `dot new work/acme`.

## Tools

[mise](https://mise.jdx.dev) manages language runtimes and CLI tools, replacing
nvm, volta and friends. Homebrew is for apps and system packages.

- Global versions live in [mise.toml](mise.toml) (`~/.config/mise/config.toml`).
- A layer's `mise.toml` adds or overrides tools on machines using that layer.
- Projects pin their own with `mise use node@24` (writes `mise.toml`);
  `.nvmrc`, `.node-version` and `.python-version` are honored too.

`dot install` installs them, `dot update` upgrades them.

## Secrets

Nothing secret is committed, in any repo:

- `.secrets` files hold only 1Password references
  (`export NPM_TOKEN='{{ op://dev/npm_token/value }}'`). `dot secrets` resolves
  them in one go into `~/.config/dotfiles/secrets.env` (mode 600), which the
  shell loads.
- A pre-commit hook ([hooks/pre-commit](hooks/pre-commit)) runs gitleaks on
  this repo and every private layer, and refuses files like `.env` or private
  keys. `dot hooks` installs it.
- GitHub Actions run gitleaks on every push to this repo.

## Daily use

```sh
dot status            # changes across all repos
dot pull              # pull all repos
dot push "message"    # commit (after confirmation) and push all repos
dot sync              # pull + push
dot update            # pull, upgrade Homebrew and Oh My Zsh

dot brew              # missing packages, and installed ones in no Brewfile
dot brew add --cask --to personal spotify
dot brew rm spotify
dot brew sync         # file each untracked package under a layer, or uninstall it
dot brew cleanup      # uninstall everything that is in no Brewfile
```

`dot help` lists everything. `dots` jumps to this folder.

Machine specific shell settings that should not be committed go in
`~/.zshrc.local`.

## Useful links

Some of the resources I used are:

- https://github.com/mathiasbynens/dotfiles
- https://github.com/kevinSuttle/dotfiles
- https://github.com/styfle/dotfiles
- https://openfolder.sh/macos-migrations-with-brewfile
