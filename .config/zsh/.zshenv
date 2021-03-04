# vim: syntax=sh
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.local/cache"
export XDG_DATA_HOME="$HOME/.local/share"
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export LESSHISTFILE="-"
export LESS=-R

export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export HISTFILE="$XDG_DATA_HOME"/bash/history
#export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hist"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"
export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd
export TEXMFHOME="$XDG_CONFIG_HOME"/texlive/texmf-config
export TEXMFHOME="$XDG_DATA_HOME"/texmf
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
#export VIMINIT='if !has('nvim') | source "$XDG_CONFIG_HOME/vim/vimrc" | endif'
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

export QT_QPA_PLATFORMTHEME=qt5ct

export MOZ_ENABLE_WAYLAND=1

export MANPAGER="nvim -c 'set ft=man' -"

source $XDG_CONFIG_HOME/user-dirs.dirs

export EDITOR=/sbin/nvim
export VISUAL=/sbin/nvim
export TERMINAL=/sbin/alacritty

# add ~/.bin to $PATH
export PATH=~/.local/bin:$PATH

# go environment variables
export GOBIN=/home/miha/go/bin
export GOPATH=/home/miha/go

export MAKEFLAGS="-j7"

export ERRFILE=$XDG_RUNTIME_DIR/xsession-errors


HISTFILE=$XDG_DATA_HOME/zsh/history
HISTSIZE=1000
SAVEHIST=1000
