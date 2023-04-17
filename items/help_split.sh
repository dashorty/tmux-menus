#!/bin/sh
#
#   Copyright (c) 2022-2023: Jacob.Lundqvist@gmail.com
#   License: MIT
#
#   Part of https://github.com/jaclu/tmux-menus
#
#   Help about splitting the view
#

#  shellcheck disable=SC2034
#  Directives for shellcheck directly after bang path are global

CURRENT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
SCRIPT_DIR="$(dirname "$CURRENT_DIR")/scripts"

# shellcheck disable=SC1091
. "$SCRIPT_DIR/dialog_handling.sh"

previous_menu="$1"

if [ -z "$previous_menu" ]; then
    error_msg "help_split.sh was called without notice of what called it"
fi

#
#  TODO: For odd reasons this title needs multiple right padding spaces,
#        in order to actually print one, figure out what's going on
#

menu_name="Help, Split view"

set -- \
    0.0 M Left "Back to Previous menu  <--" "$previous_menu" \
    0.0 S \
    1.0 T "Creating a new pane by" \
    1.0 T "splitting current Pane or" \
    1.0 T "Window." \
    1.0 T " " \
    1.0 T "Window refers to the entire" \
    1.0 T "display."

req_win_width=37
req_win_height=10

parse_menu "$@"
