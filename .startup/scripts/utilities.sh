#!/bin/bash
set -e

BUILD_DIR="$HOME/.startup/build"

sudo pacman -S orchis-theme xed nemo ffmpegthumbnailer icoextract gvfs lxappearance vlc vlc-plugin-mpeg2 vlc-plugin-ffmpeg libva vlc vlc-plugin-ffmpeg vlc-plugin-mpeg2

mkdir -p $BUILD_DIR

git clone https://aur.archlinux.org/librewolf-bin.git $BUILD_DIR/librewolf-bin
cd $BUILD_DIR/librewolf-bin
makepkg -si

git clone https://aur.archlinux.org/vscodium-bin.git $BUILD_DIR/vscodium-bin
cd $BUILD_DIR/vscodium-bin
makepkg -si

sudo pacman -S strawberry kvantum

# Development
sudo pacman -S wxwidgets-gtk3 gtkmm3
