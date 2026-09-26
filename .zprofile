typeset -U path PATH

[[ -x /opt/homebrew/bin/brew ]] &&
  eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -r "${HOME}/.swiftly/env.sh" ]] &&
  source "${HOME}/.swiftly/env.sh"

[[ -d "${HOME}/.mint/bin" ]] &&
  path=(
    "${HOME}/.mint/bin"
    $path
  )

[[ -d "${HOME}/.local/bin" ]] &&
  path=(
    "${HOME}/.local/bin"
    $path
  )

[[ -d "$(/usr/libexec/java_home)" ]] &&
  export JAVA_HOME="$(/usr/libexec/java_home)"

if [[ -d "${HOME}/Library/Android/sdk" ]]
then

  export ANDROID_HOME="${HOME}/Library/Android/sdk"

  path+=(
    "${ANDROID_HOME}/emulator"
    "${ANDROID_HOME}/platform-tools"
  )

fi
