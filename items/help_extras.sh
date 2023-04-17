#!/bin/sh
#
#   Copyright (c) 2022-2023: Jacob.Lundqvist@gmail.com
#   License: MIT
#
#   Part of https://github.com/jaclu/tmux-menus
#
#   General Help
#

#  shellcheck disable=SC2034
#  Directives for shellcheck directly after bang path are global

CURRENT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
SCRIPT_DIR="$(dirname "$CURRENT_DIR")/scripts"

# shellcheck disable=SC1091
. "$SCRIPT_DIR/dialog_handling.sh"

previous_menu="$1"

if [ -z "$previous_menu" ]; then
    error_msg "help.sh was called without notice of what called it"
fi

menu_name="Help Extras"

set -- \
    0.0 M Left "Back to Previous menu  <--" "$previous_menu" \
    0.0 S \
    1.0 T "Extras are menus manipulating" \
    1.0 T "other software." \
    1.0 T "If a specific app is not found," \
    1.0 T "that entry is gryed out."

req_win_width=37
req_win_height=8

parse_menu "$@"
