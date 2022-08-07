#!/bin/bash

cp $HOME/.bashrc bashrc_arch
cp $HOME/.screenrc screenrc
cp $HOME/.config/helix/config.toml helix/
rsync --delete-after -aAXHv --exclude plugin $HOME/.config/nvim/ nvim
cp $HOME/.config/i3/config i3/
cp $HOME/.config/i3blocks/config i3blocks/
cp $HOME/.config/alacritty/alacritty.yml alacritty/
cp /etc/unbound/unbound.conf unbound/
cp $HOME/.config/Code\ -\ OSS/User/settings.json vscode/
cp $HOME/.newsboat/{config,urls} newsboat/
cp $HOME/.config/sway/config sway/
cp $HOME/.config/waybar/{config,style.css} waybar/

