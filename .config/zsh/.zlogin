source $ZDOTDIR/.zshrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	export XDG_SESSION_TYPE=wayland
	exec sway
fi
