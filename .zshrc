autoload -Uz compinit &&
  compinit

autoload -Uz up-line-or-beginning-search &&
  zle -N up-line-or-beginning-search &&
  bindkey '^[[A' up-line-or-beginning-search

autoload -Uz down-line-or-beginning-search &&
  zle -N down-line-or-beginning-search &&
  bindkey '^[[B' down-line-or-beginning-search

export EDITOR=nano

WORDCHARS=${WORDCHARS//\//}

HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"

HISTSIZE=10000
SAVEHIST=10000

setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

setopt INC_APPEND_HISTORY

setopt AUTO_CD
setopt AUTO_PUSHD

setopt PUSHD_IGNORE_DUPS

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select

(( $+commands[vivid] )) &&
  export LS_COLORS="$(vivid generate ansi)" &&
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

for file in "${HOME}/.config/zsh/"*.zsh(N)
do
  [[ -r "$file" ]] && source "$file"
done

[[ -r "${HOMEBREW_PREFIX}/opt/spaceship/spaceship.zsh" ]] &&
  source "${HOMEBREW_PREFIX}/opt/spaceship/spaceship.zsh"

[[ -r "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
  source "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

[[ -r "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] &&
  source "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
