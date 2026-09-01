# Dotfiles

One bootstrap command installs the native packages for the current operating
system, links the same configuration everywhere with GNU Stow, installs current
shell/tmux plugins, bootstraps Neovim, and checks the result.

```sh
git clone https://github.com/imehighlow/dotfiles.git "$HOME/.dotfiles"
cd "$HOME/.dotfiles"
./bootstrap
```

The bootstrap is idempotent: rerun it to install anything that is missing or to
repair links and plugin revisions.

## Supported systems

| System | Native package manager |
| --- | --- |
| macOS | Homebrew and `brew bundle` |
| Arch Linux | `pacman`; `yay` is bootstrapped when `packages/aur.txt` is nonempty |
| Ubuntu | `apt` plus the Neovim unstable PPA |
| Debian | `apt` (Neovim 0.11+ must be available in the configured repositories) |

Docker and other detected containers automatically use headless mode. To select
it explicitly—for an OrbStack machine, for example—run:

```sh
./bootstrap --headless
```

Headless mode installs the terminal environment but skips Ghostty and changing
the login shell.

## Useful commands

```sh
./bootstrap --dry-run
./bootstrap --only packages
./bootstrap --only links
./bootstrap --only plugins
./bootstrap --only nvim
./scripts/doctor
./scripts/update
```

`scripts/update` fast-forwards zsh/tmux plugins and runs Lazy sync for Neovim.

## Update policy

- Plugin repositories are declared in `plugins.txt` and fast-forwarded to their
  current default branches whenever bootstrap or `scripts/update` runs.
- Neovim runs Lazy sync and keeps its machine-local runtime lock outside this
  repository.
- Homebrew, pacman/yay, and apt install the current version offered by their
  native repositories. Package names are committed under `packages/`.

## Local configuration

The shared zsh configuration is platform-neutral. Put machine-specific paths,
private environment variables, and secrets in `~/.zshrc.local`; it is sourced
when present and is not part of this repository. Set `OBSIDIAN_VAULT` there when
the vault is not in the default macOS iCloud location.

Stow conflicts are not overwritten automatically. Move an existing conflicting
configuration aside, then rerun `./bootstrap --only links`.
