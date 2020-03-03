# Put arch on USB
dd bs=4M if=archlinux.iso of=/dev/sdX status=progress oflag=sync

# Boot into USB drive and setup wifi (or just plug in ethernet)
```
wpa_passphrase SSID PASSWORD  >> SSID.conf
wpa_supplicant -B -i wlp4s0 -c SSID.conf
dhcpcd wlp4s0
```

# Update system clock
```
timedatectl set-ntp true
```

# Partition disk
```
fdisk -l
fdisk /dev/sdX
* Delete old partitions
* Make 8-16G swap partition on /dev/sdX2
* Make bootable root partition using the rest of disk space on /dev/sdX1
```

# Format partitions
```
mkfs.ext4 /dev/sdX1
mkswap /dev/sdX2
swapon /dev/sdX2
```

# Mount file system
```
mount /dev/sdX1 /mnt
```

# Edit mirrorlist (move closer locations to the top)
```
vim /etc/pacman.d/mirrorlist
```

# Use pacstrap to download basic things
```
pacstrap /mnt base base-devel vim wpa_supplicant git python3
```

# Generate Fstab file
```
genfstab -U /mnt >> /mnt/etc/fstab
```

# Change root into the new system
```
arch-chroot /mnt
```

# Set correct time zone and hardware clock from the system clock
```
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
hwclock --systohc
```

# Uncomment locales then generate them
```
# Uncomment en_US.UTF-8 UTF-8 and en_US ISO-8859-1
vim /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
```

# Create hostname files
```
echo "HOSTNAME" > /etc/hostname
vim /etc/hosts
	-> 127.0.0.1	localhost
	-> ::1		localhost
	-> 127.0.1.1	HOSTNAME.localdomain	HOSTNAME
```

# Set root password
```
passwd
```

# Install bootloader and microcode (if on x64 CPU)
```
pacman -S grub intel-ucode
grub-install /dev/sdX
grub-mkconfig -o /boot/grub/grub.cfg
```

# Done, reboot!

# Post-installation

# Make proper wpa\_supplicant file and enable dhcpcd
```
vim /etc/wpa_supplicant/wpa_supplicant-wlp4s0.conf
```
```
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
```

```
chmod 600 /etc/wpa_supplicant/wpa_supplicant-wlp4s0.conf
ln -s /usr/share/dhcpcd/hooks/10-wpa_supplicant /usr/lib/dhcpcd/dhcpcd-hooks/
systemctl enable dhcpcd@wlp4s0
```

# Make lower privileged user then enable wheel members using visudo
```
useradd -m -G wheel -s /bin/bash USERNAME
visudo
```

# Install yucky graphial stuff
```
pacman -S xorg xorg-xinit i3-wm  brightnessctl ttf-dejavu ttf-hack
pacman -S firefox xterm
pacman -S feh mpv scrot
```

# Get sound working
```
pacman -S alsa-utils alsa-plugins alsa-utils
echo "options snd_hda_intel index=1" > /etc/modprobe.d/alsa-base.conf
reboot
```
