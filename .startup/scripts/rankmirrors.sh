#!/bin/bash
set -e

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bkp
sudo pacman -Sy pacman-contrib
rankmirrors -n 6 /etc/pacman.d/mirrorlist.bkp > /etc/pacman.d/mirrorlist
