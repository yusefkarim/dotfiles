# Put arch on USB
```sh
dd bs=4M if=archlinux.iso of=/dev/sdX status=progress oflag=sync
```

# Boot into USB drive and setup wifi (or just plug in ethernet)
```sh
wpa_passphrase SSID PASSWORD  >> SSID.conf
wpa_supplicant -B -i wlp4s0 -c SSID.conf
dhcpcd wlp4s0
```

# Update system clock
```sh
timedatectl set-ntp true
```

# Partition disk
MBR
```sh
fdisk -l
fdisk /dev/sdX
* Delete old partitions (press o for new DOS partition table)
* Make 8-16G swap partition
* Make any extra partitions you want
* Make bootable root partition using the rest of the disk space
```

UEFI
```sh
fdisk -l
fdisk /dev/sdX
* Delete old partitions (press g for new GPT partition table)
* Make EFI system partition of size 512M
* Make 8-16G swap partition
* Make any extra partitions you want
* Make root partition using the rest of the disk space
```

# Format partitions
```sh
mkfs.ext4 /dev/sdX?   # Do the same for any extra Linux partitions
mkswap /dev/sdX?
swapon /dev/sdX?
# If doing UEFI, format the efi partition as fat:
mkfs.fat /dev/sdX?
```

# Mount file system
```sh
mount /dev/sdX? /mnt
# If doing UEFI:
mount /dev/sdX? /mnt/efi
```

# Edit mirrorlist (move better locations to the top)
```sh
vim /etc/pacman.d/mirrorlist
```

# Use pacstrap to download basic things
```sh
pacstrap /mnt base base-devel neovim dhcpcd wpa_supplicant git python3
```

# Generate Fstab file
```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

# Change root into the new system
```sh
arch-chroot /mnt
```

# Set correct time zone and hardware clock from the system clock
```sh
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
hwclock --systohc
```

# Uncomment locales then generate them
```sh
# Uncomment en_US.UTF-8 UTF-8 and en_US ISO-8859-1
vim /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
```

# Create hostname files
```sh
echo "HOSTNAME" > /etc/hostname
vim /etc/hosts
	-> 127.0.0.1	localhost
	-> ::1		localhost
	-> 127.0.1.1	HOSTNAME.localdomain	HOSTNAME
```

# Set root password
```sh
passwd
```

# Install bootloader and microcode (if on x64 CPU)
```sh
pacman -S grub intel-ucode
# If MBR:
grub-install /dev/sdX
grub-mkconfig -o /boot/grub/grub.cfg

# If UEFI:
pacman -S efibootmgr
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=ARCH_GRUB --debug --recheck
# If something goes wrong delete the entry via: efibootmgr -b XXXX -B
grub-mkconfig -o /boot/grub/grub.cfg
```

# Exit and unmount everything
```sh
exit
umount -R /mnt
```

# Done, reboot!

# Post-installation

# Make proper wpa\_supplicant file and enable dhcpcd
```sh
vim /etc/wpa_supplicant/wpa_supplicant-wlp4s0.conf
```
```txt
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

```sh
chmod 600 /etc/wpa_supplicant/wpa_supplicant-wlp4s0.conf
ln -s /usr/share/dhcpcd/hooks/10-wpa_supplicant /usr/lib/dhcpcd/dhcpcd-hooks/
systemctl enable --now dhcpcd
```

# Install some useful stuff
```sh
pacman -S sudo wget git
```

# Make lower privileged user then enable wheel members using visudo
```sh
pacman -S sudo
useradd -m -G wheel -s /bin/bash USERNAME
usermod -aG audio,video USERNAME
EDITOR=nvim visudo
```

# Install yucky graphial stuff
```sh
pacman -S xorg-server xorg-xinit i3-wm  brightnessctl ttf-dejavu ttf-hack
pacman -S firefox alacritty
pacman -S feh mpv scrot llpp
```

# Get sound working
```sh
pacman -S alsa-utils alsa-plugins pulseaudio pulseaudio-alsa
echo "options snd_hda_intel index=1" > /etc/modprobe.d/alsa-base.conf
reboot
```
