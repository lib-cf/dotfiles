autoload -Uz compinit &&
  compinit

autoload -Uz up-line-or-beginning-search &&
  zle -N up-line-or-beginning-search &&
  bindkey '^[[A' up-line-or-beginning-search

autoload -Uz down-line-or-beginning-search &&
  zle -N down-line-or-beginning-search &&
  bindkey '^[[B' down-line-or-beginning-search

WORDCHARS=${WORDCHARS//\//}

export EDITOR=nano

setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

setopt INC_APPEND_HISTORY

HISTSIZE=10000
SAVEHIST=10000

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select

(( $+commands[vivid] )) &&
  export LS_COLORS="$(vivid generate ansi)" &&
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

[[ -r "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
  source "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

[[ -r "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] &&
  source "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

[[ -r "${HOMEBREW_PREFIX}/opt/spaceship/spaceship.zsh" ]] &&
  source "${HOMEBREW_PREFIX}/opt/spaceship/spaceship.zsh"

[[ -d "${HOME}/.dotfiles" ]] &&
  alias dotfiles='git --git-dir="${HOME}/.dotfiles" --work-tree="$HOME"'

(( $+commands[eza] )) &&
  alias ls='eza --icons --no-quotes'

(( $+commands[gum] )) &&
  alias gum='TERM_PROGRAM=Apple_Terminal TERM=xterm-256color command gum'

(( $+commands[gittower] )) &&
  alias tower='toplevel=$(git rev-parse --show-toplevel) && gittower "$toplevel"'

(( $+commands[maestro] )) &&
  alias maestro='MAESTRO_OPTS="--enable-final-field-mutation=ALL-UNNAMED" command maestro'

[[ -r "${HOME}/.config/zsh/copilot.zsh" ]] &&
  source "${HOME}/.config/zsh/copilot.zsh"
