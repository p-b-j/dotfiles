export PS1="[\u@\h]\w \$ "

eval "$(direnv hook bash)"

alias vim=nvim
export EDITOR=nvim

. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
. "$HOME/.nix-profile/etc/profile.d/bash_completion.sh"
