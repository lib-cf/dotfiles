[[ -d "${HOME}/.dotfiles" ]] &&
  alias dotfiles='git --git-dir="${HOME}/.dotfiles" --work-tree="$HOME"'

(( $+commands[eza] )) &&
  alias ls='eza --icons --no-quotes'

(( $+commands[gittower] )) &&
  alias tower='(toplevel="$(git rev-parse --show-toplevel)" && gittower "$toplevel")'
