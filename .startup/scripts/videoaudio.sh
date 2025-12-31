#!/bin/bash
sudo pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-jack
sudo pacman -S pavucontrol pasystray pamixer
systemctl --user enable pipewire-pulse.service
systemctl --user start pipewire-pulse.service

sudo pacman -S linux-headers nvidia-dkms libglvnd nvidia-utils opencl-nvidia \
lib32-libglvnd lib32-nvidia-utils lib32-opencl-nvidia nvidia-settings

