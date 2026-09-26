typeset -U path PATH

[[ -x /opt/homebrew/bin/brew ]] &&
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"

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

java_home="$(/usr/libexec/java_home 2>/dev/null)"

if [[ -d "$java_home" ]]
then
  export JAVA_HOME="$java_home"
  path+=(
    "${JAVA_HOME}/bin"
  )
fi

unset java_home

android_home="${HOME}/Library/Android/sdk"

if [[ -d "${android_home}/emulator" && -d "${android_home}/platform-tools" ]]
then
  export ANDROID_HOME="$android_home"
  path+=(
    "${ANDROID_HOME}/emulator"
    "${ANDROID_HOME}/platform-tools"
  )
fi

unset android_home
