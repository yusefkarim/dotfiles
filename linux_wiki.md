# Creating bootable USB
dd bs=4M if=/path/to/.iso of=/dev/sdX status=progress oflag=sync

# Setting up wifi
wpa_passphrase SSID PASSWORD  >> SSID.txt 	#Use this to create the encrypted password, then create file below
cat /etc/wpa_supplicant/wpa_supplicant-DEVICE.conf

	ctrl_interface=/run/wpa_supplicant
	ctrl_interface_group=wheel
	eapol_version=1
	ap_scan=1
	fast_reauth=1
	update_config=1

	network={
		ssid="SSID"
		psk=encrypted password
	}

wpa_supplicant -B -i DEVICE -c /etc/wpa_supplicant/wpa_supplicant-DEVICE.conf

