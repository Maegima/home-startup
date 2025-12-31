#!/bin/bash

sudo pacman -S wine wine-gecko wine-mono winetricks vulkan-tools vulkan-icd-loader lib32-vulkan-icd-loader gnutks antimicrox gamemode

sudo pacman -S lib32-gnutls lib32-libldap lib32-mpg123 lib32-openal lib32-v4l-utils lib32-libpulse lib32-alsa-plugins lib32-libxcomposite lib32-libxinerama lib32-ncurses lib32-libxml2 lib32-freetype2 lib32-libpng lib32-sdl2 lib32-gamemode

sudo pacman -S lutris steam

git clone https://aur.archlinux.org/honkers-launcher-bin.git
cd honkers-launcher-bin
makepkg -si




