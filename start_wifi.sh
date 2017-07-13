#!/bin/bash

ip link set dev wlp4s0 up
wpa_supplicant -B -i wlp4s0 -c /etc/wpa_supplicant/wpa_supplicant.conf
dhcpcd wlp4s0
