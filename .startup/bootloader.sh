PARTUUID=$(blkid -s PARTUUID -o value $1)
echo "title Arch"
echo "linux /vmlinuz-linux"
echo "initrd /initramfs-linux.img"
echo "options root=PARTUUID=$PARTUUID rw"
