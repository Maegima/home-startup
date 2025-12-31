machine=$1
user=$2
if [ $# -lt 2 ]; then
    echo "you need to specify <hostname> and <user>"
    exit 1
fi
if [ -z "$STARTUP_ROOT" ] ; then
    STARTUP_ROOT="$HOME/startup"
fi

pacman -S nano nano-syntax-highlighting bash-completion less networkmanager bluez bluez-utils
systemctl enable NetworkManager.service
systemctl enable bluetooth.service
systemctl enable fstrim.timer # trim support for ssd

echo "hostname set to '$machine'"
echo "$machine" > /etc/hostname

echo "set password for 'root'"
passwd
useradd -m -g users -G wheel,storage,power -s /bin/bash $user
echo "set password for '$user'"
passwd $user

echo "Setting locale and localtime"
cp /etc/locale.gen /etc/locale.gen.bkp
printf "\n## Written by initso\n"   >> /etc/locale.gen
printf "en_US.UTF-8 UTF-8\n"        >> /etc/locale.gen
printf "pt_BR.UTF-8 UTF-8\n"        >> /etc/locale.gen
cp $STARTUP_ROOT/.startup/configuration/locale.conf /etc/locale.conf
locale-gen
ln -s /usr/share/zoneinfo/Brazil/East /etc/localtime
hwclock --systohc --utc

echo "Enabling multilib repository"
cp /etc/pacman.conf /etc/pacman.conf.bkp
printf "\n## Written by initso\n"             >> /etc/pacman.conf
printf "[multilib]\n"                         >> /etc/pacman.conf
printf "Include = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf
pacman -Sy

echo "Editing sudoers file"
cp /etc/sudoers /etc/sudoers.bkp
printf "\n## Written by initso\n"    | EDITOR='tee -a' visudo
printf "%%wheel ALL=(ALL:ALL) ALL\n" | EDITOR='tee -a' visudo
printf "Defaults rootpw\n"           | EDITOR='tee -a' visudo
