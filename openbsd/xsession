export LANG=en_US.UTF-8         # Use UTF-8
export ENV=$HOME/.kshrc         # Location of kshrc

xrdb -merge $HOME/.Xresources   # Load Xresources file

xsetroot -solid black           # Background colour
xset b off                      # Disable system beep

# Lock display when idle for more than 300 seconds
#xidle -program "/usr/X11R6/bin/xlock" -timeout 300 &

# Start status bar
/home/cuyler/Documents/scripts/lemonbar.sh | \
lemonbar -g 1920x15 -b -n lemonbar -B "#1d2021" -f \
-*-terminal-bold-*-*-*-14-*-*-*-*-*-iso8859-1

exec cwm                        # Start cwm
