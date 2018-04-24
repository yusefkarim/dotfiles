#
# ~/.bash_profile
#
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
