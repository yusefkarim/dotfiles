#!/bin/sh
# Original script by TuM'Fatig
# https://www.tumfatig.net/20190405/blocking-ads-using-unbound8-on-openbsd/

# Available blocklists - comment line to disable blocklist
_disconad="https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
_discontrack="https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt"
_hostfiles="https://hosts-file.net/ad_servers.txt"
_malwaredom="https://mirror1.malwaredomains.com/files/justdomains"
_stevenblack="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
_zeustracker="https://zeustracker.abuse.ch/blocklist.php?download=domainblocklist"

# Global variables
_tmpfile="$(mktemp)" && echo '' > $_tmpfile
_unboundconf="/etc/unbound/adhosts.conf"
_unboundroothints="/etc/unbound/root.hints"

# Remove comments from blocklist
function simpleParse {
  curl -s $1 | \
  sed -e 's/#.*$//' -e '/^[[:space:]]*$/d' >> $2
}

# Parse MalwareDom
[[ -n ${_malwaredom+x} ]] && simpleParse $_malwaredom $_tmpfile

# Parse ZeusTracker
[[ -n ${_zeustracker+x} ]] && simpleParse $_zeustracker $_tmpfile

# Parse DisconTrack
[[ -n ${_discontrack+x} ]] && simpleParse $_discontrack $_tmpfile

# Parse DisconAD
[[ -n ${_disconad+x} ]] &&  simpleParse $_disconad $_tmpfile

# Parse StevenBlack
[[ -n ${_stevenblack+x} ]] && \
  curl -s $_stevenblack | \
  sed -n '/Start/,$p' | \
  sed -e 's/#.*$//' -e '/^[[:space:]]*$/d' | \
  awk '/^0.0.0.0/ { print $2 }' >> $_tmpfile

# Parse hpHosts
[[ -n ${_hostfiles+x} ]] && \
   curl -s $_hostfiles | \
  sed -n '/START/,$p' | tr -d '^M$' | \
  sed -e 's/#.*$//' -e '/^[[:space:]]*$/d' -e 's/$//' | \
  awk '/^127.0.0.1/ { print $2 }' >> $_tmpfile

# Create unbound(8) local zone file
sort -fu $_tmpfile | grep -v "^[[:space:]]*\$" | \
awk '{
  print "local-zone: \"" $1 "\" redirect"
  print "local-data: \"" $1 " A 0.0.0.0\""
}' > $_unboundconf && rm -f $_tmpfile

# Update root hints file
curl -s --output $_unboundroothints https://www.internic.net/domain/named.cache

exit 0
