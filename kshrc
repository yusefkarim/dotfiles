# ~/.kshrc

# If not running interactively, don't do anything
if [[ $TERM == "vt220" ]]; then
	return
fi

WHITE=$(tput setaf 223 223 223)
GRAY=$(tput setaf 007 007 007)
RED=$(tput setaf 197 197 197)
ORANGE=$(tput setaf 208 208 208)
BLUE=$(tput setaf 037 037 037)
GREEN=$(tput setaf 148 148 148)

PS1='\[${GRAY}\][\[${RED}\]\u\[${WHITE}\]@\[${BLUE}\]\h \[${GREEN}\]\W\[${GRAY}\]]\[${ORANGE}\]\$\[${WHITE}\] '

# ------ Safety features -----
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# ------ Functions -----
compress() { tar -czvf "${1}.tar.gz" "$1"; }
detach() { "$1" "$2" 2>&1 > /dev/null & }
img() { feh -xZ --scale-down -B black "$1"  2>&1 > /dev/null & }
chmodall() { find $1 -type f -exec chmod 644 {} \;; }
utf8tohex() { printf $1 | hexdump -e '"\\x%1_u"'; }

# ------ Aliases -----
alias ls='ls -CF'
alias lh='ls -lh'
alias pdf='detach evince'
alias wiki='vim ~/Documents/wiki/index.md'
alias ss='netstat -nltu -f inet'
alias httpserver='python -m http.server'

