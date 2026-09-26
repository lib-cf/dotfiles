# Dotfiles

## New computer setup

```shell
git clone --bare git@github.com:lib-cf/dotfiles.git "${HOME}/.dotfiles"
```

```shell
git --git-dir="${HOME}/.dotfiles" --work-tree="$HOME" config --local status.showUntrackedFiles no
```

> [!NOTE]
> If the following checkout fails because tracked dotfiles already exist in `$HOME`, move or remove the conflicting 
> files and try again.

```shell
git --git-dir="${HOME}/.dotfiles" --work-tree="$HOME" checkout
```

```shell
git --git-dir="${HOME}/.dotfiles" --work-tree="$HOME" update-index --skip-worktree README.md
```

```shell
rm README.md
```

```shell
brew bundle --global
```

### Add to `.zshrc`

```shell
[[ -d "${HOME}/.dotfiles" ]] &&
  alias dotfiles='git --git-dir="${HOME}/.dotfiles" --work-tree="$HOME"'
```

## Git status commands

#### Without untracked files

```shell
dotfiles status
```

#### With untracked files

```shell
dotfiles -c status.showUntrackedFiles=normal status
```

## Original installation

> [!IMPORTANT]
> The following original installation instructions are included only for reference purposes – do not use for new 
> computer setup.

```shell
git init --bare "${HOME}/.dotfiles"
```

```shell
git --git-dir="${HOME}/.dotfiles" --work-tree="$HOME" config --local status.showUntrackedFiles no
```

### Add to `.zshrc`

```shell
[[ -d "${HOME}/.dotfiles" ]] &&
  alias dotfiles='git --git-dir="${HOME}/.dotfiles" --work-tree="$HOME"'
```
