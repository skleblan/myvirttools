#then timedatectl set-ntp true
timedatectl set-ntp true

#setup partitrion and file-system
#assume at least 8GB on hd
#4G for OS. 2G for swap
#echo "finish parted commands"
#exit 1
parted -s /dev/sda mklabel msdos
parted -s /dev/sda mkpart primary 1MiB 4GiB
parted -s /dev/sda set 1 boot on
parted -s /dev/sda mkpart primary linux-swap 4GiB 6GiB
parted -s print
mkfs.ext4 /dev/sda1 && echo "Created filesystem on /dev/sda1"
mkswap /dev/sda2 && echo "Created swap on /dev/sda2"
mount /dev/sda1 /mnt && echo "Mounted."
swapon /dev/sda2 && echo "New swap enabled"
pacstrap /mnt base linux linux-firmware dhcpcd wget vim && echo "pacstrap done"
genfstab -U /mnt >> /mnt/etc/fstab && echo "genfstab done."

#arch-chroot
echo 'run "arch-chroot /mnt". get internet. run stage2'
exit 0
