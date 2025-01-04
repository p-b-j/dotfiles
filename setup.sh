#!/usr/bin/env bash

CONFIG_DIR="${HOME}/.config"

_link_config_dir() {
	target_dirname="$1"

	ln -sf "${PWD}/${target_dirname}" "${CONFIG_DIR}"
}

# systemd
_link_config_dir systemd

# i3
_link_config_dir i3
_link_config_dir i3status

# x server
_link_config_dir "Xresources.d"

ln -sf "${PWD}/.Xresources" "${HOME}"

sudo ln -sf "${PWD}/xorg.conf.d"/* "/etc/X11/xorg.conf.d/"

# alacritty
_link_config_dir alacritty

# bash
ln -sf "${PWD}/.bashrc" "${HOME}"

# nvim
_link_config_dir nvim

# tmux
_link_config_dir tmux
