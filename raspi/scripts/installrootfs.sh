#!/bin/bash

echo "Installing root fs..."
umount /dev/sdb1
umount /dev/sdb2
sudo mkfs.ext4 -i 1024 -L rootfs /dev/sdb2
sudo mount /dev/sdb2 /mnt
cd /mnt
sudo tar xvf $1/../images/rootfs.tar
cd $1
sudo umount /dev/sdb2

echo "Installing kernel..."
sudo mount /dev/sdb1 /mnt
~/embedded/raspi/github-raspberry/tools/mkimage/mkknlimg  $1/../images/zImage $1/../images/zImage.dt
sudo cp $1/../images/zImage.dt /mnt/kernel.img
sudo cp $1/../images/zImage.dt /mnt/kernel7.img
sudo umount /dev/sdb1
