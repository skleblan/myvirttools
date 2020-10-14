#set timezone
ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime
#then hwclock --systohc
hwclock --systohc
echo "clock setup"

#uncomment languages in locale.gen
mv /etc/locale.gen /etc/locale.gen.old
sed 's/# *en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen.old > /etc/locale.gen
locale-gen
#create locale.conf (LANG=en_us.UTF-8)
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "language configured"

#create vconsole.conf (KEYMAP=us)
echo "KEYMAP=us" > /etc/vconsole.conf
#create hostname file
echo "archskl" > /etc/hostname
echo "hostname and keyboard set"

#optional: run pacman for other things if needed
#grub vim man-pages man-db dhcpcd wget
pacman -S --noconfirm grub vim man-pages man-db && echo "installed man pages, vim, and wget"

#set root password

#setup grub
grub-install /dev/sda && echo "grub core img installed"
#optional: modify default grub for serial comm
sed '/GRUB_CMDLINE_LINUX_DEFAULT/c\
GRUB_CMDLINE_LINUX_DEFAULT="quiet console=ttyS0"
/GRUB_CMDLINE_LINUX/c\
GRUB_CMDLINE_LINUX="console=ttyS0"' /etc/default/grub >modgrub
mv modgrub /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg && echo "grub config file generated"
