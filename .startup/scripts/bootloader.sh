machine=$1
user=$2
if [ $# -lt 1 ]; then
    echo "you need to specify the root <device> ex.: '/dev/sda1'"
    exit 1
fi

PARTUUID=$(blkid -s PARTUUID -o value $1)
entry="/boot/loader/entries/arch.conf"
bootctl install
echo "Writing entry '$entry'"
echo "title Arch"                         >  $entry
echo "linux /vmlinuz-linux"               >> $entry
echo "initrd /initramfs-linux.img"        >> $entry
echo "options root=PARTUUID=$PARTUUID rw" >> $entry
