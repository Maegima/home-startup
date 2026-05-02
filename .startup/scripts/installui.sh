#!/bin/bash
set -e

BUILD_DIR="$HOME/.startup/build"

sudo pacman -S xorg-server xorg-xinit xorg-apps lightdm lightdm-gtk-greeter i3-wm i3lock i3status dmenu feh picom kitty ttf-hack-nerd ttf-droid noto-fonts-cjk
sudo systemctl enable lightdm

mkdir -p $BUILD_DIR
git clone https://aur-archlinux.org/xob.git $BUILD_DIR/xob
cd $BUILD_DIR/xob
makepkg -si
