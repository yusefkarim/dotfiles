#!/bin/bash

cp $HOME/.bashrc bashrc_arch
cp $HOME/.screenrc screenrc
cp $HOME/.config/helix/config.toml helix/
cp $HOME/.config/nvim/init.lua nvim/
cp -r $HOME/.config/nvim/lua nvim/
cp $HOME/.config/i3/config i3/
cp $HOME/.config/i3blocks/config i3blocks/
cp $HOME/.config/alacritty/alacritty.yml alacritty/
cp /etc/unbound/unbound.conf unbound/
cp $HOME/.config/Code\ -\ OSS/User/settings.json vscode/
cp $HOME/.newsboat/{config,urls} newsboat/

