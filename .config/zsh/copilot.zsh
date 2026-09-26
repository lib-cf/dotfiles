if (( $+commands[gum] && $+commands[copilot] ))
then

  _gh-copilot-action() {

    local mode=$1 title prompt tmp

    case $mode in
      suggest)
        title="Suggesting..."
        prompt="Output exactly one zsh command, nothing else, for the following description: ${BUFFER}"
        ;;
      explain)
        title="Explaining..."
        prompt="Explain this zsh command piece by piece: ${BUFFER}"
        ;;
      *)
        return 1
        ;;
    esac

    zle -I

    tmp=$(mktemp) || return 1

    {
      if gum spin --spinner minidot --title "$title" -- \
        sh -c 'copilot --deny-tool=shell -sp "$1" > "$2"' _ "$prompt" "$tmp"
      then
        case $mode in
          suggest)
            BUFFER=" $(<"$tmp")"
            CURSOR=${#BUFFER}
            ;;
          explain)
            cat "$tmp"
            ;;
        esac
      fi
    } always {
      zle reset-prompt
      rm -f "$tmp"
    }

  }

  _gh-copilot-suggest() { _gh-copilot-action suggest }
  _gh-copilot-explain() { _gh-copilot-action explain }

  zle -N _gh-copilot-suggest
  zle -N _gh-copilot-explain

  bindkey '^[\' _gh-copilot-suggest
  bindkey '^[?' _gh-copilot-explain

fi
