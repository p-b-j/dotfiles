#!/usr/bin/env bash

set -euo pipefail

session_id="$(tmux display-message -p '#S')"

saved_terminal_id_file="${HOME}/.config/tmux/.${session_id}-terminal-pane-id"
saved_terminal_id="wut"

if [ -f "${saved_terminal_id_file}" ]; then
    saved_terminal_id="$(<"${saved_terminal_id_file}")"
fi

if tmux has-session -t "${saved_terminal_id}" &>/dev/null; then
    if tmux list-panes -F "#D" | grep "${saved_terminal_id}" &>/dev/null; then
        tmux break-pane -d -s "${saved_terminal_id}"
    else
        tmux join-pane -h -s "${saved_terminal_id}"
        tmux resize-pane -R 20
    fi
else
    tmux split-window -h
    tmux resize-pane -R 20
    tmux run "echo '#{pane_id}'" >"${saved_terminal_id_file}"
fi
