#!/bin/ksh
#
# $Header$
# 
#lemonbar -g 1920x15 -b -n lemonbar -B "#1d2021" -f -*-terminal-bold-*-*-*-14-*-*-*-*-*-iso8859-1
# Add this to ~/.xsession

RED="%{F#fb4934}"
GREEN="%{F#b8bb26}"
YELLOW="%{F#fabd2f}"
WHITE="%{F#ebdbb2}"
RESET="%{F-}"


BAT() {
	ADAPTER=$(apm -a)
	if [ $ADAPTER = 0 ] ; then
        ADAPTER="BAT: "
	else
        ADAPTER="PLUG: "
	fi
	REMAINING=$(apm -m)
    if [ "$REMAINING" != "unknown" ] ; then
        REMAINING="($REMAINING min) "
    fi
	BATTERY=$(apm -l)
	if [ $BATTERY -gt 66 ] ; then
        BATTERY="$GREEN$ADAPTER$BATTERY%% $REMAINING$RESET "
	elif [ $BATTERY -gt 33 ] ; then
        BATTERY="$YELLOW$ADAPTER$BATTERY%% $REMAINING$RESET "
	else
        BATTERY="$RED$ADAPTER$BATTERY%% $REMAINING$RESET "
	fi

    echo -n $BATTERY
}

DATE() {
	DATETIME=$(date "+%A %Y-%m-%d %I:%M")
	echo -n "$DATETIME "
}

CAPS() {
    CAPS_LOCK=$(wsconsctl -n keyboard.ledstate)
    if [ $CAPS_LOCK = 0 ] ; then
        echo -n "${RED}CAPS$RESET "
    else
        echo -n "${GREEN}CAPS$RESET "
    fi
}

CPU() {
    CPULOAD=$(( 100 - $(top -1n -p 0 | awk '/CPUs:/ { split($13, a, "."); print a[1]; }') ))
    CPUTEMP=$(sysctl -n hw.sensors.cpu0.temp0 | awk '{ sub(" degC", "°"); print $0 }')
    CPUSPEED=$(sysctl -n hw.cpuspeed)
	if [ $CPULOAD -ge 90 ] ; then
        CPULOAD="$RED$CPULOAD%% "
	elif [ $CPULOAD -ge 80 ] ; then
        CPULOAD="$YELLOW$CPULOAD%% "
	else
        CPULOAD="$WHITE$CPULOAD%% "
	fi
    echo -n "CPU: $CPULOAD ($CPUTEMP, $CPUSPEED MHz) "
}

VOL() {
	MUTE=$(mixerctl -n outputs.master.mute)
	MASTER=$(($(mixerctl outputs.master | awk -F '(=|,)' '{ print $2 }')*100/255))
    echo -n "VOL: "
	if [ "$MUTE" = "on" ] ; then
		echo -n "MUTE "
	else
		echo -n "$MASTER%% "
	fi
}

IP() {
    WIFI_STATUS=$(ifconfig iwm0 | awk '/status: / { print $2 }')
    WIFI=$(ifconfig iwm0 | awk '/inet / { print $2 }')
    ETH_STATUS=$(ifconfig em0 | awk '/status: / { print $2 }')
    ETH=$(ifconfig em0 | awk '/inet / { print $2 }')
	echo -n "IP: "
	if [ "$WIFI_STATUS" = "active" ] ; then
		echo -n "WIFI: $WIFI "
	elif [ "$ETH_STATUS" = "active" ] ; then
		echo -n "ETHERNET: $ETH "
    else
        echo -n "DOWN "
	fi
}

VPN () {
}

while true ; do
    echo "%{l} $(CAPS)| $(BAT)| $(CPU)| %{c}$(uname -rs) %{r}| $(VOL)| $(IP)| $(DATE)"
	sleep 1
done
