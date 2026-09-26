#
# Brightness
#
# Display Brightness

BRIGHTNESS=$'\xF0\x9F\x94\x85'

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_BRIGHTNESS_ASYNC="${SPACESHIP_BRIGHTNESS_ASYNC=true}"
SPACESHIP_BRIGHTNESS_SHOW="${SPACESHIP_BRIGHTNESS_SHOW=true}"
SPACESHIP_BRIGHTNESS_PREFIX="${SPACESHIP_BRIGHTNESS_PREFIX="at "}"
SPACESHIP_BRIGHTNESS_SUFFIX="${SPACESHIP_BRIGHTNESS_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_BRIGHTNESS_SYMBOL="${SPACESHIP_BRIGHTNESS_SYMBOL="$BRIGHTNESS "}"
SPACESHIP_BRIGHTNESS_COLOR="${SPACESHIP_BRIGHTNESS_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_brightness() {
  [[ $SPACESHIP_BRIGHTNESS_SHOW == false ]] && return

  spaceship::exists brightness || return

  local brightness_value=$(brightness)

  [[ -z $brightness_value ]] && return

  spaceship::section::v4 \
    --prefix "$SPACESHIP_BRIGHTNESS_PREFIX" \
    --suffix "$SPACESHIP_BRIGHTNESS_SUFFIX" \
    --symbol "$SPACESHIP_BRIGHTNESS_SYMBOL" \
    --color "$SPACESHIP_BRIGHTNESS_COLOR" \
    "${brightness_value//\%/%%}"
}

unset BRIGHTNESS
