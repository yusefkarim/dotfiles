# ~/.kshrc

# If not running interactively, don't do anything
if [[ $TERM == "vt220" ]]; then
	return
fi

WHITE=$(tput setaf 7 7 7)
RED=$(tput setaf 197 197 197)
ORANGE=$(tput setaf 208 208 208)
BLUE=$(tput setaf 045 045 045)
GREEN=$(tput setaf 148 148 148)

PS1='\[${WHITE}\][\[${RED}\]\u\[${WHITE}\]@\[${BLUE}\]\h \[${GREEN}\]\W\[${WHITE}\]]\[${ORANGE}\]\$\[${WHITE}\] '

# ------ Safety features -----
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ls='ls -CF'
alias httpserver='python -m http.server'
alias diskname='sysctl hw.disknames'
compress() { tar -czvf "${1}.tar.gz" "$1"; }

