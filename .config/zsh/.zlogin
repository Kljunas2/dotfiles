source $ZDOTDIR/.zshrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	export XDG_SESSION_TYPE=wayland
	export XDG_CURRENT_DESKTOP=sway
	exec sway
fi
