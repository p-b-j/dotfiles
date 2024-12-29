#!/usr/bin/env bash

CONFIG_DIR="${HOME}/.config"

_link_config_dir() {
	target_dirname="$1"

	ln -sf "${PWD}/${target_dirname}" "${CONFIG_DIR}"
}

_link_config_dir "i3"
_link_config_dir "i3status"
_link_config_dir "Xresources.d"

ln -sf "${PWD}/.Xresources" "${HOME}"

sudo ln -sf "${PWD}/xorg.conf.d"/* "/etc/X11/xorg.conf.d/"
