#!/bin/bash
sudo pacman -S orchis-theme xed nemo tumbler gvfs lxappearance vlc vlc-plugin-mpeg2 vlc-plugin-ffmpeg libva

git clone https://aur.archlinux.org/icoextract.git
cd icoextract
makepkg -si

git clone https://aur.archlinux.org/librewolf-bin.git
cd librewolf-bin
makepkg -si

git clone https://aur.archlinux.org/vscodium-bin.git
cd vscodium-bin
makepkg -si
