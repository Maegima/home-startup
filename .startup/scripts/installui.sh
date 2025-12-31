sudo pacman -S xorg-server xorg-xinit xorg-apps lightdm lightdm-gtk-greeter i3-wm i3lock i3status dmenu feh picom kitty ttf-hack-nerd noto-fonts-cjk
sudo systemctl enable lightdm

git clone https://aur-archlinux.org/xob.git
cd xob
makepkg -si
